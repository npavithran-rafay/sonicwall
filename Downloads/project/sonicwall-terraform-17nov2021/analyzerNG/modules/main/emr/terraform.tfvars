/*#---------------------------------------------------------------#
#aws provider info                                              #
#---------------------------------------------------------------#
aws_access_key = ""

aws_secret_key = ""

#Region for the VPC
region = "us-west-1"

# bucket location where the VPC state file is stored
network_state_bucket = "nsm-production-terraform-state"
network_state_key    = "production/Frankfurt/nsm/general_vpc/vpc/terraform.tfstate"
network_state_region = "us-west-2"

prefix               = "eu1aws"

######################
## S3 bucket values ##
######################
  
  acl                       = "private"
  lifecycle_enabled         = true
  lifecycle_expiration_days = 14
  tagenv                    = "Production"
  block_public_acls         = true
  ignore_public_acls        = true
  block_public_policy       = true
  restrict_public_buckets   = true
  S3_key                    = "emr-logs/"

#################
## EMR  values ##
#################
 vpc_id                                         = "vpc-0fbd2eb5666a69c88"
 name                                           = "eu1aws-ang-logprocessor-emr-cluster"
 emr2_name                                      = "eu1aws-ang-logparser-emr-cluster"
 release_label                                  = "emr-5.30.1"
 applications                                   = ["Spark","Ganglia","Hadoop"]
 ebs_root_volume_size                           = 60
 key_name                                       = "fra-keys"
 # Public subnet ID
 subnet_id                                      = "subnet-0bcff0bc99c3fb55d"
 termination_protection                         = false
 bu                                             = "NSM"
 application                                    = "NSM"
 environment                                    = "Production"
 tag_region                                     = "Frankfurt"
 Applicationtype                                = "Analyzer-NG"
 create_task_instance_fleet                     = true
# Instance Fleet Common values

 ebs_size             = 32
 ebs_type             = "gp2"
 volumes_per_instance = 2

# MASTER Instance fleet

 master_instance_bidprice_percentage_1 = 100

 master_instance_type                  = "r5.xlarge"
 master_fleet_name                     = "MASTER-1"
 master_target_on_demand_capacity      = 1
 master_target_spot_capacity           = 0

# CORE Instance fleet

 core_instance_bidprice_percentage_1   = 100
 core_instance_bidprice_percentage_2   = 100

 core_instance_type_1                  = "r4.xlarge"
 core_instance_weighted_capacity_1     = 2

 core_instance_type_2                  = "r5.xlarge"
 core_instance_weighted_capacity_2     = 2

# core_spot_allocation_strategy         = "capacity-optimized"
# core_spot_block_duration_minutes      = 0
# core_spot_timeout_action              = "SWITCH_TO_ON_DEMAND"
# core_spot_timeout_duration_minutes    = 10

 core_fleet_name                       = "CORE-FLEET"
 core_target_on_demand_capacity        = 4
 core_target_spot_capacity             = 0

# Task Instance fleet

 task_instance_bidprice_percentage_1 = 100
 task_instance_bidprice_percentage_2 = 100
 task_instance_bidprice_percentage_3 = 100
 task_instance_bidprice_percentage_4 = 100

 task_instance_type_1                = "r4.xlarge"
 task_instance_weighted_capacity_1   = 2

 task_instance_type_2                = "r5.xlarge"
 task_instance_weighted_capacity_2   = 2

 task_instance_type_3                = "r4.2xlarge"
 task_instance_weighted_capacity_3   = 2

 task_instance_type_4                = "r5.2xlarge"
 task_instance_weighted_capacity_4   = 2

 task_spot_allocation_strategy       = "capacity-optimized"
 task_spot_block_duration_minutes    = 0
 task_spot_timeout_action            = "SWITCH_TO_ON_DEMAND"
 task_spot_timeout_duration_minutes  = 10

 task_fleet_name                     = "TASK FLEET"
 task_target_on_demand_capacity      = 2
 task_target_spot_capacity           = 4 

# Cluster Scaling variables

 scaling_unit_type                       = "InstanceFleetUnits"
 scaling_minimum_capacity_units          = 6
 scaling_maximum_capacity_units          = 12
 scaling_maximum_ondemand_capacity_units = 12
 scaling_maximum_core_capacity_units     = 12

 keep_job_flow_alive_when_no_steps       = "true"
 visible_to_all_users                    = "true"
*/