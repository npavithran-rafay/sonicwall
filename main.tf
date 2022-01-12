#configuration for terraform state file remote storage
terraform {
  backend "s3" {
      region = "us-west-1"
      bucket = "pavithrantest"
      key    = "analyzerNG/terraform.tfstate"
  }
}

#NSM module
module "NSM" {
  source = "./NSM" 

  region = var.region

#####------------------VPC------------------#####
  create_production_vpc    = var.create_production_vpc
  production_vpc_id        = "${var.production_vpc_id}"
  az-private-subnet-mapping = "${var.az-private-subnet-mapping}"
  redshift-az-public-subnet-mapping = "${var.redshift-az-public-subnet-mapping}"
  mariadB-az-private-subnet-mapping  = "${var.mariadB-az-private-subnet-mapping}"
  elasticsearch-az-private-subnet-mapping = "${var.elasticsearch-az-private-subnet-mapping}"

  cgms_sg_name    = "${var.cgms_sg_name}"
  cgms_sg_description = "${var.cgms_sg_description}"
  sg_cgms_inbound_ports   = "${var.sg_cgms_inbound_ports}"
  cgms_ingress_cidr       = "${var.cgms_ingress_cidr}"
  sg_cgms_protocol        = "${var.sg_cgms_protocol}"
  sg_cgms_description     = "${var.sg_cgms_description}"
  sg_cgms_inbound_ports_nlb   = "${var.sg_cgms_inbound_ports_nlb}"
  cgms_ingress_cidr_nlb       = "${var.cgms_ingress_cidr_nlb}"
  sg_cgms_protocol_nlb        = "${var.sg_cgms_protocol_nlb}"
  sg_cgms_description_nlb     = "${var.sg_cgms_description_nlb}"

  sg_cgms_apisrv_inbound_ports_nlb  = "${var.sg_cgms_apisrv_inbound_ports_nlb}"
  cgms_apisrv_ingress_cidr_nlb      = "${var.cgms_apisrv_ingress_cidr_nlb}"
  sg_cgms_apisrv_description_nlb    = "${var.sg_cgms_apisrv_description_nlb}"
  sg_cgms_udp_inbound_ports         = "${var.sg_cgms_udp_inbound_ports}"
  cgms_udp_ingress_cidr             = "${var.cgms_udp_ingress_cidr}"
  sg_cgms_udp_protocol              = "${var.sg_cgms_udp_protocol}"
  sg_cgms_udp_description           = "${var.sg_cgms_udp_description}"
  cgms_lb_sg_name         = "${var.cgms_lb_sg_name}"
  cgms_lb_sg_description  = "${var.cgms_lb_sg_description}"
  cass_lb_sg_name         = "${var.cass_lb_sg_name}"
  cass_lb_sg_description  = "${var.cass_lb_sg_description}"
  sg_cass_lb_tcp_inbound_ports    = "${var.sg_cass_lb_tcp_inbound_ports}"
  cass_lb_tcp_ingress_cidr        = "${var.cass_lb_tcp_ingress_cidr}"
  sg_cass_lb_tcp_protocol         = "${var.sg_cass_lb_tcp_protocol}"
  sg_cass_lb_tcp_description      = "${var.sg_cass_lb_tcp_description}"
  sg_cass_lb_tcp_internal_inbound_ports = "${var.sg_cass_lb_tcp_internal_inbound_ports}"
  cass_lb_tcp_ingress_cidr_internal     = "${var.cass_lb_tcp_ingress_cidr_internal}"
  sg_cass_lb_tcp_description_internal   = "${var.sg_cass_lb_tcp_description_internal}"
  linux_sg_name       = "${var.linux_sg_name}"
  linux_sg_description  = "${var.linux_sg_description}"
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

#####------------------IAM------------------#####
  role_name       = var.role_name
#####------------------S3------------------#####
  #gitea
  bucket_name_gitea        = "${var.bucket_name_gitea}"
  acl_gitea                = "${var.acl_gitea}"
  lifecycle_name           = "${var.lifecycle_name}"
  storage_class            = "${var.storage_class}"
  #reportlite
  bucket_name_reportlite   = "${var.bucket_name_reportlite}"
  acl_reportlite           = "${var.acl_reportlite}"
  
#####------------------redshift------------------#####
  subnet_grp_enabled         = "${var.subnet_grp_enabled}"
  subgrp_name                = "${var.subgrp_name}"
  # subnet_ids                 = ["${var.subnet_ids}"]
  parameter_gname_enabled    = "${var.parameter_gname_enabled}"
  parameter_gname            = "${var.parameter_gname}"
  name                       = "${var.name}"
  database_name              = "${var.database_name}"
  isencrypted                = "${var.isencrypted}"

  master_password            = "${var.master_password}"
  master_username            = "${var.master_username}"
  node_type                  = "${var.node_type}"
  number_of_nodes            = "${var.number_of_nodes}"
  enhancedvpc                = "${var.enhancedvpc}"
  publicly_accessible        = "${var.publicly_accessible}"
  BU                         = "${var.BU}"
  # securitygrp_ids            = ["${var.securitygrp_ids}"]
#####------------------mariadB------------------#####
  #dB subnetgroup
  db_subnet_group_name        = "${var.db_subnet_group_name}"
  # db_subnet_group               = "${var.db_subnet_group}"
#dB instance
  rds_identifier              = "${var.rds_identifier}"
  engine                      = "${var.engine}"
  engine_version              = "${var.engine_version}"
  instance_class              = "${var.instance_class}"
  allocated_storage           = "${var.allocated_storage}"
  storage_type                = "${var.storage_type}"
  db_name                     = "${var.db_name}"
  db_master_username          = "${var.db_master_username}"
  db_master_password          = "${var.db_master_password}"
  db_port                     = "${var.db_port}"
  # db_vpc_security_group_ids   = "${var.db_vpc_security_group_ids}"
  multi_az                    = "${var.multi_az}"
  dB_publicly_accessible         = "${var.dB_publicly_accessible}"
  apply_immediately           = "${var.apply_immediately}"
  allow_major_version_upgrade = "${var.allow_major_version_upgrade}"
  auto_minor_version_upgrade  = "${var.auto_minor_version_upgrade}"
  deletion_protection         = "${var.deletion_protection}"
  skip_final_snapshot         = "${var.skip_final_snapshot}"
  db_backup_retention_period  = "${var.db_backup_retention_period}"
  db_backup_window            = "${var.db_backup_window}"
  tags                        = "${var.tags}"
  availability_zone           = "${var.availability_zone}"
  option_group_name           = "${var.option_group_name}"
  replicate_source_db         = "${var.replicate_source_db}"
  iops                        = "${var.iops}"
  storage_encrypted           = "${var.storage_encrypted}"
  snapshot_identifier         = "${var.snapshot_identifier}"
  parameter_group_name        = "${var.parameter_group_name}"
  iam_database_authentication_enabled = "${var.iam_database_authentication_enabled}"
#####------------------kinesis_firehose------------------#####
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
  # master_username       = "${var.master_username}"
  # master_password       = "${var.master_password}"
  firehosename1         = "${var.firehosename1}"
  datatablename1        = "${var.datatablename1}"
  copy_options          = "${var.copy_options}"
  copy_options1          = "${var.copy_options1}"
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
#####------------------elasticsearch_domain------------------#####
  domain_name        = "${var.domain_name}"
  es_version         = "${var.es_version}"
  # elasticsearch_subnet_ids     = ["${var.elasticsearch_subnet_ids}"]
  # security_group_ids = "${var.security_group_ids}"

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
  # BU      = "${var.BU}"
  appname = "${var.appname}"

  log_publishing_search_cloudwatch_log_group_arn = "${var.log_publishing_search_cloudwatch_log_group_arn}"
  log_publishing_index_cloudwatch_log_group_arn  = "${var.log_publishing_index_cloudwatch_log_group_arn}"
  log_publishing_application_cloudwatch_log_group_arn = "${var.log_publishing_application_cloudwatch_log_group_arn}"
  
#####------------------elasticache(redis)------------------#####
  eng_name                = "${var.eng_name}"
  numcache                = "${var.numcache}"
  nodetype                = "${var.nodetype}"
  par_name                = "${var.par_name}"
  par_name_cluster_mode_enabled = "${var.par_name_cluster_mode_enabled}"
  replication_enabled     = "${var.replication_enabled}"
  repl_grp                = "${var.repl_grp}"
  eng_ver                 = "${var.eng_ver}"
  port                    = "${var.port}"
  maintenance_win         = "${var.maintenance_win}"
  snap_win                = "${var.snap_win}"
  snap_reten_limit        = "${var.snap_reten_limit}"
  automatic_failover      = "${var.automatic_failover}"
  redis_apply_immediately = "${var.redis_apply_immediately}"
  description             = "${var.description}"
  sn_grp_name             = "${var.sn_grp_name}"
  # sg_ids                  = ["${var.sg_ids}"]
  ec_az                   = "${var.ec_az}"
  name_tag                = "${var.name_tag}"
  enviroment_tag          = "${var.enviroment_tag}"
  bu_tag                  = "${var.bu_tag}"
  num_node_group          = "${var.num_node_group}"
  auth_token              = "${var.auth_token}"
  num_cache_nodes         = "${var.num_cache_nodes}"
  kms_key_id              = "${var.kms_key_id}"
  snapshot_arns           = "${var.snapshot_arns}"
  at_rest_encryption_enabled="${var.at_rest_encryption_enabled}"
  replicas_per_node       = "${var.replicas_per_node}"
  cluster_replication_enabled = "${var.cluster_replication_enabled}"
  # auto_minor_version_upgrade="${var.auto_minor_version_upgrade}"
  notification_topic_arn  = "${var.notification_topic_arn}"
  transit_encryption_enabled="${var.transit_encryption_enabled}"
  snapshot_name           = "${var.snapshot_name}"

## Subnet group ## 
  # sn_ids                  = ["${var.sn_ids}"]
  sn_grp_desc             = "${var.sn_grp_desc}"
#####------------------eks------------------#####
  eks_cluster_name            = "${var.eks_cluster_name}"
  eks_endpoint_public_access  = "${var.eks_endpoint_public_access}"
  eks_endpoint_private_access = "${var.eks_endpoint_private_access}"
  eks_cluster_version         = "${var.eks_cluster_version}"
  vpccidr                     = "${var.vpccidr}"
  private_az_subnets_cidr     = "${var.private_az_subnets_cidr}"
  public_az_subnets_cidr      = "${var.public_az_subnets_cidr}"
  eks_gitea_private_az_subnets_cidr = "${var.eks_gitea_private_az_subnets_cidr}"
  eks_neo4j_private_az_subnets_cidr = "${var.eks_neo4j_private_az_subnets_cidr}"
  # eks_gitea_new_subnet_ids    = ["${var.eks_gitea_new_subnet_ids}"]  
  vpc_name         = "${var.vpc_name}"

  ig_gw_name      = "${var.ig_gw_name}"
  nat_gw_name     = "${var.nat_gw_name}"
  nat_gw_eip_name     = "${var.nat_gw_eip_name}"

  public_routetable_name  = "${var.public_routetable_name}"
  private_routetable_name = "${var.private_routetable_name}"

#####eks master securitygroup
  eksmaster_sg_name        = "${var.eksmaster_sg_name}"
  eksmaster_sg_description = "${var.eksmaster_sg_description}"
#allow all ports, restriction & ports are control via the VPN firewall
  sg_eksmaster_tcp_inbound_ports = "${var.sg_eksmaster_tcp_inbound_ports}"
  sg_eksmaster_tcp_ingress_cidr  = "${var.sg_eksmaster_tcp_ingress_cidr}"
  sg_eksmaster_tcp_protocol      = "${var.sg_eksmaster_tcp_protocol}"
  sg_eksmaster_description       = "${var.sg_eksmaster_description}"

  sg_eksmaster_all_inbound_ports = "${var.sg_eksmaster_all_inbound_ports}"
  sg_eksmaster_all_ingress_cidr  = "${var.sg_eksmaster_all_ingress_cidr}"
  sg_eksmaster_all_protocol      = "${var.sg_eksmaster_all_protocol}"
  sg_eksmaster_all_description   = "${var.sg_eksmaster_all_description}"
#####eks worker securitygroup
  eks_sg_name                    = "${var.eks_sg_name}"
  eks_sg_description             = "${var.eks_sg_description}"
#eks worker ingress rules
  sg_eksworker_tcp_inbound_ports = "${var.sg_eksworker_tcp_inbound_ports}"
  sg_eksworker_tcp_ingress_cidr  = "${var.sg_eksworker_tcp_ingress_cidr}"
  sg_eksworker_tcp_protocol      = "${var.sg_eksworker_tcp_protocol}"
  sg_eksworker_description       = "${var.sg_eksworker_description}"

#####EKS Cluster resources
  #eks master config
  eks_iam_role_name              = "${var.eks_iam_role_name}" 
  eks_cluster_log_types          = "${var.eks_cluster_log_types}"
  log_retention_days             = "${var.log_retention_days}" 
  # bu                             = "${var.bu}"
  # application                    = "${var.application}"
  # tag_environment                = "${var.tag_environment}"
  # tag_region                     = "${var.tag_region}"
  
  #eks worker node group
  eks_node_group_name            = "${var.eks_node_group_name}"
  eks_node_group_iam_role        = "${var.eks_node_group_iam_role}"
  ami_type                       = "${var.ami_type}"
  instance_type                  = "${var.instance_type}"
  root_volume_size               = "${var.root_volume_size}"
  desired_capacity               = "${var.desired_capacity}"
  max_size                       = "${var.max_size}"
  min_size                       = "${var.min_size}"
  ec2_ssh_key                    = "${var.ec2_ssh_key}"

########eks_node_gitea_group_new 
  eks_node_group_gitea_new_name  = "${var.eks_node_group_gitea_new_name}"
  # eks_gitea_new_subnet_ids       = ["${var.eks_gitea_new_subnet_ids}"] 
  node_group_gitea_new_instance_type = "${var.node_group_gitea_new_instance_type}"

  desired_capacity_gitea_new     = "${var.desired_capacity_gitea_new}"
  max_size_gitea_new             = "${var.max_size_gitea_new}"
  min_size_gitea_new             = "${var.min_size_gitea_new}"

#######eks_node_neo4j_group_new 
  eks_node_group_neo4j_new_name  = "${var.eks_node_group_neo4j_new_name}"
  
  # eks_neo4j_new_subnet_ids       = ["${var.eks_neo4j_new_subnet_ids}"] 
  node_group_neo4j_new_instance_type = "${var.node_group_neo4j_new_instance_type}"
 

  desired_capacity_neo4j_new     = "${var.desired_capacity_neo4j_new}"
  max_size_neo4j_new             = "${var.max_size_neo4j_new}"
  min_size_neo4j_new             = "${var.min_size_neo4j_new}"

  release_version                = "${var.release_version}"
  eks_endpoint_public_access_cidr= "${var.eks_endpoint_public_access_cidr}"
  node_groups                    = "${var.node_groups}"
}

#analyzerNG module
 module "analyzerNG" {
  source = "./analyzerNG"

 depends_on = [
   module.NSM
 ] 
  region             = var.region
##IAM
  iam_name           = "${var.iam_name}"
  nsm_eks_worker_iam = "${var.nsm_eks_worker_iam}"
##s3
  prefix_analyzer          = "${var.prefix_analyzer}"
  acl                      = "${var.acl}"
  lifecycle_name_analyzer  = "${var.lifecycle_name_analyzer}"
  versioning               = "${var.versioning}"
  lifecycle_enabled        = "${var.lifecycle_enabled}"
  s3_region                = "${var.s3_region}"
  lifecycle_expiration_days= "${var.lifecycle_expiration_days}"
  tagenv                   = "${var.tagenv}"
  tagregion                = "${var.tagregion}"
  Application              = "${var.Application}"
  Applicationtype          = "${var.Applicationtype}"
  bu                       = "${var.bu}"  
  block_public_acls        = "${var.block_public_acls}"
  ignore_public_acls       = "${var.ignore_public_acls}"
  block_public_policy      = "${var.block_public_policy}"
  restrict_public_buckets  = "${var.restrict_public_buckets}"
  create_folder            = "${var.create_folder}"
  S3_key                   ="${var.S3_key}"
  flow_lifecycle_expiration_days = "${var.flow_lifecycle_expiration_days}"
  lifecycle_name_1 = "${var.lifecycle_name_1}"
  lifecycle_name_2 = "${var.lifecycle_name_2}"
  lifecycle_name_3 = "${var.lifecycle_name_3}"
  lifecycle_name_4 = "${var.lifecycle_name_4}"
  lifecycle_name_5 = "${var.lifecycle_name_5}"
  lifecycle_name_6 = "${var.lifecycle_name_6}"
  analyzerng_logs_lifecycle_expiration_days = "${var.analyzerng_logs_lifecycle_expiration_days}"
  prevent_destroy           = var.prevent_destroy
  force_destroy             = var.force_destroy

##emr
  network_state_bucket  = "${var.network_state_bucket}"
  network_state_key     = "${var.network_state_key}"
  network_state_region  = "${var.network_state_region}"
  vpc_id                = var.production_vpc_id != "" ? var.production_vpc_id : module.NSM.vpc_id
  name_analyzer             = "${var.name_analyzer}"
  emr2_name                 = "${var.emr2_name}"
  release_label             = "${var.release_label}"
  applications              = "${var.applications}"
  ebs_root_volume_size      = "${var.ebs_root_volume_size}"
  key_name                  = "${var.key_name}"
  # Public subnet ID
  subnet_id             = module.NSM.redshift_public_subnet_ids
  termination_protection    = "${var.termination_protection}"
  application           = "${var.application}"
  environment           = "${var.environment}"
  tag_region            = "${var.tag_region}"
  create_task_instance_fleet = "${var.create_task_instance_fleet}"
  # Instance Fleet Common values
  ebs_size_analyzer                          = "${var.ebs_size_analyzer}"
  ebs_type                          = "${var.ebs_type}"
  volumes_per_instance              = "${var.volumes_per_instance}"

  # MASTER Instance fleet
  master_instance_bidprice_percentage_1 = "${var.master_instance_bidprice_percentage_1}"
  master_instance_type_analyzer                  = "${var.master_instance_type_analyzer}"
  master_fleet_name                     = "${var.master_fleet_name}"
  master_target_on_demand_capacity      = "${var.master_target_on_demand_capacity}"
  master_target_spot_capacity           = "${var. master_target_spot_capacity}"

  # CORE Instance fleet
  core_instance_bidprice_percentage_1   = "${var.core_instance_bidprice_percentage_1}"
  core_instance_bidprice_percentage_2   = "${var.core_instance_bidprice_percentage_2}"
  core_instance_type_1                  = "${var.core_instance_type_1}"
  core_instance_type_2                  = "${var.core_instance_type_2}"
  core_instance_weighted_capacity_1     = "${var.core_instance_weighted_capacity_1}"
  core_instance_weighted_capacity_2     = "${var.core_instance_weighted_capacity_2}"
  core_fleet_name                       = "${var.core_fleet_name}"
  core_target_on_demand_capacity        = "${var.core_target_on_demand_capacity}"
  core_target_spot_capacity             = "${var.core_target_spot_capacity}"

  # Task Instance fleet
  task_instance_bidprice_percentage_1   = "${var.task_instance_bidprice_percentage_1}"
  task_instance_bidprice_percentage_2   = "${var.task_instance_bidprice_percentage_2}"
  task_instance_type_1                  = "${var.task_instance_type_1}"
  task_instance_weighted_capacity_1     = "${var.task_instance_weighted_capacity_1}"
  task_instance_type_2                  = "${var.task_instance_type_2}"
  task_instance_weighted_capacity_2     = "${var.task_instance_weighted_capacity_2}"
  task_instance_type_3                  = "${var.task_instance_type_3}"
  task_instance_weighted_capacity_3     = "${var.task_instance_weighted_capacity_3}"
  task_instance_type_4                  = "${var.task_instance_type_4}"
  task_instance_weighted_capacity_4     = "${var.task_instance_weighted_capacity_4}"
  task_instance_bidprice_percentage_3   = "${var.task_instance_bidprice_percentage_3}"
  task_instance_bidprice_percentage_4   = "${var.task_instance_bidprice_percentage_4}"
  task_spot_allocation_strategy         = "${var.task_spot_allocation_strategy}"
  task_spot_block_duration_minutes      = "${var.task_spot_block_duration_minutes}"
  task_spot_timeout_action              = "${var.task_spot_timeout_action}"
  task_spot_timeout_duration_minutes    = "${var.task_spot_timeout_duration_minutes}"
  task_fleet_name                       = "${var.task_fleet_name}"
  task_target_on_demand_capacity        = "${var.task_target_on_demand_capacity}"
  task_target_spot_capacity             = "${var.task_target_spot_capacity}"
  
  # Cluster Scaling variables
  scaling_unit_type                     = "${var.scaling_unit_type}"
  scaling_minimum_capacity_units        = "${var.scaling_minimum_capacity_units}"
  scaling_maximum_capacity_units        = "${var.scaling_maximum_capacity_units}"
  scaling_maximum_ondemand_capacity_units = "${var.scaling_maximum_ondemand_capacity_units}"
  scaling_maximum_core_capacity_units     = "${var.scaling_maximum_core_capacity_units}"

##Kinesis
  shard_count     = "${var.shard_count}"
  retention_period = "${var.retention_period}"
  url_shard_count = "${var.url_shard_count}"
  urlr_shard_count = "${var.urlr_shard_count}"
  url_ng_name           = "${var.url_ng_name}"
  urlrating_ng_name     = "${var.urlrating_ng_name}"
  rt_ng_name            = "${var.rt_ng_name}"
  Environment           = "${var.Environment}"
  Name                  = "${var.Name}"
  BU                    = "${var.BU}"
  application_type = "${var.application_type}"
  url_retention_period  = "${var.url_retention_period}"
  urlr_retention_period = "${var.urlr_retention_period}"
  flow_retention_period = var.flow_retention_period
  url_name              = var.url_name
  flow_shard_count      = var.flow_shard_count
  flow_name             = var.flow_name

##dynamodb
  db_tablename    = "${var.db_tablename}"
  billing_mode    = "${var.billing_mode}"
  write_capacity  = "${var.write_capacity}"
  read_capacity   = "${var.read_capacity}"
  hash_key        = "${var.hash_key}"
  attribute_type  = "${var.attribute_type}"
  range_key       = "${var.range_key}"
  range_attribute_type = "${var.range_attribute_type}"
  tags_BU              = "${var.tags_BU}"
  tags_Application     = "${var.tags_Application}"
  tags_Region          = "${var.tags_Region}"

  alert_db_tablename   = "${var.alert_db_tablename}"
  alert_write_capacity = "${var.alert_write_capacity}"
  alert_read_capacity  = "${var.alert_read_capacity}"
  alert_hash_key       = "${var.alert_hash_key}"

  trafficstats_db_tablename     = "${var.trafficstats_db_tablename }"
  trafficstats_write_capacity   = "${var.trafficstats_write_capacity}"
  trafficstats_read_capacity    = "${var.trafficstats_read_capacity }"
  trafficstats_hash_key         = "${var.trafficstats_hash_key}"

  trafficstatsDebug_db_tablename = "${var.trafficstatsDebug_db_tablename}"
  trafficstatsDebug_hash_key     = "${var.trafficstatsDebug_hash_key}"

  trafficalerts_db_tablename     = "${var.trafficalerts_db_tablename}"
  trafficalerts_hash_key         = "${var.trafficalerts_hash_key}"

  alertconfig_db_tablename       = "${var.alertconfig_db_tablename}" 
  alertconfig_hash_key           = "${var.alertconfig_hash_key}"

  serial_db_tablename            = "${var.serial_db_tablename}"
  serial_hash_key                = "${var.serial_hash_key}"

  ANGRealtime_hash_key             = "${var.ANGRealtime_hash_key}"
  ANGRealtime_attribute_type       = "${var.ANGRealtime_attribute_type}" 
  ANGRealtime_range_key            = "${var.ANGRealtime_range_key}"
  ANGRealtime_range_attribute_type = "${var.ANGRealtime_range_attribute_type}"

##redshift
  subgrp_name_analyzer     = "${var.subgrp_name_analyzer}"
  subnet_grp_enabled = "${var.subnet_grp_enabled}"
  subnet_ids  = module.NSM.redshift_public_subnet_ids
  parameter_gname_enabled = "${var.parameter_gname_enabled}"
  parameter_gname_analyzer = "${var.parameter_gname_analyzer}"
  paramname                    = "${var.paramname}"
  paramvalue                   = "${var.paramvalue}"
  database_name_analyzer   = "${var.database_name_analyzer}"
  isencrypted     = "${var.isencrypted}"
  master_password_analyzer = "${var.master_password_analyzer}"
  master_username_analyzer = "${var.master_username_analyzer}"
  node_type_analyzer         = "${var.node_type_analyzer}"
  number_of_nodes   = "${var.number_of_nodes}"
  enhancedvpc       = "${var.enhancedvpc}"
  publicly_accessible = "${var.publicly_accessible}"
  tag_env                      = "${var.tag_env}"
  securitygrp_ids     = module.NSM.linux_default_security_group_id
  preferred_maintenance_window = "${var.preferred_maintenance_window}"
##eks-colllecter-NG
  tcp_port        = "${var.tcp_port}"
  protocol        = "${var.protocol}"
  ##CIDR 
  cidr_blocks_all_worker_groups  = "${var.cidr_blocks_all_worker_groups}"
  cluster_endpoint_private_access_cidrs = "${var.cluster_endpoint_private_access_cidrs}"
  ## Private subnets of the NSM R&A NSV's (LAN)
  vpc_private_subnets = module.NSM.redshift_public_subnet_ids 
  cluster_name    = "${var.cluster_name}"
  cluster_version = "${var.cluster_version}"

  log_types       = "${var.log_types}"
  log_retention_in_days = "${var.log_retention_in_days}"

  nodegroup_name                 = "${var.nodegroup_name}"
  instance_type_group_one = "${var.instance_type_group_one}"
  asg_desired_capacity_group_one = "${var.asg_desired_capacity_group_one}"
  asg_max_size_group_one         = "${var.asg_max_size_group_one}"
  asg_min_size_group_one         = "${var.asg_min_size_group_one}"

  #Tags
  applicationtype                = "${var.applicationtype}"
  ssh_key                        = "${var.ssh_key}"
  map_accounts                          = "${var.map_accounts}"
  map_roles                             = "${var.map_roles}"
  map_users                             = "${var.map_users}"
  subnet_tags     = "${var.subnet_tags}"
  
##Athena
  athena_bucket_acl    = "${var.athena_bucket_acl}"
  athena_bucket_key    = "${var.athena_bucket_key}"
  athena_name            = "${var.athena_name}"
  athena_workgroup_name  = "${var.athena_workgroup_name}"
  named_query            = "${var.named_query }"
  workgroup_force_destroy= "${var.workgroup_force_destroy}"

##ec2
  ## State file location of EMR to pull values
  emr_network_state_key = "${var.emr_network_state_key}"
  az_one_cidr           = "${var.az_one_cidr}"
  enviroment_tag        = "${var.enviroment_tag}"
  bu_tag                = "${var.bu_tag}"
  applicationName_tag   = "${var.applicationName_tag}"
  region_tag            = "${var.region_tag}"
  applicationtype_tag   = "${var.applicationtype_tag}"
  # EMR Client1 variables
  emr_client1_number            = "${var.emr_client1_number}"
  emr_client1_ami               = "${var.emr_client1_ami}"
  emr_client1_ami_instance_type = "${var.emr_client1_ami_instance_type}"
  emr_client1_volume_size       = "${var.emr_client1_volume_size}"
  number_of_ebs_emr_client1     = "${var.number_of_ebs_emr_client1}"
  ebs_volume_size_emr_client1   = "${var.ebs_volume_size_emr_client1}"
  ebs_device_name_emr_client1   = "${var.ebs_device_name_emr_client1}"
  machineType_emr_client1       = "${var.machineType_emr_client1}"
  # EMR Client 2 variables
  emr_client2_number            = "${var.emr_client2_number}"
  emr_client2_ami               = "${var.emr_client2_ami}"
  emr_client2_ami_instance_type = "${var.emr_client2_ami_instance_type}"
  emr_client2_volume_size       = "${var.emr_client2_volume_size}"
  number_of_ebs_emr_client2     = "${var.number_of_ebs_emr_client2}"
  ebs_volume_size_emr_client2   = "${var.ebs_volume_size_emr_client2}"
  ebs_device_name_emr_client2   = "${var.ebs_device_name_emr_client2}"
  machineType_emr_client2       = "${var.machineType_emr_client2}"
  ##ami_tf13
  ebs_iops                     = var.ebs_iops
  volume_type                  = var.volume_type
  volume_iops                  = var.volume_iops
  ebs_optimized                = var.ebs_optimized
  ebs_volume_type              = var.ebs_volume_type
  ami_shutdown_behavior        = var.ami_shutdown_behavior
  ami_monitoring               = var.ami_monitoring
  ami_termination_protection   = var.ami_termination_protection
  associate_public_ip_address  = var.associate_public_ip_address
  delete_volume_on_termination = var.delete_volume_on_termination
  sd_check                     = var.sd_check
  security_group_ids           = module.NSM.linux_default_security_group_id

##lambda
  ## State file location of Athena in Analyzer-NG
  athena_network_state_key = "${var.athena_network_state_key}"

  ## State file location of S3 in Analyzer-NG
  s3_network_state_key = "${var.s3_network_state_key}"
  #---------------------------------#
  # lambda variables                #
  #---------------------------------#
  function_name              = "${var.function_name}"
  description_analyzer                = "${var.description}"
  handler                    = "${var.handler}"
  runtime                    = "${var.runtime}"
  memory_size                = "${var.memory_size}"
  filename                   = "${var.filename}"
  concurrency                = "${var.concurrency}"
  lambda_timeout             = "${var.lambda_timeout}"
  log_retention              = "${var.log_retention}"
  tag_environment            = "${var.tag_environment}"
  emr_logprocessor           = "${var.emr_logprocessor}"
  emr_logparser              = "${var.emr_logparser}"
  schedulejobs_filename      = "${var.schedulejobs_filename }"
  logparser_runtime          = "${var.logparser_runtime}"
  logparser_filename         = "${var.logparser_filename}"
  logparser_description      = "${var.logparser_description}"
  logprocessor_filename      = "${var.logprocessor_filename}"
  logprocessor_description   = "${var.logprocessor_description}" 
  realtimereport_filename    = "${var.realtimereport_filename}"
  realtimereport_description  = "${var.realtimereport_description}"
  s3bucketmonitor_filename    = "${var.s3bucketmonitor_filename}"
  s3bucketmonitor_description = "${var.s3bucketmonitor_description}"
  terminaterestartemr_filename  = "${var.terminaterestartemr_filename}" 
  terminaterestartemr_description = "${var.terminaterestartemr_description}"
  deleteDynamodb_description      = "${var.deleteDynamodb_description}"
  deleteDynamodb_filename         = "${var.deleteDynamodb_filename}"
  terminatemrdynamodb_description = "${var.terminatemrdynamodb_description}"
  terminatemrdynamodb_filename    = "${var.terminatemrdynamodb_filename}"
  stepFunction_description        = "${var.stepFunction_description}" 
  stepFunction_filename           = "${var.stepFunction_filename}" 
  logProcessor_new_filename       = "${var.logProcessor_new_filename}"
  logProcessorWeb_filename        = "${var.logProcessorWeb_filename}"
  ANG-Setup_filename              = "${var.ANG-Setup_filename}"
  secret_names                    = "${var.secret_names}"
  ANG-ops_filename                = "${var.ANG-ops_filename}"
  ANG-lambda_update_filename      = "${var.ANG-lambda_update_filename}"
  ANG-lambda_partitionprojection_filename = "${var.ANG-lambda_partitionprojection_filename}"
  ANG-lambda_WeeklyRedShiftCommands_filename = "${var.ANG-lambda_WeeklyRedShiftCommands_filename}"
  ANG-lambda_MonitorDataEmail_filename       = "${var.ANG-lambda_MonitorDataEmail_filename}"
  ANG-lambda_ReadKinesisDataStream_filename  = "${var.ANG-lambda_ReadKinesisDataStream_filename}"
  ANG-lambda_ReadRedShiftData_filename       = "${var.ANG-lambda_ReadRedShiftData_filename}"
  
  #----------------------------------#
  # Production nsv variables         #
  #----------------------------------#
  nsv_number               = "${var.nsv_number}"
  nsv_ami                  = "${var.nsv_ami}"
  nsv_volume_size          = "${var.nsv_volume_size}"
  security_group_lb_ids    = module.NSM.linux_default_security_group_id
  az_one_public_id         = module.NSM.redshift_public_subnet_ids
  private_security_group_ids = module.NSM.linux_default_security_group_id
  az_one_public_cidr       = "${var.az_one_public_cidr}"
  nsv_ami_instance_type    = "${var.nsv_ami_instance_type}"
  nsv1_lan_ip             = "${var.nsv1_lan_ip}" 
  machineType_tag         = "${var.machineType_tag}"
  ebs_device_name             = var.ebs_device_name
  ebs_volume_number           = var.ebs_volume_number
  ebs_volume_size             = var.ebs_volume_size
  ami_private_subnet_id  = module.NSM.mariadB_private_subnet_ids

 
 ##glue-crawler
  crawler_name             = "${var.crawler_name}"
  crawler_name_url         = "${var.crawler_name_url}"
  crawler_name_appsdata    = "${var.crawler_name_appsdata}"
  crawler_name_coredata    = "${var.crawler_name_coredata}"
  crawler_name_ifacedata   = "${var.crawler_name_ifacedata}"
  crawler_name_memdata     = "${var.crawler_name_memdata}"
  crawler_name_reportdata  = "${var.crawler_name_reportdata}"
  crawler_name_flowblocked = "${var.crawler_name_flowblocked}"
  crawler_name_flowthreat  = "${var.crawler_name_flowthreat}"
  crawl_behaviour          = "${var.crawl_behaviour}"

#-----------------------------------------------#
# Cloudwatch Monitoring		#
#-----------------------------------------------#
  kinesis_stream_names = var.kinesis_stream_names
  kinesis_iterator_age_error_threshold = var.kinesis_iterator_age_error_threshold
  kinesis_iterator_age_error_evaluation_periods = var.kinesis_iterator_age_error_evaluation_periods
  kinesis_iterator_age_error_period = var.kinesis_iterator_age_error_period
  cpu_threshold = var.cpu_threshold
  redshift_evaluation_periods = var.redshift_evaluation_periods
  redshift_period = var.redshift_period

#-----------------------------------------------#
# Cloudwatch Monitoring		#
#-----------------------------------------------#

  key_spec  = var.key_spec
  kms_alias = var.kms_alias
  enabled  = var.enabled
  rotation_enabled = var.rotation_enabled
  #region = var.region
  user_arn = var.user_arn

##output values instead of reading from remote state file
  s3_bucketname           = module.analyzerNG.s3_bucketname
  emr2_emr2bucketid       = module.analyzerNG.emr2_emr2bucketid
  emr_bucketid            = module.analyzerNG.emr_bucketid
  ath_Athena_database     = module.analyzerNG.ath_Athena_database
  ath_S3bucketname        = module.analyzerNG.ath_S3bucketname
  rs_redshift_cluster_endpoint = module.analyzerNG.rs_redshift_cluster_endpoint
  rs_redshift_cluster_database_name = module.analyzerNG.rs_redshift_cluster_database_name
  rs_redshift_cluster_port = module.analyzerNG.rs_redshift_cluster_port
  rs_redshift_username     = module.analyzerNG.NG_redshift_username
  rs_redshift_password     = module.analyzerNG.NG_redshift_password
 }


 module "cloudfront" {
   count = 0
   depends_on = [
     module.cluster_import
   ]
   source = "./NSM/modules/main/cloudfront/nsm"
#####------------------cloudfront------------------#####
  domain_name                    = "${var.cloudfront_domain_name}"
  bucket_name                    = "${var.bucket_name}"
  bucket_domain_name             = "${var.bucket_domain_name}"
  origin_id                      = "${var.origin_id}"
  prefix                         = "${var.prefix}"
  enabled                        = "${var.enabled}"
  ipv6enabled                    = "${var.ipv6enabled}"
  comment                        = "${var.comment}"
  root_object                    = "${var.root_object}"
  origin_protocol_policy         = "${var.origin_protocol_policy}"
  ssl_protocols                  = "${var.ssl_protocols}"
  s3_bucket_create               = "${var.s3_bucket_create}"
  lifecycle_name                 = "${var.cloudfront_lifecycle_name}"
  lifecycle_days                 = "${var.lifecycle_days}"
  lifecycle_enabled              = "${var.lifecycle_enabled}"
  log_include_cookies            = "${var.log_include_cookies}"
  aliases                        = "${var.aliases}"
  cert_arn                       = "${var.cert_arn}"
  ssl_support_method             = "${var.ssl_support_method}"
  min_protocol_version           = "${var.min_protocol_version}"
  default_cert                   = "${var.default_cert}" 
  allowed_methods                = "${var.allowed_methods}"
  cached_methods                 = "${var.cached_methods}"
  target_origin_id               = "${var.target_origin_id}"
  compress                       = "${var.compress}"
  query_string                   = "${var.query_string}"
  forward                        = "${var.forward}"
  minttl                         = "${var.minttl}"
  maxttl                         = "${var.maxttl}"
  keepalive_timeout              = "${var.keepalive_timeout}"
  read_timeout                   = "${var.read_timeout}"
  https_port                     = "${var.https_port}"
  http_port                      = "${var.http_port}"
  viewer_protocol_policy         = "${var.viewer_protocol_policy}"
  default_ttl                    = "${var.default_ttl}"
  headers                        = "${var.headers}"
  log_prefix                     = "${var.log_prefix}"
  env                            = "${var.cloudfront_env}"
  BU                             = "${var.BU}"
  restriction_type               = "${var.restriction_type}"
 }
 module "cluster_import" {
   depends_on = [
     module.NSM,
     module.analyzerNG
   ]
   source = "./NSM/modules/main/rafay_cluster"
   
  region            = var.region

  rest_endpoint     = var.rest_endpoint
  ops_endpoint      = var.ops_endpoint
  api_key           = var.api_key
  api_secret        = var.api_secret 


  cluster_name      = var.eks_cluster_name
  project_name      = var.rafay_project_name
  blueprint         = var.blueprint
  blueprintversion  = var.blueprintversion


#-------------------variables for helm vaule.yaml-----------------#
  NSM_ES_Endpoint   = "${module.NSM.ES_Endpoint}"
  NSM_db_endpoint   = "${module.NSM.db_endpoint}"
  NSM_elasticache_primary_endpoint_address = "${module.NSM.elasticache_primary_endpoint_address}"
  NSM_redshift_endpoint = "${module.NSM.redshift_endpoint}"
  NSM_S3Bucket_reportlite = "${module.NSM.S3Bucket_reportlite}"
  analyzerNG_rs_redshift_cluster_endpoint = "${module.analyzerNG.rs_redshift_cluster_endpoint}"

 }

 module "mongoDB-Atlas" {
  source = "./mongoDB-Atlas"

 depends_on = [
   module.NSM
 ]
   provider_name               = "${var.provider_name}"
   disk_size_gb                = "${var.disk_size_gb}"
   provider_instance_size_name = "${var.provider_instance_size_name}"
   project_id   = "${var.project_id}"
   num_shards = "${var.num_shards}"
   electable_nodes = "${var.electable_nodes}"
   priority        = "${var.priority}"
   read_only_nodes = "${var.read_only_nodes}"
   provider_backup_enabled      = "${var.provider_backup_enabled}"
   auto_scaling_disk_gb_enabled = "${var.auto_scaling_disk_gb_enabled}"
   mongo_db_major_version       = "${var.mongo_db_major_version}"
   vpc_id                 = "${var.production_vpc_id != "" ? var.production_vpc_id : module.NSM.vpc_id}"
   aws_account_id         = "${var.aws_account_id}"
   destination_cidr_block = "${var.destination_cidr_block}"
   public_key  = var.public_key
   private_key = var.private_key
   enable_dns_hostnames   = var.enable_dns_hostnames
   atlas_dbpassword  = var.atlas_dbpassword
   atlas_vpc_cidr = var.atlas_vpc_cidr
   enable_dns_support = var.enable_dns_support
   atlas_dbuser   = var.atlas_dbuser
   cidr_block = var.cidr_block
 }

 module "NSM-Neptune" {
   source = "./NSM-Neptune"
   neptune_count = var.neptune_count
   neptune_instance_class      = var.neptune_instance_class
   preferred_backup_window = var.preferred_backup_window
   neptune_apply_immediately  = var.neptune_apply_immediately
   neptune_cluster_name   = var.neptune_cluster_name
   neptune_skip_final_snapshot = var.neptune_skip_final_snapshot
   vpc_id                 = "${var.production_vpc_id != "" ? var.production_vpc_id : module.NSM.vpc_id}"
   neptune_iam_database_authentication_enabled = var.neptune_iam_database_authentication_enabled
   neptune_sg_name = var.neptune_sg_name
   aws_region = var.aws_region
   neptune_publicly_accessible = var.neptune_publicly_accessible
   availability_zones = var.availability_zones
   neptune_engine = var.neptune_engine
   backup_retention_period = var.backup_retention_period
 }