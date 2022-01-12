/*#configuration for terraform state file remote storage
terraform {
  backend "s3" {
      region = "us-west-1"
      bucket = "gopi-bucket"
      key    = "snwl/analyzerNG/terraform.tfstate"
  }
}*/

#--------------------------------------------------------------------------#
# IAM module
#--------------------------------------------------------------------------#
module "iam" {
  source = "./modules/main/iam"
  region             = var.region
  iam_name           = "${var.iam_name}"
  nsm_eks_worker_iam = "${var.nsm_eks_worker_iam}"
}

#--------------------------------------------------------------------------#
# s3 module
#--------------------------------------------------------------------------#
module "s3" {
  source = "./modules/main/s3"

  prefix_analyzer          = "${var.prefix_analyzer}"
  acl             = "${var.acl}"
  lifecycle_name_analyzer  = "${var.lifecycle_name_analyzer}"
  versioning      = "${var.versioning}"
  lifecycle_enabled  = "${var.lifecycle_enabled}"
  s3_region       = "${var.s3_region}"
  lifecycle_expiration_days  = "${var.lifecycle_expiration_days}"
  tagenv           = "${var.tagenv}"
  tagregion        = "${var.tagregion}"
  Application      = "${var.Application}"
  Applicationtype  = "${var.Applicationtype}"
  bu               = "${var.bu}"  
  block_public_acls  = "${var.block_public_acls}"
  ignore_public_acls = "${var.ignore_public_acls}"
  block_public_policy = "${var.block_public_policy}"
  restrict_public_buckets = "${var.restrict_public_buckets}"
  create_folder  = "${var.create_folder}"
  S3_key ="${var.S3_key}"
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
}

#--------------------------------------------------------------------------#
# emr module
#--------------------------------------------------------------------------#
module "emr" {
  source = "./modules/main/emr"

  depends_on = [
    module.iam,
    module.s3 
  ]
  region             = var.region
 # bucket location where the VPC state file is stored
  network_state_bucket  = "${var.network_state_bucket}"
  network_state_key     = "${var.network_state_key}"
  network_state_region  = "${var.network_state_region}"

  prefix_analyzer                ="${var.prefix_analyzer}"  
  
  
  #########################
  ## S3 Bucket values ##
  #########################
  acl                       = "${var.acl}"
  lifecycle_enabled         = "${var.lifecycle_enabled}"
  lifecycle_expiration_days = "${var.lifecycle_expiration_days}"
  block_public_acls         = "${var.block_public_acls}"
  ignore_public_acls        = "${var.ignore_public_acls}"
  block_public_policy       = "${var.block_public_policy}"
  restrict_public_buckets   = "${var.restrict_public_buckets}"
  S3_key                    = "${var.S3_key}"
  tagenv                    = "${var.tagenv}"

  #bu                        = "${var.bu}""
  #tagenv                    = "${var.tagenv}"
  #tag_region                = "${var.tag_region}"
  #Applicationtype           = "${var.Applicationtype}"

  vpc_id                = "${var.vpc_id}"
  name_analyzer                      = "${var.name_analyzer}"
  emr2_name                 = "${var.emr2_name}"
  release_label             = "${var.release_label}"
  applications              = "${var.applications}"
  ebs_root_volume_size      = "${var.ebs_root_volume_size}"
  key_name                  = "${var.key_name}"
  visible_to_all_users      = "${var.visible_to_all_users}"
  keep_job_flow_alive_when_no_steps = "${var.keep_job_flow_alive_when_no_steps}"
  # Public subnet ID
  subnet_id             = "${var.subnet_id}"
  termination_protection    = "${var.termination_protection}"
  bu                        = "${var.bu}"
  application           = "${var.application}"
  environment           = "${var.environment}"
  tag_region            = "${var.tag_region}"
  Applicationtype = "${var.Applicationtype}"
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
  
  # Cluster Scaling "${variables
  scaling_unit_type                     = "${var.scaling_unit_type}"
  scaling_minimum_capacity_units        = "${var.scaling_minimum_capacity_units}"
  scaling_maximum_capacity_units        = "${var.scaling_maximum_capacity_units}"
  scaling_maximum_ondemand_capacity_units = "${var.scaling_maximum_ondemand_capacity_units}"
  scaling_maximum_core_capacity_units     = "${var.scaling_maximum_core_capacity_units}"
}

#--------------------------------------------------------------------------#
# kinesis module
#--------------------------------------------------------------------------#
module "kinesis" {
  source = "./modules/main/kinesis"

  depends_on = [
    module.iam
  ]

  name_analyzer            = "${var.name_analyzer}"
  shard_count     = "${var.shard_count}"
  retention_period = "${var.retention_period}"
  url_shard_count = "${var.url_shard_count}"
  urlr_shard_count = "${var.urlr_shard_count}" 
  url_retention_period  = "${var.url_retention_period}"
  urlr_retention_period = "${var.urlr_retention_period}"
  url_ng_name           = "${var.url_ng_name}"
  urlrating_ng_name     = "${var.urlrating_ng_name}"
  rt_ng_name            = "${var.rt_ng_name}"

  #-----------------------------------------------#
  #  tags for AnalyzerNG Kinesis                  #
  #-----------------------------------------------#
  Environment           = "${var.Environment}"
  Name                  = "${var.Name}"
  BU                    = "${var.BU}"
  application           = "${var.application}"
  tag_region            = "${var.tag_region}"
  application_type = "${var.application_type}"
}

#--------------------------------------------------------------------------#
# dynamodb module
#--------------------------------------------------------------------------#
module "dynamodb" {
  source = "./modules/main/dynamodb"

  depends_on = [
    module.iam,
    module.s3 
  ]
  
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
  Applicationtype      = "${var.Applicationtype}"
  tags_Region          = "${var.tags_Region}"
  ttl_enabled          = "${var.ttl_enabled}"
  ttl_attribute_name   = "${var.ttl_attribute_name}"
  tags_Name            = "${var.tags_Name}"
  server_side_encryption_enabled     = "${var.server_side_encryption_enabled}"
  server_side_encryption_kms_key_arn = "${var.server_side_encryption_kms_key_arn}"
  point_in_time_recovery_enabled     = "${var.point_in_time_recovery_enabled}"
  stream_view_type                   = "${var.stream_view_type}"
  stream_enabled                     = "${var.stream_enabled}"

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
}

#--------------------------------------------------------------------------#
# redshift module
#--------------------------------------------------------------------------#
module "redshift" {
  source = "./modules/main/redshift"

  depends_on = [
    module.iam,
    module.s3 
  ]

  subgrp_name_analyzer     = "${var.subgrp_name_analyzer}"
  subnet_grp_enabled = "${var.subnet_grp_enabled}"
  subnet_ids  = "${var.subnet_ids}"
  parameter_gname_enabled = "${var.parameter_gname_enabled}"
  parameter_gname_analyzer = "${var.parameter_gname_analyzer}"
  paramname                    = "${var.paramname}"
  paramvalue                   = "${var.paramvalue}"
  name            = "${var.name_analyzer}"
  database_name_analyzer   = "${var.database_name_analyzer}"
  isencrypted     = "${var.isencrypted}"
  master_password_analyzer = "${var.master_password_analyzer}"
  master_username_analyzer = "${var.master_username_analyzer}"
  node_type_analyzer         = "${var.node_type_analyzer}"
  number_of_nodes   = "${var.number_of_nodes}"
  enhancedvpc       = "${var.enhancedvpc}"
  publicly_accessible = "${var.publicly_accessible}"
  BU                           = "${var.BU}"
  Application                  = "${var.Application}"
  Applicationtype              = "${var.Applicationtype}"
  tag_region                   = "${var.tag_region}"
  tag_env                      = "${var.tag_env}"
  securitygrp_ids              = "${var.securitygrp_ids}"
  cluster_iam_roles            = "${var.cluster_iam_roles}"
  preferred_maintenance_window = "${var.preferred_maintenance_window}"
  
}

#--------------------------------------------------------------------------#
# eks-collecter-NG module
#--------------------------------------------------------------------------#
module "eks-collector-NG" {
  # count = 0
  source = "./modules/main/eks-collecter-NG"

  depends_on = [
    module.iam,
    module.s3 
  ]

  region          = var.region

  tcp_port        = "${var.tcp_port}"
  protocol        = "${var.protocol}"
  vpc_id          = "${var.vpc_id}"
  
  ##CIDR 
  cidr_blocks_all_worker_groups  = "${var.cidr_blocks_all_worker_groups}"
  cluster_endpoint_private_access_cidrs = "${var.cluster_endpoint_private_access_cidrs}"
  
  ## Private subnets of the NSM R&A NSV's (LAN)
  vpc_private_subnets = "${var.vpc_private_subnets}"
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
  environment                    = "${var.environment}"
  tag_region                     = "${var.tag_region}"
  applicationtype                = "${var.applicationtype}"
  bu                             = "${var.bu}"
  application                    = "${var.application}"

  ssh_key                        = "${var.ssh_key}"
  
  map_accounts                          = "${var.map_accounts}"
  map_roles                             = "${var.map_roles}"
  map_users                             = "${var.map_users}"
  
  subnet_tags     = "${var.subnet_tags}"
}

#--------------------------------------------------------------------------#
# athena module
#--------------------------------------------------------------------------#
module "athena" {
  source = "./modules/main/athena"

  depends_on = [
    module.iam,
    module.s3,
    module.emr
  ]

  ## Statefile location of EMR component
  network_state_bucket = "${var.network_state_bucket}"
  network_state_key    = "${var.network_state_key}"
  network_state_region = "${var.network_state_region}"

  ###############
  ## S3 Values ##
  ###############

  prefix_analyzer               = "${var.prefix_analyzer}"
  athena_bucket_acl    = "${var.athena_bucket_acl}"
  athena_bucket_key    = "${var.athena_bucket_key}"
  block_public_acls    = "${var.block_public_acls}"
  ignore_public_acls   = "${var.ignore_public_acls}"
  block_public_policy  = "${var.block_public_policy}"
  restrict_public_buckets = "${var.restrict_public_buckets}"

  ####################
  ## Athena Values  ##
  ####################
  athena_name            = "${var.athena_name}"
  athena_workgroup_name  = "${var.athena_workgroup_name}"
  named_query            = "${var.named_query }"
  workgroup_force_destroy= "${var.workgroup_force_destroy}"

  emr_bucketid            = var.emr_bucketid
}

#--------------------------------------------------------------------------#
# ec2 module
#--------------------------------------------------------------------------#
module "ec2" {
  source = "./modules/main/ec2"

  depends_on = [
    module.iam,
    module.s3,
    module.emr
  ]
  region             = var.region
## State file location of VPC to pull values
  network_state_bucket  = "${var.network_state_bucket}"
  network_state_key     = "${var.network_state_key}"
  network_state_region  = "${var.network_state_region}"

  ## State file location of EMR to pull values
  emr_network_state_key = "${var.emr_network_state_key}"

  #-----------------------------#
  #Applies to all the EC2
  #-----------------------------#
  key_name              = "${var.key_name}"
  prefix_analyzer                = "${var.prefix_analyzer}"
  az_one_cidr           = "${var.az_one_cidr}"
  enviroment_tag        = "${var.enviroment_tag}"
  bu_tag                = "${var.bu_tag}"
  applicationName_tag   = "${var.applicationName_tag}"
  region_tag            = "${var.region_tag}"
  applicationtype_tag   = "${var.applicationtype_tag}"
  deploymenttype_tag    = "${var.deploymenttype_tag}"
  
  #-------------------------------#
  # EMR Client1 "${variables
  #-------------------------------#
  emr_client1_number            = "${var.emr_client1_number}"
  emr_client1_ami               = "${var.emr_client1_ami}"
  emr_client1_ami_instance_type = "${var.emr_client1_ami_instance_type}"
  emr_client1_volume_size       = "${var.emr_client1_volume_size}"
  number_of_ebs_emr_client1     = "${var.number_of_ebs_emr_client1}"
  ebs_volume_size_emr_client1   = "${var.ebs_volume_size_emr_client1}"
  ebs_device_name_emr_client1   = "${var.ebs_device_name_emr_client1}"
  machineType_emr_client1       = "${var.machineType_emr_client1}"

  #-------------------------------#
  # EMR Client 2 "${variables
  #-------------------------------#

  emr_client2_number            = "${var.emr_client2_number}"
  emr_client2_ami               = "${var.emr_client2_ami}"
  emr_client2_ami_instance_type = "${var.emr_client2_ami_instance_type}"
  emr_client2_volume_size       = "${var.emr_client2_volume_size}"
  number_of_ebs_emr_client2     = "${var.number_of_ebs_emr_client2}"
  ebs_volume_size_emr_client2   = "${var.ebs_volume_size_emr_client2}"
  ebs_device_name_emr_client2   = "${var.ebs_device_name_emr_client2}"
  machineType_emr_client2       = "${var.machineType_emr_client2}"

  delete_volume_on_termination = var.delete_volume_on_termination
  ebs_iops                     = var.ebs_iops
  volume_type                  = var.volume_type
  volume_iops                  = var.volume_iops
  ebs_optimized                = var.ebs_optimized
  ebs_volume_type              = var.ebs_volume_type
  ami_shutdown_behavior        = var.ami_shutdown_behavior
  ami_monitoring               = var.ami_monitoring
  ami_termination_protection   = var.ami_termination_protection
  associate_public_ip_address  = var.associate_public_ip_address
  iam_instance_profile         = var.iam_instance_profile
  sd_check                     = var.sd_check
  subnet_id          = var.subnet_id
  security_group_ids = var.security_group_ids
}

#--------------------------------------------------------------------------#
# lambda module
#--------------------------------------------------------------------------#
module "lambda" {
  source = "./modules/main/lambda"
  
  depends_on = [
    module.iam,
    module.s3,
    module.athena,
    module.redshift
  ]
  region             = var.region
  network_state_bucket     = "${var.network_state_bucket}"
  network_state_key        = "${var.network_state_key}"
  network_state_region     = "${var.network_state_region}"

  ## State file location of Athena in Analyzer-NG
  athena_network_state_key = "${var.athena_network_state_key}"

  ## State file location of S3 in Analyzer-NG
  s3_network_state_key = "${var.s3_network_state_key}"
   
  #---------------------------------#
  # lambda "${variables                #
  #---------------------------------#

  prefix_analyzer                     = "${var.prefix_analyzer}"
  function_name              = "${var.function_name}"
  description_analyzer                = "${var.description_analyzer}"
  handler                    = "${var.handler}"
  runtime                    = "${var.runtime}"
  memory_size                = "${var.memory_size}"
  filename                   = "${var.filename}"
  concurrency                = "${var.concurrency}"
  lambda_timeout             = "${var.lambda_timeout}"
  log_retention              = "${var.log_retention}"
  tag_region                 = "${var.tag_region}"
  tag_environment            = "${var.tag_environment}"
  application                = "${var.application}"
  bu                         = "${var.bu}"
  Applicationtype            = "${var.Applicationtype}"
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
##output values instead of reading from remote state file
  ath_Athena_database     = var.ath_Athena_database
  ath_S3bucketname        = var.ath_S3bucketname
  rs_redshift_cluster_endpoint = var.rs_redshift_cluster_endpoint
  rs_redshift_cluster_database_name = var.rs_redshift_cluster_database_name
  rs_redshift_cluster_port = var.rs_redshift_cluster_port
  rs_redshift_username     = var.rs_redshift_username 
  rs_redshift_password     = var.rs_redshift_password 
}

#--------------------------------------------------------------------------#
#  nsvmodule
#--------------------------------------------------------------------------#
module "nsv" {
  source = "./modules/main/nsv"

  depends_on = [
    module.iam,
    module.s3,
  ]
  region             = var.region
  network_state_bucket     = "${var.network_state_bucket}"
  network_state_key        = "${var.network_state_key}"
  network_state_region     = "${var.network_state_region}"
 
  #----------------------------------#
  # Production nsv "${variables         #
  #----------------------------------#
  nsv_number               = "${var.nsv_number}"
  nsv_ami                  = "${var.nsv_ami}"
  nsv_volume_size          = "${var.nsv_volume_size}"
  key_name                 = "${var.key_name}"
  security_group_lb_ids    = "${var.security_group_lb_ids}"
  az_one_public_id         = "${var.az_one_public_id}"
  private_security_group_ids = var.private_security_group_ids
  az_one_public_cidr       = "${var.az_one_public_cidr}"
  nsv_ami_instance_type    = "${var.nsv_ami_instance_type}"  

  #------------------------------------------------------------------#
  #NSv LAN Nic "${variable for the attach Nic on the 1st Production NSv #
  #------------------------------------------------------------------#

  nsv1_lan_ip             = "${var.nsv1_lan_ip}"
  prefix_analyzer                  = "${var.prefix_analyzer}"
  enviroment_tag          = "${var.enviroment_tag}"
  bu_tag                  = "${var.bu_tag}"
  applicationName_tag     = "${var.applicationName_tag}"
  region_tag              = "${var.region_tag}"
  machineType_tag         = "${var.machineType_tag}"
  applicationtype_tag     = "${var.applicationtype_tag}"  
##
ami_termination_protection = var.ami_termination_protection
ebs_optimized               = var.ebs_optimized
ebs_volume_type             = var.ebs_volume_type
ebs_device_name             = var.ebs_device_name
ami_monitoring              = var.ami_monitoring
ami_shutdown_behavior       = var.ami_shutdown_behavior
associate_public_ip_address = var.associate_public_ip_address
volume_type                 = var.volume_type
ebs_volume_number           = var.ebs_volume_number
volume_iops                 = var.volume_iops
delete_volume_on_termination= var.delete_volume_on_termination
ebs_volume_size             = var.ebs_volume_size
ebs_iops                    = var.ebs_iops
subnet_ids  = var.subnet_ids
ami_private_subnet_id  = var.ami_private_subnet_id
} 


#--------------------------------------------------------------------------#
# glue-crawler module
#--------------------------------------------------------------------------#
module "glue-crawler" {
  source = "./modules/main/glue-crawler"

  depends_on = [
    module.iam,
    module.s3,
    module.emr,
    module.athena
  ]

  network_state_bucket     = "${var.network_state_bucket}"
  network_state_key        = "${var.network_state_key}"
  network_state_region     = "${var.network_state_region}"

  ## State file location of EMR in Analyzer-NG
  emr_network_state_key    = "${var.emr_network_state_key}"

  ## State file location of Athena in Analyzer-NG
  athena_network_state_key = "${var.athena_network_state_key}"
  
  crawler_name             = "${var.crawler_name}"
  crawler_name_url         = "${var.crawler_name_url}"
  crawler_name_appsdata    = "${var.crawler_name_appsdata}"
  crawler_name_coredata    = "${var.crawler_name_coredata}"
  crawler_name_ifacedata   = "${var.crawler_name_ifacedata}"
  crawler_name_memdata     = "${var.crawler_name_memdata}"
  crawler_name_reportdata  = "${var.crawler_name_reportdata}"
  crawler_name_flowblocked = "${var.crawler_name_flowblocked}"
  crawler_name_flowthreat  = "${var.crawler_name_flowthreat}"
  crawl_behaviour            = "${var.crawl_behaviour}"

  s3_bucketname           = var.s3_bucketname
  emr2_emr2bucketid       = var.emr2_emr2bucketid
  emr_bucketid            = var.emr_bucketid
  ath_Athena_database     = var.ath_Athena_database 
}


#-----------------------------------------------#
# Cloudwatch Monitoring		#
#-----------------------------------------------#
module "cloudwatch_Monitoring" {
 source = "./modules/main/cloudwacth_Monitoring"
  kinesis_stream_names = var.kinesis_stream_names
  kinesis_iterator_age_error_threshold = var.kinesis_iterator_age_error_threshold
  kinesis_iterator_age_error_evaluation_periods = var.kinesis_iterator_age_error_evaluation_periods
  kinesis_iterator_age_error_period = var.kinesis_iterator_age_error_period
  cpu_threshold = var.cpu_threshold
  redshift_evaluation_periods = var.redshift_evaluation_periods
  redshift_period = var.redshift_period
}

#----------------------------------------------#
# KMS module  #
#----------------------------------------------#
module "KMS" {
  source = "./modules/main/KMS"
  key_spec  = var.key_spec
  kms_alias = var.kms_alias
  enabled  = var.enabled
  rotation_enabled = var.rotation_enabled
  region = var.region
  user_arn = var.user_arn
}