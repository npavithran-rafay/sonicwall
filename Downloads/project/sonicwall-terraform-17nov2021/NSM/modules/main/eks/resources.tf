#----------------------------------#
#Store the state file in S3 Bucket #
#----------------------------------#
# terraform {
#   # The configuration for this backend will be filled in by Terragrunt
#   backend "s3" {}
# }

#-----------------------------#
#create EKS VPC resources         #
#-----------------------------#

module "vpc" {
  source = "../../../modules/infrastructure/eks_vpc"

  aws_region       = "${var.region}"
  vpc_tag_name     = "${var.vpc_name}"
  vpc_cidr         = "${var.vpccidr}"
  eks_cluster_name = "${var.eks_cluster_name}"

  ig_gw_tag_name      = "${var.ig_gw_name}"
  nat_gw_tag_name     = "${var.nat_gw_name}"
  nat_gw_eip_tag_name = "${var.nat_gw_eip_name}"

  public_route_table_tag_name  = "${var.public_routetable_name}"
  private_route_table_tag_name = "${var.private_routetable_name}"

  az-private-subnet-mapping = ["${var.private_az_subnets_cidr }"]
  az-public-subnet-mapping  = ["${var.public_az_subnets_cidr  }"]
}

#---------------------------------------------------#
#create the Default Security Group for EKS Master   #
#---------------------------------------------------#

module "vpc_sg_eksmaster" {
  source         = "../../../modules/infrastructure/security/group"
  vpc_id         = "${module.vpc.vpc_id}"
  sg_name        = "${var.eksmaster_sg_name}"
  sg_description = "${var.eksmaster_sg_description}"
}

#---------------------------------------------------#
#Create the Default Security Groups Rules for Linux #
#---------------------------------------------------#

#---------#
#Ingress  #
#---------#

#allow all ports, restriction & ports are control via the VPN firewall
module "vpc_sg_eksmaster_ingress_rules" {
  source       = "../../../modules/infrastructure/security/rule"
  sg_id        = "${module.vpc_sg_eksmaster.sgid}"
  sg_rule_type = "ingress"
  ports        = "${var.sg_eksmaster_tcp_inbound_ports}"
  cidr         = ["${var.sg_eksmaster_tcp_ingress_cidr}"]
  protocol     = "${var.sg_eksmaster_tcp_protocol}"
  description  = "${var.sg_eksmaster_description}"
}

module "vpc_sg_eksmaster_ingress_rules_all" {
  source       = "../../../modules/infrastructure/security/rule"
  sg_id        = "${module.vpc_sg_eksmaster.sgid}"
  sg_rule_type = "ingress"
  ports        = "${var.sg_eksmaster_all_inbound_ports}"
  cidr         = ["${var.sg_eksmaster_all_ingress_cidr}"]
  protocol     = "${var.sg_eksmaster_all_protocol}"
  description  = "${var.sg_eksmaster_all_description}"
}

#--------#
#Egress  #
#--------#

module "vpc_sg_eksmaster_engress_rules" {
  source       = "../../../modules/infrastructure/security/rule"
  sg_id        = "${module.vpc_sg_eksmaster.sgid}"
  sg_rule_type = "egress"
  ports        = "0"
  cidr         = ["0.0.0.0/0"]
  protocol     = "-1"
  description  = "Allow all outbound traffic"
}

#---------------------------------------------------#
#create the Default Security Group for EKS worker   #
#---------------------------------------------------#

module "vpc_sg_eksworker" {
  source         = "../../../modules/infrastructure/security/group"
  vpc_id         = "${module.vpc.vpc_id}"
  sg_name        = "${var.eks_sg_name}"
  sg_description = "${var.eks_sg_description}"
}

#---------------------------------------------------#
#Create the Security Groups Rules for EKS worker    #
#---------------------------------------------------#

#---------#
#Ingress  #
#---------#

module "vpc_sg_eksworker_ingress_rules" {
  source       = "../../../modules/infrastructure/security/rule"
  sg_id        = "${module.vpc_sg_eksworker.sgid}"
  sg_rule_type = "ingress"
  ports        = "${var.sg_eksworker_tcp_inbound_ports}"
  cidr         = ["${var.sg_eksworker_tcp_ingress_cidr}"]
  protocol     = "${var.sg_eksworker_tcp_protocol}"
  description  = "${var.sg_eksworker_description}"
}

#--------#
#Egress  #
#--------#

module "vpc_sg_eksworker_engress_rules" {
  source       = "../../../modules/infrastructure/security/rule"
  sg_id        = "${module.vpc_sg_eksworker.sgid}"
  sg_rule_type = "egress"
  ports        = "0"
  cidr         = ["0.0.0.0/0"]
  protocol     = "-1"
  description  = "Allow all outbound traffic"
}

#-----------------------------#
#create EKS Cluster resources #
#-----------------------------#

module "eks_node_group" {
  source = "../../../modules/infrastructure/eks_master_nodes_aws_node_group_workers"

  #eks master config
  eks_iam_role_name   = "${var.eks_iam_role_name}"
  eks_cluster_name    = "${var.eks_cluster_name}"
  eks_cluster_version = "${var.eks_cluster_version}"

  eks_cluster_log_types = ["${var.eks_cluster_log_types}"]
  retention_days        = "${var.log_retention_days}"

  eks_subnet_ids          = ["${module.vpc.public_subnets_ids}", "${module.vpc.private_subnets_ids}"]
  eks_security_groups_ids = ["${module.vpc_sg_eksmaster.sgid}"]
  eks_endpoint_public_access = "${var.eks_endpoint_public_access}" 
  eks_endpoint_private_access = "${var.eks_endpoint_private_access}" 

  bu                      = "${var.bu}"
  application             = "${var.application}"
  tag_environment         = "${var.tag_environment}"
  tag_region              = "${var.tag_region}"

  #eks worker node group
  eks_cluster_node_group_name = "${var.eks_node_group_name}"
  eks_worker_subnet_ids       = ["${module.vpc.private_subnets_ids}"]
  eks_workernode_iam_role_name= "${var.eks_node_group_iam_role}"
  ami_type                    = "${var.ami_type}"
  instance_type               = ["${var.instance_type}"]
  volume_size                 = "${var.root_volume_size}"

  desired_capacity = "${var.desired_capacity}"
  max_size         = "${var.max_size}"
  min_size         = "${var.min_size}"

  ec2_ssh_key                    = "${var.ec2_ssh_key}"
  eks_worker_security_groups_ids = ["${module.vpc_sg_eksworker.sgid}"]
}

#-----------------------------#
#EKS Cluster kubeconfig       #
#-----------------------------#
resource "local_file" "kubeconfig" {
  content  = "${local.kubeconfig}"
  filename = "/tmp/kube/config"
}

#-----------------------------#
#EKS config map aws auth      #
#-----------------------------#

resource "local_file" "config_map_aws_auth" {
  content  = "${local.config_map_aws_auth}"
  filename = "/tmp/kube/config_map_aws_auth"
}

#module "eks_node_gitea_group" {
#  source = "../../../../modules/infrastructure/eks_aws_node_group_workers"

  #eks worker node group
#  eks_cluster_name            = "${var.eks_cluster_name}"
#  eks_cluster_version         = "${var.eks_cluster_version}"
#  eks_cluster_node_group_name = "${var.eks_node_group_gitea_name}"
#  eks_worker_node_role_arn    = "${module.eks_node_group.eks_worker_role_arn}"
#  eks_worker_subnet_ids       = ["${var.eks_gitea_subnet_ids}"]
#  ami_type                    = "${var.ami_type}"
#  instance_type               = ["${var.node_group_gitea_instance_type}"]
#  volume_size                 = "${var.root_volume_size}"

#  desired_capacity = "${var.desired_capacity_gitea}"
#  max_size         = "${var.max_size_gitea}"
#  min_size         = "${var.min_size_gitea}"
#
#  ec2_ssh_key                    = "${var.ec2_ssh_key}"
#  eks_worker_security_groups_ids = ["${module.vpc_sg_eksworker.sgid}"]
#}

module "eks_node_gitea_group_new" {
  source = "../../../modules/infrastructure/eks_aws_node_group_workers"

  #eks worker node group
  eks_cluster_name            = "${var.eks_cluster_name}"
  eks_cluster_version         = "${var.eks_cluster_version}"
  eks_cluster_node_group_name = "${var.eks_node_group_gitea_new_name}"
  eks_worker_node_role_arn    = "${module.eks_node_group.eks_worker_role_arn}"
  eks_worker_subnet_ids       = ["${var.eks_gitea_new_subnet_ids}"]
  ami_type                    = "${var.ami_type}"
  instance_type               = ["${var.node_group_gitea_new_instance_type}"]
  volume_size                 = "${var.root_volume_size}"

  desired_capacity = "${var.desired_capacity_gitea_new}"
  max_size         = "${var.max_size_gitea_new}"
  min_size         = "${var.min_size_gitea_new}"

  ec2_ssh_key                    = "${var.ec2_ssh_key}"
  eks_worker_security_groups_ids = ["${module.vpc_sg_eksworker.sgid}"]
}

module "eks_node_neo4j_group_new" {
  source = "../../../modules/infrastructure/eks_aws_node_group_workers"

  #eks worker node group
  eks_cluster_name            = "${var.eks_cluster_name}"
  eks_cluster_version         = "${var.eks_cluster_version}"
  eks_cluster_node_group_name = "${var.eks_node_group_neo4j_new_name}"
  eks_worker_node_role_arn    = "${module.eks_node_group.eks_worker_role_arn}"
  eks_worker_subnet_ids       = ["${var.eks_neo4j_new_subnet_ids}"]
  ami_type                    = "${var.ami_type}"
  instance_type               = ["${var.node_group_neo4j_new_instance_type}"]
  volume_size                 = "${var.root_volume_size}"

  desired_capacity = "${var.desired_capacity_neo4j_new}"
  max_size         = "${var.max_size_neo4j_new}"
  min_size         = "${var.min_size_neo4j_new}"

  ec2_ssh_key                    = "${var.ec2_ssh_key}"
  eks_worker_security_groups_ids = ["${module.vpc_sg_eksworker.sgid}"]
}

