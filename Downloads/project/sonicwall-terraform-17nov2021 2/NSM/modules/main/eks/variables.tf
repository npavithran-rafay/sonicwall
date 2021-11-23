####################################
#aws info
###################################
variable "aws_access_key" {}

variable "aws_secret_key" {}

variable "region" {
  description = "Region for the VPC"
  #default     = ""
}

#####################################
# VPC variables
####################################
variable "vpc_name" {
  description = "name of the VPC"
  #default     = "Terraform-created"
}

variable "vpccidr" {
  description = "VPC cidr block"
}

variable "ig_gw_name" {
  description = "Internet Gateway Name"
  #default     = "Terraform-created-IG"
}

variable "nat_gw_name" {
  description = "NAT Gateway Name"
  #default     = "Terraform-created-NATGW"
}

variable "nat_gw_eip_name" {
  description = "NAT Gateway public IP name"
  #default     = "Terraform-created-Public-IP-NATGW"
}

variable "public_routetable_name" {
  description = "Public route table name"
  #default     = "Terraform-created-RTB-Public"
}

variable "private_routetable_name" {
  description = "Private route table name"
  #default     = "Terraform-created-RTB-Private"
}

variable "private_az_subnets_cidr" {
  type        = "list"
  description = "Private subnets mapping"
}

variable "public_az_subnets_cidr" {
  type        = "list"
  description = "Pubic subnets mapping"
}

###############################
#eksmaster  Security Group
###############################
variable "eksmaster_sg_name" {
  description = "Security Group name"
  #default     = "Terraform-created-sg"
}

variable "eksmaster_sg_description" {
  description = "Security Group description"
  #default     = "Terraform-created-group"
}

######################################
#eksmaster Security Group Ingress rule
######################################

variable "sg_eksmaster_tcp_inbound_ports" {
  description = "inbound ports to allow"
  #default     = ""
}

variable "sg_eksmaster_tcp_protocol" {
  description = "TCP | UDP"
  #default     = ""
}

variable "sg_eksmaster_tcp_ingress_cidr" {
  description = "allowed subnets"
  type        = "list"
  #default     = []
}

variable "sg_eksmaster_description" {
  description = "rule descriptions"
  #default     = ""
}

#######################################
#EKS Cluster Variables
######################################
variable "eks_cluster_name" {
  description = "eks cluster name required"
}

variable "eks_iam_role_name" {
  description = "eks iam role "
  #default     = "eks-cluster-iamrole-terraform"
}

variable "eks_cluster_version" {
  description = "eks cluster version"
}

variable "eks_cluster_log_types" {
  description = "eks cluster log type api audit authenticator controller manager scheduler "
  type        = "list"
  #default     = []
}
variable "eks_endpoint_private_access" {}
variable "eks_endpoint_public_access" {}
variable "log_retention_days" {
  description = "log retention days"
  #default     = "7"
}

# variable "eks_subnet_ids" {
#   description = "list of subnets for eks cluster"
#   type        = "list"
#   default     = []
# }

variable "eks_security_groups_ids" {
  description = "list of security groups id"
  type        = "list"
  #default     = []
}

variable "bu" {
  #default     = "terraform"
  description = "Bussiness unit."
  type        = "string"
}

variable "application" {
  #default     = "terraform"
  description = "application name."
  type        = "string"
}

variable "tag_environment" {
  #default     = "terraform-created"
  description = "environment - prod, sim etc."
  type        = "string"
}

variable "tag_region" {
  #default     = "terraform-created"
  description = "name of the region."
  type        = "string"
}

#######################################
#EKS Cluster Worker Variables
######################################

variable "eks_node_group_name" {
  description = "eks cluster nodes group name"
  #default     = "eks-worknode-cluster-terraform"
}

variable "eks_node_group_iam_role" {
  description = "eks nodegroup iam role "
  #default     = "eks-worker-iamrole-terraform"
}

variable "instance_type" {
  description = "instance type for the lauch config"
  type        = "list"
  #default     = ["m5.large"]
}

variable "ami_type" {
  description = "ami type Valid values AL2_x86_64 AL2_x86_64_GPU"
  #default     = "AL2_x86_64"
}

variable "ec2_ssh_key" {
  description = "ec2 ssh key for worker nodes"
  #default     = ""
}

#root volume variables

variable "root_volume_size" {
  description = "The size of the volume in gibibytes (GiB)."
  #default     = "25"
}

variable "desired_capacity" {
  description = "desired capacity"
  #default     = "4"
}

variable "max_size" {
  description = "The maximum size of the auto scale group"
  #default     = "8"
}

variable "min_size" {
  description = "The minimum size of the auto scale group"
  #default     = "2"
}

############################################
# EKS workers security group  variables
###########################################

variable "eks_sg_name" {
  description = "Security Group name"
  #default     = "Terraform-created-sg-eks-worker"
}

variable "eks_sg_description" {
  description = "Security Group description"
  #default     = "Terraform-created-group"
}

##########################################################
# EKS workers security group  variables Ingress rule
#########################################################

variable "sg_eksworker_tcp_inbound_ports" {
  description = "inbound ports to allow"
  # #default     = ""
}

variable "sg_eksworker_tcp_protocol" {
  description = "TCP | UDP"
  #default     = ""
}

variable "sg_eksworker_tcp_ingress_cidr" {
  description = "allowed subnets"
  type        = "list"
  #default     = []
}

variable "sg_eksworker_description" {
  description = "rule descriptions"
  #default     = ""
}


variable "sg_eksmaster_all_inbound_ports" {
  description = "inbound ports to allow"
  #default     = ""
}

variable "sg_eksmaster_all_protocol" {
  description = "TCP | UDP"
  #default     = ""
}

variable "sg_eksmaster_all_ingress_cidr" {
  description = "allowed subnets"
  type        = "list"
  #default     = []
}

variable "sg_eksmaster_all_description" {
  description = "rule descriptions"
  #default     = ""
}

#####################################################
# add additional node group - gitea
######################################################

#variable "eks_node_group_gitea_name" {
#  description = "eks cluster nodes group name"
#  #default     = "eks-worknode-cluster-terraform"
#}

#variable "node_group_gitea_instance_type" {
#  description = "instance type for the new m5x node group"
#  type        = "list"
#  #default     = ["m5.xlarge"]
#}

#variable "desired_capacity_gitea" {
#  description = "desired capacity"
#  #default     = "1"
#}

#variable "max_size_gitea" {
#  description = "The maximum size of the auto scale group"
#  #default     = "2"
#}

#variable "min_size_gitea" {
#  description = "The minimum size of the auto scale group"
#  #default     = "1"
#}

#variable "eks_gitea_subnet_ids" {
#  description = "subnet ID's to have the gitea instance running to. It should match the current gitea pod subnet"
#  type        = "list"
#  #default     = []
#}

#####################################################
# add additional node group - gitea-new nodegroup
######################################################

variable "eks_node_group_gitea_new_name" {
  description = "eks cluster nodes group name"
  #default     = "eks-worknode-cluster-terraform"
}

variable "node_group_gitea_new_instance_type" {
  description = "instance type for the new m5x node group"
  type        = "list"
  #default     = ["m5.xlarge"]
}

variable "desired_capacity_gitea_new" {
  description = "desired capacity"
  #default     = "1"
}

variable "max_size_gitea_new" {
  description = "The maximum size of the auto scale group"
  #default     = "2"
}

variable "min_size_gitea_new" {
  description = "The minimum size of the auto scale group"
  #default     = "1"
}

variable "eks_gitea_new_subnet_ids" {
  description = "subnet ID's to have the gitea instance running to. It should match the current gitea pod subnet"
  type        = "list"
  # #default     = []
}

#####################################################
# add additional node group - neo4j-new nodegroup
######################################################

variable "eks_node_group_neo4j_new_name" {
  description = "eks cluster nodes group name"
  #default     = "eks-worknode-cluster-terraform"
}

variable "node_group_neo4j_new_instance_type" {
  description = "instance type for the new m5x node group"
  type        = "list"
  #default     = ["m5.xlarge"]
}

variable "desired_capacity_neo4j_new" {
  description = "desired capacity"
  #default     = "1"
}

variable "max_size_neo4j_new" {
  description = "The maximum size of the auto scale group"
  #default     = "2"
}

variable "min_size_neo4j_new" {
  description = "The minimum size of the auto scale group"
  #default     = "1"
}

variable "eks_neo4j_new_subnet_ids" {
  description = "subnet ID's to have the neo4j instance running to. It should match the current neo4j pod subnet"
  type        = "list"
  # default     = ["xx"]
}
