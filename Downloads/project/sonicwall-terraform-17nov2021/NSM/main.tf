
#--------------------------------------------------------------------------#
# VPC module
#--------------------------------------------------------------------------#
module "vpc" {
  source = "./modules/main/vpc"

  #global
  aws_access_key            = "${var.aws_access_key}"
  aws_secret_key            = "${var.aws_secret_key}"
  region                    = "${var.region}"
####
  production_vpc_id         = "${var.production_vpc_id}"
  az-private-subnet-mapping = "${var.az-private-subnet-mapping}"

#---------------------------------------------#
#create the Default Security Group for CGMS   #
#---------------------------------------------#
  cgms_sg_name    = "${var.cgms_sg_name}"
  cgms_sg_description = "${var.cgms_sg_description}"
#---------------------------------------------------#
#create the Default Security Groups Rules for CGMS  #
#--------------------------------------------------#

#---------#
#Ingress  #
#---------#
#allow all ports, restriction & ports are control via the VPN firewall
  sg_cgms_inbound_ports   = "${var.sg_cgms_inbound_ports}"
  cgms_ingress_cidr       = "${var.cgms_ingress_cidr}"
  sg_cgms_protocol        = "${var.sg_cgms_protocol}"
  sg_cgms_description     = "${var.sg_cgms_description}"
#allow specific ports,to the EC2 instances since NLB passes client IP to EC2
  sg_cgms_inbound_ports_nlb   = "${var.sg_cgms_inbound_ports_nlb}"
  cgms_ingress_cidr_nlb       = "${var.cgms_ingress_cidr_nlb}"
  sg_cgms_protocol_nlb        = "${var.sg_cgms_protocol_nlb}"
  sg_cgms_description_nlb     = "${var.sg_cgms_description_nlb}"

  sg_cgms_apisrv_inbound_ports_nlb  = "${var.sg_cgms_apisrv_inbound_ports_nlb}"
  cgms_apisrv_ingress_cidr_nlb      = "${var.cgms_apisrv_ingress_cidr_nlb}"
  sg_cgms_apisrv_description_nlb    = "${var.sg_cgms_apisrv_description_nlb}"
#UDP allow
  sg_cgms_udp_inbound_ports         = "${var.sg_cgms_udp_inbound_ports}"
  cgms_udp_ingress_cidr             = "${var.cgms_udp_ingress_cidr}"
  sg_cgms_udp_protocol              = "${var.sg_cgms_udp_protocol}"
  sg_cgms_udp_description           = "${var.sg_cgms_udp_description}"
#---------------------------------------------#
#create the LB Security Group for CGMS        #
#---------------------------------------------#
  cgms_lb_sg_name         = "${var.cgms_lb_sg_name}"
  cgms_lb_sg_description  = "${var.cgms_lb_sg_description}"
#---------------------------------------------#
#create the LB Security Group for CASS        #
#---------------------------------------------#
  cass_lb_sg_name         = "${var.cass_lb_sg_name}"
  cass_lb_sg_description  = "${var.cass_lb_sg_description}"
#------------------------------------------#
#create the LB  Security Groups Rules      #
#------------------------------------------#

#---------#
#Ingress  #
#---------#

#allow ports to the LB Public
  sg_cass_lb_tcp_inbound_ports    = "${var.sg_cass_lb_tcp_inbound_ports}"
  cass_lb_tcp_ingress_cidr        = "${var.cass_lb_tcp_ingress_cidr}"
  sg_cass_lb_tcp_protocol         = "${var.sg_cass_lb_tcp_protocol}"
  sg_cass_lb_tcp_description      = "${var.sg_cass_lb_tcp_description}"
#allow ssh internal access to the LB servers only
  sg_cass_lb_tcp_internal_inbound_ports = "${var.sg_cass_lb_tcp_internal_inbound_ports}"
  cass_lb_tcp_ingress_cidr_internal     = "${var.cass_lb_tcp_ingress_cidr_internal}"
  sg_cass_lb_tcp_description_internal   = "${var.sg_cass_lb_tcp_description_internal}"
#-----------------------------------------#
# create Linux Security Group
#-----------------------------------------#
  linux_sg_name       = "${var.linux_sg_name}"
  linux_sg_description  = "${var.linux_sg_description}"

#---------------------------------------------------#
#Create the Default Security Groups Rules for Linux #
#---------------------------------------------------#

#---------#
#Ingress  #
#---------#
  sg_linux_tcp_inbound_ports  = "${var.sg_linux_tcp_inbound_ports}"
  linux_tcp_ingress_cidr      = "${var.linux_tcp_ingress_cidr}"
  sg_linux_tcp_protocol       = "${var.sg_linux_tcp_protocol}"
  sg_linux_description        = "${var.sg_linux_description}"

  sg_linux_9080_tcp_inbound_ports   = "${var.sg_linux_9080_tcp_inbound_ports}"
  linux_tcp_9080_ingress_cidr       = "${var.linux_tcp_9080_ingress_cidr}"
  sg_linux_9080_tcp_protocol        = "${var.sg_linux_9080_tcp_protocol}"
  sg_linux_9080_description         = "${var.sg_linux_9080_description}"

  sg_cgms_redshift_inbound_ports    = "${var.sg_cgms_redshift_inbound_ports}"
  sg_cgms_redshift_ingress_cidr     = "${var.sg_cgms_redshift_ingress_cidr}"
  sg_cgms_redshift_protocol         = "${var.sg_cgms_redshift_protocol}"
  sg_cgms_redshift_description      = "${var.sg_cgms_redshift_description}"

}

#--------------------------------------------------------------------------#
# IAM module
#--------------------------------------------------------------------------#
module "iam" {
  source = "./modules/main/iam/nsm"

  aws_access_key  = "${var.aws_access_key}"
  aws_secret_key  = "${var.aws_secret_key}"
  region          = "${var.region}"
}

#--------------------------------------------------------------------------#
# S3 module
#--------------------------------------------------------------------------#
module "s3" {
  source = "./modules/main/s3/nsm"

  aws_access_key  = "${var.aws_access_key}"
  aws_secret_key  = "${var.aws_secret_key}"
  region          = "${var.region}"
#gitea
  bucket_name_gitea   = "${var.bucket_name_gitea}"
  acl_gitea           = "${var.acl_gitea}"
  #lifecycle_name      = "${var.lifecycle_name}"
  storage_class       = "${var.storage_class}"
#reportlite
  bucket_name_reportlite   = "${var.bucket_name_reportlite}"
  acl_reportlite           = "${var.acl_reportlite}"
}

#--------------------------------------------------------------------------#
# redshift module
#--------------------------------------------------------------------------#
module "redshift" {
  source = "./modules/main/redshift"

  aws_access_key  = "${var.aws_access_key}"
  aws_secret_key  = "${var.aws_secret_key}"
  region          = "${var.region}"

  subnet_grp_enabled         = "${var.subnet_grp_enabled}"
  subgrp_name                = "${var.subgrp_name}"
  subnet_ids                 = ["${var.subnet_ids}"]
  parameter_gname_enabled    = "${var.parameter_gname_enabled}"
  parameter_gname            = "${var.parameter_gname}"
  name                       = "${var.name}"
  database_name              = "${var.database_name}"
  isencrypted                = "${var.isencrypted}"
  #copy_options1              = "${var.copy_options1}"
#  role_arns                 = [" "]
  master_password            = "${var.master_password}"
  master_username            = "${var.master_username}"
  node_type                  = "${var.node_type}"
  number_of_nodes            = "${var.number_of_nodes}"
  enhancedvpc                = "${var.enhancedvpc}"
  publicly_accessible        = "${var.publicly_accessible}"
  BU                         = "${var.BU}"
  securitygrp_ids            = ["${var.securitygrp_ids}"]
}

#--------------------------------------------------------------------------#
# mariadB module
#--------------------------------------------------------------------------#
module "mariadB" {
  source = "./modules/main/mariadB/nsm"

  aws_access_key  = "${var.aws_access_key}"
  aws_secret_key  = "${var.aws_secret_key}"
  region          = "${var.region}" 

#dB subnetgroup
  db_subnet_group_name        = "${var.db_subnet_group_name}"
  db_subnet_ids               = "${var.db_subnet_group}"
#dB instance
  rds_identifier              = "${var.rds_identifier}"
  engine                      = "${var.engine}"
  engine_version              = "${var.engine_version}"
  instance_class              = "${var.instance_class}"
  allocated_storage           = "${var.allocated_storage}"
  storage_type                = "${var.storage_type}"
  db_name                     = "${var.db_name}"
  db_master_username                 = "${var.db_master_username}"
  db_master_password                    = "${var.db_master_password}"
  db_port                        = "${var.db_port}"
  db_vpc_security_group_ids      = "${var.db_vpc_security_group_ids}"
  multi_az                    = "${var.multi_az}"
  publicly_accessible         = "${var.dB_publicly_accessible}"
  apply_immediately           = "${var.apply_immediately}"
  allow_major_version_upgrade = "${var.allow_major_version_upgrade}"
  auto_minor_version_upgrade  = "${var.auto_minor_version_upgrade}"
  deletion_protection         = "${var.deletion_protection}"
  skip_final_snapshot         = "${var.skip_final_snapshot}"
  db_backup_retention_period     = "30"
  db_backup_window               = "00:15-01:15"
  tags                        = "${var.tags}"
}

#--------------------------------------------------------------------------#
# kinesis_firehose module
#--------------------------------------------------------------------------#
module "kinesis_firhose" {
  source  = "./modules/main/kinesis_firehose"

  aws_access_key  = "${var.aws_access_key}"
  aws_secret_key  = "${var.aws_secret_key}"
  region          = "${var.region}"

## IAM role and Policy creation step      ##
  iam_role_name         = "${var.iam_role_name}"
  iam_role_policy_name  = "${var.iam_role_policy_name}"
##Policy attachment to Eks-worker-role for firehose access ##
  arn_deliverystream    = "${var.arn_deliverystream}"
## AWS S3 creation step            ##
  bucketname            = "${var.bucketname}"
  acl                   = "${var.acl}"
##Modules for creating firehose streams ##
  destination           = "${var.destination}"
  clusterjdbc           = "${var.clusterjdbc}"
  master_username       = "${var.master_username}"
  master_password       = "${var.master_password}"
  firehosename1         = "${var.firehosename1}"
  datatablename1        = "${var.datatablename1}"
  copy_options          = "${var.copy_options}"
  bu                    = "${var.bu}"
  application           = "${var.application}"
  tag_environment       = "${var.tag_environment}"
  tag_region            = "${var.tag_region}"

  firehosename2         = "${var.firehosename2}"
  datatablename2        = "${var.datatablename2}"

  firehosename3         = "${var.firehosename3}"
  datatablename3        = "${var.datatablename3}"

  firehosename4         = "${var.firehosename4}"
  datatablename4        = "${var.datatablename4}" 

  firehosename5         = "${var.firehosename5}"
  datatablename5        = "${var.datatablename5}"

  firehosename6         = "${var.firehosename6}"
  datatablename6        = "${var.datatablename6}"

  firehosename7         = "${var.firehosename7}"
  datatablename7        = "${var.datatablename7}"

  firehosename8         = "${var.firehosename8}"
  datatablename8        = "${var.datatablename8}"

  firehosename9         = "${var.firehosename9}"
  datatablename9        = "${var.datatablename9}"

  firehosename10         = "${var.firehosename10}"
  datatablename10        = "${var.datatablename10}"

  firehosename11         = "${var.firehosename11}"
  datatablename11        = "${var.datatablename11}"

  firehosename12         = "${var.firehosename12}"
  datatablename12        = "${var.datatablename12}"

  firehosename13         = "${var.firehosename13}"
  datatablename13        = "${var.datatablename13}"

  firehosename14         = "${var.firehosename14}"
  datatablename14        = "${var.datatablename14}"

  firehosename15         = "${var.firehosename15}"
  datatablename15        = "${var.datatablename15}"

  firehosename16         = "${var.firehosename16}"
  datatablename16        = "${var.datatablename16}"

  firehosename17         = "${var.firehosename17}"
  datatablename17        = "${var.datatablename17}"

  firehosename18         = "${var.firehosename18}"
  datatablename18        = "${var.datatablename18}"

  firehosename19         = "${var.firehosename19}"
  datatablename19        = "${var.datatablename19}" 
}

#--------------------------------------------------------------------------#
# elasticsearch module
#--------------------------------------------------------------------------#
module "elasticsearch_domain" {
  source = "./modules/main/elasticsearch/nsm"

  aws_access_key  = "${var.aws_access_key}"
  aws_secret_key  = "${var.aws_secret_key}"
  region          = "${var.region}" 

  domain_name        = "${var.domain_name}"
  es_version         = "${var.es_version}"
  subnet_ids         = "${var.elasticsearch_subnet_ids}"
  security_group_ids = "${var.security_group_ids}"

  ebs_size = "${var.ebs_size}"
  ebs_type = "${var.ebs_type}"
  ebs_iops = "${var.ebs_iops}"

  master_instance_count = "${var.master_instance_count}"
  master_instance_type  = "${var.master_instance_type}"

  data_instance_count = "${var.data_instance_count}"
  data_instance_type  = "${var.data_instance_type}"

  zone_awareness = "${var.zone_awareness}"
  az_count       = "${var.az_count}"

  node_to_node_encryption = "${var.node_to_node_encryption}"

  create_service_linked_role = "${var.create_service_linked_role}"

  //LOGGING
  log_publishing_index_enabled       = "${var.log_publishing_index_enabled}"
  log_publishing_search_enabled      = "${var.log_publishing_search_enabled}"
  log_publishing_application_enabled = "${var.log_publishing_application_enabled}"

  //TAGS
  env     = "${var.env}"
  BU      = "${var.BU}"
  appname = "${var.appname}"

}

#--------------------------------------------------------------------------#
# elasticache module
#--------------------------------------------------------------------------#
module "elasticache" {
  source = "./modules/main/elasticache/nsm"

  aws_access_key  = "${var.aws_access_key}"
  aws_secret_key  = "${var.aws_secret_key}"
  region          = "${var.region}"

  eng_name                 = "${var.eng_name}"
  numcache          = "${var.numcache}"
  nodetype                  = "${var.nodetype}"
  par_name             = "${var.par_name}"
  replication_enabled         = true
  repl_grp                 = "${var.repl_grp}"
  eng_ver                  = "${var.eng_ver}"
  port                        = "${var.port}"
  maintenance_win         = "${var.maintenance_win}"
  snap_win             = "${var.snap_win}"
  snap_reten_limit    = "${var.snap_reten_limit}"
  automatic_failover  = "${var.automatic_failover}"
  apply_immediately           = "${var.redis_apply_immediately}"
  description                 = "${var.description}"
  sn_grp_name           = "${var.sn_grp_name}"
  sg_ids                      = ["${var.sg_ids}"]
  ec_az                       = [""]

## TAGS ##
  name_tag                    = "${var.name_tag}"
  enviroment_tag              = "${var.enviroment_tag}"
  bu_tag                      = "${var.bu_tag}"

## Subnet group ## 
  sn_ids                  = ["${var.sn_ids}"]
  sn_grp_desc         = "${var.sn_grp_desc}"
}

#--------------------------------------------------------------------------#
# eks module
#--------------------------------------------------------------------------#
module "eks" {
  source = "./modules/main/eks"

  aws_access_key  = "${var.aws_access_key}"
  aws_secret_key  = "${var.aws_secret_key}"
  region          = "${var.region}"
  
####eks vpc
  vpc_name         = "${var.vpc_name}"
  vpccidr          = "${var.vpccidr}"
  eks_cluster_name = "${var.eks_cluster_name}"
  eks_security_groups_ids = "${var.eks_security_groups_ids}"

  ig_gw_name      = "${var.ig_gw_name}"
  nat_gw_name     = "${var.nat_gw_name}"
  nat_gw_eip_name     = "${var.nat_gw_eip_name}"

  public_routetable_name  = "${var.public_routetable_name}"
  private_routetable_name = "${var.private_routetable_name}"

  private_az_subnets_cidr = ["${var.private_az_subnets_cidr}"]
  public_az_subnets_cidr  = ["${var.public_az_subnets_cidr}"] 

#####eks master securitygroup
  eksmaster_sg_name        = "${var.eksmaster_sg_name}"
  eksmaster_sg_description = "${var.eksmaster_sg_description}"
#allow all ports, restriction & ports are control via the VPN firewall
  sg_eksmaster_tcp_inbound_ports = "${var.sg_eksmaster_tcp_inbound_ports}"
  sg_eksmaster_tcp_ingress_cidr  = ["${var.sg_eksmaster_tcp_ingress_cidr}"]
  sg_eksmaster_tcp_protocol      = "${var.sg_eksmaster_tcp_protocol}"
  sg_eksmaster_description       = "${var.sg_eksmaster_description}"

  sg_eksmaster_all_inbound_ports = "${var.sg_eksmaster_all_inbound_ports}"
  sg_eksmaster_all_ingress_cidr  = ["${var.sg_eksmaster_all_ingress_cidr}"]
  sg_eksmaster_all_protocol      = "${var.sg_eksmaster_all_protocol}"
  sg_eksmaster_all_description   = "${var.sg_eksmaster_all_description}"
#####eks worker securitygroup
  eks_sg_name                    = "${var.eks_sg_name}"
  eks_sg_description             = "${var.eks_sg_description}"
#eks worker ingress rules
  sg_eksworker_tcp_inbound_ports = "${var.sg_eksworker_tcp_inbound_ports}"
  sg_eksworker_tcp_ingress_cidr  = ["${var.sg_eksworker_tcp_ingress_cidr}"]
  sg_eksworker_tcp_protocol      = "${var.sg_eksworker_tcp_protocol}"
  sg_eksworker_description       = "${var.sg_eksworker_description}"

#####EKS Cluster resources
  #eks master config
  eks_iam_role_name              = "${var.eks_iam_role_name}"
  eks_cluster_version            = "${var.eks_cluster_version}"
  eks_cluster_log_types          = ["${var.eks_cluster_log_types}"]
  log_retention_days             = "${var.log_retention_days}"
  eks_endpoint_public_access     = "${var.eks_endpoint_public_access}"
  eks_endpoint_private_access    = "${var.eks_endpoint_private_access}"
  bu                             = "${var.bu}"
  application                    = "${var.application}"
  tag_environment                = "${var.tag_environment}"
  tag_region                     = "${var.tag_region}"
  
  #eks worker node group
  eks_node_group_name            = "${var.eks_node_group_name}"
  eks_node_group_iam_role        = "${var.eks_node_group_iam_role}"
  ami_type                       = "${var.ami_type}"
  instance_type                  = ["${var.instance_type}"]
  root_volume_size               = "${var.root_volume_size}"
  desired_capacity               = "${var.desired_capacity}"
  max_size                       = "${var.max_size}"
  min_size                       = "${var.min_size}"
  ec2_ssh_key                    = "${var.ec2_ssh_key}"

########eks_node_gitea_group_new 
  eks_node_group_gitea_new_name  = "${var.eks_node_group_gitea_new_name}"
  eks_gitea_new_subnet_ids       = ["${var.eks_gitea_new_subnet_ids}"] 
  node_group_gitea_new_instance_type = ["${var.node_group_gitea_new_instance_type}"]

  desired_capacity_gitea_new     = "${var.desired_capacity_gitea_new}"
  max_size_gitea_new             = "${var.max_size_gitea_new}"
  min_size_gitea_new             = "${var.min_size_gitea_new}"

#######eks_node_neo4j_group_new 
  eks_node_group_neo4j_new_name  = "${var.eks_node_group_neo4j_new_name}"
  
  eks_neo4j_new_subnet_ids       = ["${var.eks_neo4j_new_subnet_ids}"] 
  node_group_neo4j_new_instance_type = ["${var.node_group_neo4j_new_instance_type}"]
 

  desired_capacity_neo4j_new     = "${var.desired_capacity_neo4j_new}"
  max_size_neo4j_new             = "${var.max_size_neo4j_new}"
  min_size_neo4j_new             = "${var.min_size_neo4j_new}"

}

#--------------------------------------------------------------------------#
# cloudfront module
#--------------------------------------------------------------------------#
module "cloudfront" {
  source = "./modules/main/cloudfront/nsm"

  aws_access_key  = "${var.aws_access_key}"
  aws_secret_key  = "${var.aws_secret_key}"
  region          = "${var.region}"

  enabled                        = true
  ipv6enabled                    = false
  comment                        = "${var.comment}"
  root_object                    = "${var.root_object}"
  domain_name                    = "${var.cloudfront_domain_name}"
  origin_id                      = "${var.origin_id}"
  origin_protocol_policy         = "${var.origin_protocol_policy}"
  ssl_protocols                  = "${var.ssl_protocols}"
  s3_bucket_create               = true
  lifecycle_name                 = "nsm-cloudfront-s3-lifecycle-rule"
  lifecycle_days                 = 30
  lifecycle_enabled              = true
  log_include_cookies            = true
  bucket_domain_name             = "${var.bucket_domain_name}"
  bucket_name                    = "${var.bucket_name}"
  prefix                         = "${var.prefix}"
  aliases                        = "${var.aliases}"
  cert_arn                       = "${var.cert_arn}"
  ssl_support_method             = "${var.ssl_support_method}"
  min_protocol_version           = "${var.min_protocol_version}"
  default_cert                   = false
  allowed_methods                = "${var.allowed_methods}"
  cached_methods                 = "${var.cached_methods}"
  target_origin_id               = "${var.target_origin_id}"
  compress                       = false
  query_string                   = true
  forward                        = "${var.forward}"
  env                            = "${var.cloudfront_env}"
  BU                             = "${var.BU}"
  restriction_type               = "${var.restriction_type}"
}