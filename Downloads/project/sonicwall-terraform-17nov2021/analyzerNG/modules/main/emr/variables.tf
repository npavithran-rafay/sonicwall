####################################
#aws info
###################################
variable "aws_access_key" {}

variable "aws_secret_key" {}

variable "region" {
  description = "Region for the VPC"
  #default     = ""
}

variable "network_state_bucket" {
  description = "Name of the remote state bucket to pull the values"
}

variable "network_state_key" {
  description = "Key of the remote state bucket"
}

variable "network_state_region" {
  description = "Region of the remote state bucket"
}

variable "vpc_id" {}

variable "subnet_id" {}

#########################
## S3 Bucket variables ##
#########################

variable "prefix"  {
   description = "Prefix for the names"
}

variable "acl" {
   description = "access control list for the bucket - private or public-read"
   #default =  "private"
}

variable "lifecycle_enabled" {
  #default = true
}

variable "lifecycle_expiration_days" {
  description = "how many days to store S3 objects"
  #default     = "30"
}

variable "block_public_acls" {
  #default = true
}

variable "ignore_public_acls" {
  #default = true
}

variable "block_public_policy" {
  #default = true
}

variable "restrict_public_buckets" {
  #default = true
}

#variable "create_folder" {
#  #default = true
#}

variable "S3_key" {
  type        = string
  description = "name for folder inside S3Bucket"
  #default     = "terraform-created"
}

variable "bu"  {
   description = "Bussiness Unit"
}

variable "tagenv"  {
   description = "Environment tag for S3"
}

variable "tag_region"  {
   description = "Region tag for S3"
}

variable "Applicationtype" {}

###################
## EMR variables ##
###################

variable "name" {
  #default = "Terraform Created"
}

variable "emr2_name" {
  #default = "Terraform Created"
}


variable "release_label" {
  #default = "emr-5.30.1"
}

variable "applications" {
  #default = ["Spark"]
  type    = list
}

variable "termination_protection" {
  #default = true
}

variable "ebs_root_volume_size" {
  #default = "52"
}


variable "key_name" {}


variable "environment" {}


variable "application" {}


variable "visible_to_all_users" {
  #default = true
}


variable "keep_job_flow_alive_when_no_steps" {
  #default = true
}

variable "create_task_instance_fleet" {
  #default = true
}

variable "ebs_size" {}

variable "ebs_type" {}

variable "volumes_per_instance" {}

variable "master_instance_bidprice_percentage_1" {}

variable "master_instance_type" {}

variable "master_fleet_name" {}

variable "master_target_on_demand_capacity" {}

variable "master_target_spot_capacity" {}

variable "core_instance_bidprice_percentage_1" {}

variable "core_instance_bidprice_percentage_2" {}

variable "core_instance_type_1" {}

variable "core_instance_weighted_capacity_1" {}

variable "core_instance_type_2" {}

variable "core_instance_weighted_capacity_2" {}

#variable "core_spot_allocation_strategy" {}

#variable "core_spot_block_duration_minutes" {}

#variable "core_spot_timeout_action" {}

#variable "core_spot_timeout_duration_minutes" {}

variable "core_fleet_name" {}

variable "core_target_on_demand_capacity" {}

variable "core_target_spot_capacity" {}

variable "task_instance_bidprice_percentage_1" {}

variable "task_instance_bidprice_percentage_2" {}

variable "task_instance_type_1" {}

variable "task_instance_weighted_capacity_1" {}

variable "task_instance_type_2" {}

variable "task_instance_weighted_capacity_2" {}

variable "task_instance_type_3" {}

variable "task_instance_weighted_capacity_3" {}

variable "task_instance_bidprice_percentage_3" {}

variable "task_instance_type_4" {}

variable "task_instance_weighted_capacity_4" {}

variable "task_instance_bidprice_percentage_4" {}

variable "task_spot_allocation_strategy" {}

variable "task_spot_block_duration_minutes" {}

variable "task_spot_timeout_action" {}

variable "task_spot_timeout_duration_minutes" {}

variable "task_fleet_name" {}

variable "task_target_on_demand_capacity" {}

variable "task_target_spot_capacity" {}

variable "scaling_unit_type" {}

variable "scaling_minimum_capacity_units" {}

variable "scaling_maximum_capacity_units" {}

variable "scaling_maximum_ondemand_capacity_units" {}

variable "scaling_maximum_core_capacity_units" {}
