#-------------------------------#
#aws info: 
#-------------------------------#
variable "aws_access_key" {}

variable "aws_secret_key" {}

variable "region" {
  description = "Region for the VPC"
  
}

#----------------------------------------------------------------------#
# iam module related varaibles 
#----------------------------------------------------------------------#
variable "iam_name" {}

variable "nsm_eks_worker_iam" {}#-------------------------------#

#----------------------------------------------------------------------#
## S3 Bucket variables                                                 #
#----------------------------------------------------------------------#

variable "prefix"  {
   description = "prefix for name of the bucket"
}

variable "acl" {
   description = "access control list for the bucket - private or public-read"
   #default =  "private"
}

variable "s3_region"  {
   description = "region for S3"
}

variable "versioning"  {
   description = "versioning for S3 - true/false"
   #default     = false
}

variable "lifecycle_name" {
  #default = "terraform created"
}

variable "lifecycle_enabled" {
  #default = true
}

variable "lifecycle_expiration_days" {
  description = "how many days to store S3 objects"
  #default     = 30
}

variable "analyzerng_logs_lifecycle_expiration_days" {
  description = "how many days to store analyzerNG S3 logs"
  #default     = 365
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

variable "create_folder" {
  #default = true
}

variable "S3_key" {
  type        = string
  description = "name for folder inside S3Bucket"
  #default     = "terraform-created"
}

variable "flow_lifecycle_expiration_days" {}

variable "lifecycle_name_1" {}
variable "lifecycle_name_2" {}
variable "lifecycle_name_3" {}
variable "lifecycle_name_4" {}
variable "lifecycle_name_5" {}
variable "lifecycle_name_6" {}


variable "tagenv"  {
   description = "Environment tag for S3"
}

variable "tagregion"  {
   description = "Region tag for S3"
}

variable "Application"  {
   description = "Application"
}

variable "Applicationtype"  {
   description = "Applicationtype"
}

variable "bu"  {
   description = "Bussiness Unit"
}
variable "prevent_destroy" {}
 variable "force_destroy" {}

#----------------------------------------------------------------------#
## emr variables                                                 #
#----------------------------------------------------------------------#


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

/*variable "prefix"  {
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
}*/

#variable "create_folder" {
#  #default = true
#}

/*variable "S3_key" {
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

variable "Applicationtype" {}*/
variable "tag_region"  {
   description = "Region tag for S3"
}

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
  default = true
}


variable "keep_job_flow_alive_when_no_steps" {
  default = true
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

#------------------------------------------------------------------#
# Kinesis variables                                                #
#------------------------------------------------------------------#

variable "shard_count" {
 
  description = "no of shard count of Kinesis"
  #default     = 10

}

variable "retention_period" {
   description = "Period to store the data"
   #default     = 24
}

variable "application_type" {}

/*
variable "flow_name" {}
variable "flow_shard_count" {

  description = "no of shard count of Kinesis"
  #default     = 10

}
variable "flow_retention_period" {
   description = "Period to store the data"
   #default     = 24
}
*/
#variable "url_name" {}
variable "url_shard_count" {

  description = "no of shard count of Kinesis"
  #default     = 5

}
variable "url_retention_period" {
   description = "Period to store the data"
   #default     = 24
}
#variable "urlr_name" {}
variable "urlr_shard_count" {

  description = "no of shard count of Kinesis"
  #default     = 10

}
variable "urlr_retention_period" {
   description = "Period to store the data"
   #default     = 24
}

variable "url_ng_name" {}

variable "urlrating_ng_name" {}

variable "rt_ng_name" {}

variable "BU" {
  type        = string
  description = "Bussiness unit"
  #default     = "Terraform"
}

/*variable "application" {
  type        = string
  description = "Application which uses Kinesis"
  #default     = "Terraform"
}*/

variable "Environment" {
  type        = string
  description = "Environment, production, prodsim or test"
  #default     = "test"
}

variable "Name" {
  type        = string
  description = "Tag Name for the Application"
  #default     = "Terraform"
}

/*variable "tag_region" {
  type        = string
  description = "Region which Kinesis is located"
  #default     = "us-west-2"
}*/

#------------------------------------------------------------------#
# dynamodb variables                                                #
#------------------------------------------------------------------#

variable "db_tablename" {
  description = "Name of the DynamoDB table"
  type        = string
  #default     = "name of db table"
}
variable "billing_mode" {
  description = "Controls how you are billed for read/write throughput and how you manage capacity. The valid values are PROVISIONED or PAY_PER_REQUEST"
  type        = string
  #default     = ""
}
variable "write_capacity" {
  description = "The number of write units for this table. If the billing_mode is PROVISIONED, this field should be greater than 0"
  #default     = ""
}

variable "read_capacity" {
  description = "The number of read units for this table. If the billing_mode is PROVISIONED, this field should be greater than 0"
  #default     = ""
}
variable "hash_key" {
  description = "The attribute to use as the hash (partition) key. Must also be defined as an attribute"
  type        = string
  #default     = ""
}

variable "range_key" {
  description = "The attribute to use as the range (sort) key. Must also be defined as an attribute"
  type        = string
  #default     = ""
}

variable "stream_enabled" {
  description = "Indicates whether Streams are to be enabled (true) or disabled (false)."
  default     = false
}

variable "stream_view_type" {
  description = "When an item in the table is modified, StreamViewType determines what information is written to the table's stream. Valid values are KEYS_ONLY, NEW_IMAGE, OLD_IMAGE, NEW_AND_OLD_IMAGES."
  type        = string
  default     = null
}

variable "attribute_type" {
  description = "Attribute type, which must be a scalar type: S, N, or B for (S)tring, (N)umber or (B)inary data"
  type        = string
  #default     = ""
}

variable "range_attribute_type" {
  description = "Attribute type, which must be a scalar type: S, N, or B for (S)tring, (N)umber or (B)inary data"
  type        = string
  #default     = ""
}


variable "alert_db_tablename" {
  description = "Name of the DynamoDB table"
  type        = string
  #default     = "name of db table"
}

variable "alert_write_capacity" {
  description = "The number of write units for this table. If the billing_mode is PROVISIONED, this field should be greater than 0"
  #default     = ""
}

variable "alert_read_capacity" {
  description = "The number of read units for this table. If the billing_mode is PROVISIONED, this field should be greater than 0"
  #default     = ""
}

variable "alert_hash_key" {
  description = "The attribute to use as the hash (partition) key. Must also be defined as an attribute"
  type        = string
  #default     = ""
}

variable "trafficstats_db_tablename" {
  description = "Name of the DynamoDB table"
  type        = string
  #default     = "name of db table"
}

variable "trafficstats_write_capacity" {
  description = "The number of write units for this table. If the billing_mode is PROVISIONED, this field should be greater than 0"
  #default     = ""
}

variable "trafficstats_read_capacity" {
  description = "The number of read units for this table. If the billing_mode is PROVISIONED, this field should be greater than 0"
  #default     = ""
}

variable "trafficstats_hash_key" {
  description = "The attribute to use as the hash (partition) key. Must also be defined as an attribute"
  type        = string
  #default     = ""
}


variable "serial_db_tablename" {
  description = "Name of the DynamoDB table"
  type        = string
  #default     = "name of db table"
}

variable "serial_hash_key" {
  description = "The attribute to use as the hash (partition) key. Must also be defined as an attribute"
  type        = string
  #default     = ""
}

variable "alertconfig_db_tablename" {
  description = "Name of the DynamoDB table"
  type        = string
  #default     = "name of db table"
}

variable "alertconfig_hash_key" {
  description = "The attribute to use as the hash (partition) key. Must also be defined as an attribute"
  type        = string
  #default     = ""
}

variable "trafficalerts_db_tablename" {
  description = "Name of the DynamoDB table"
  type        = string
  #default     = "name of db table"
}

variable "trafficalerts_hash_key" {
  description = "The attribute to use as the hash (partition) key. Must also be defined as an attribute"
  type        = string
  #default     = ""
}

variable "trafficstatsDebug_db_tablename" {
  description = "Name of the DynamoDB table"
  type        = string
  #default     = "name of db table"
}

variable "trafficstatsDebug_hash_key" {
  description = "The attribute to use as the hash (partition) key. Must also be defined as an attribute"
  type        = string
  #default     = ""
}

variable "ANGRealtime_hash_key" {
  description = "The attribute to use as the hash (partition) key. Must also be defined as an attribute"
  type        = string
  #default     = ""
}

variable "ANGRealtime_attribute_type" {}

variable "ANGRealtime_range_key" {}

variable "ANGRealtime_range_attribute_type" {}

variable "ttl_enabled" {
  description = "Indicates whether ttl is enabled"
  default     = false
}

variable "ttl_attribute_name" {
  description = "The name of the table attribute to store the TTL timestamp in"
  type        = string
  default     = "timetolive"
}

variable "server_side_encryption_enabled" {
  description = "Whether or not to enable encryption at rest using an AWS managed KMS customer master key (CMK)"
  default     = false
}

variable "server_side_encryption_kms_key_arn" {
  description = "The ARN of the CMK that should be used for the AWS KMS encryption. This attribute should only be specified if the key is different from the #default DynamoDB CMK, alias/aws/dynamodb."
  type        = string
  default     = "null"
}

variable "point_in_time_recovery_enabled" {
  description = "Whether to enable point-in-time recovery"
  default     = false
}

variable "tags_BU" {
  description = "key name"
  type        = string
  #default     = ""
}

variable "tags_Region" {
  description = "key value"
  type        = string
  #default     = ""
}

variable "tags_Application" {
  description = "key value"
  type        = string
  #default     = ""
}

variable "tags_Name" {
  description = "key name"
  type        = string
  default     = ""
}

#################################
## Redshift Specific Variables ##
#################################

variable "subgrp_name" {
  type        = string
  #default     = "terraform created"
  description = "subnet group id name"
}

variable "subnet_grp_enabled" {
  #default     = false
  description = "If we need to create a new subnet group, enable this."
}

variable "parameter_gname_enabled" {
  #default     = false
  description = "If we need to create a new parameter group, enable this."
}


variable "subnet_ids" {
  type        = list
  description = "List of subnet group IDs for the cache subnet group."
}

variable "parameter_gname" {
  #default     = "redshift-1.0"
  type        = string
  description = "The name of the parameter group."
}

/*variable "name" {
  type        = string
  description = "Redshift cluster name."
}*/


variable "database_name" {
  #default     = "terraform created"
  type        = string
  description = "Name of the DB."
}

variable "isencrypted" {
  description = "Determines if encrypted"
  #default     = false
}


variable "master_password" {
  #default     = "terraformcreated"
  type        = string
  description = "Master password for the DB."
}

variable "master_username" {
  #default     = "terraformcreated"
  type        = string
  description = "Master password for the DB."
}

variable "cluster_iam_roles" {
  description = "A list of IAM Role ARNs to associate with the cluster. A Maximum of 10 can be associated to the cluster at any time."
  type        = list(string)
  default     = []
}

variable "node_type" {
  #default     = ""
  type        = string
  description = "type of DB node."
}

variable "number_of_nodes" {
  #default     = "1"
  type        = string
  description = "number of nodes."
}

variable "enhancedvpc" {
  description = "(Optional) If true, enhanced VPC routing is enabled."
  #default     = false
}

variable "publicly_accessible" {
  description = "Determines if Cluster can be publicly available (NOT recommended)"
  #default     = false
}

variable "securitygrp_ids" {
  type        = list
  description = "List of security group IDs for the redshift."
}

variable "preferred_maintenance_window" {
  description = "When AWS can run with maintenance window"
  type        = string
  default     = "sat:10:00-sat:10:30"
}

variable "paramname" {
  description  = "Parameter Name"
  type         = string
}


variable "paramvalue" {
  description  = "Prameter value"
  type         = string
}

/*variable "BU" {
  description  = "Business Unit"
  type         = string
}

variable "Application" {
  description  = "Application Name"
  type         = string
}

variable "Applicationtype" {
  description  = "Application Type"
  type         = string
}

variable "tag_region" {
  description  = "Region"
  type         = string
}*/

variable "tag_env" {
  description  = "Environment -Sim, prod etc"
  type         = string
}

#----------------------------------------------------#
# eks-collectet-NG variables
#----------------------------------------------------#

variable "cluster_name" {
  description = "Cluster Name"
}

variable "tcp_port" {
  description = "tcp port"
}

variable "protocol" {
  description = "protocol"
}

/*variable "vpc_id" {
  description = "ID of VPC"
}*/

variable "subnet_tags" {
  description = "subnet_tags"
}

variable "vpc_private_subnets" {
  description = "VPC private cidr blocks"
}

variable "cluster_version" {
  description = "Kubernetes cluster version"
}

variable "log_types" {
  description = "Log types"
}

variable "log_retention_in_days" {
  description = "log retention in days"
}

#variable "worker_group_one_name" {
#  description = "Name of worker group one"
#}


variable "instance_type_group_one" {
  description = "instance type of worker group one"
}


#variable "platform_group_one" {
#  description = "platform of worker group one"
#}


variable "asg_desired_capacity_group_one" {
  description = "asg_desired_capacity of worker group one"
}


variable "asg_max_size_group_one" {
  description = "asg_max_size of worker group one"
}

variable "asg_min_size_group_one" {
  description = "asg_min_size of worker group two"
}

variable "ssh_key" {
  description = "ssh_key"
}

/*variable "environment" {
  description = "environment(prod, prodsim, dev etc)"
}

variable "tag_region" {
  description = "region of deployment"
}*/


variable "applicationtype" {
  description = "applicationtype"
}


/*variable "bu" {
  description = "Bussiness Unit"
}

variable "application" {
  description = "application name"
}*/

variable "nodegroup_name" {
  description = "Nodegroup Name"
}

variable "cidr_blocks_all_worker_groups" {
  description = "All worker groups"
  type = list(string)
}

variable "cluster_endpoint_private_access_cidrs" {
  description = "All CIDR that needs access to EKS cluster"
  type = list(string)
}


variable "map_accounts" {
  description = "Additional AWS account numbers to add to the aws-auth configmap."
  type        = list(string)
}

variable "map_roles" {
  description = "Additional IAM roles to add to the aws-auth configmap."
  type = list(object({
    rolearn  = string
    username = string
    groups   = list(string)
  }))
}

variable "map_users" {
  description = "Additional IAM users to add to the aws-auth configmap."
  type = list(object({
    userarn  = string
    username = string
    groups   = list(string)
  }))

  default = [
    {
      userarn  = "arn:aws:iam::940XXXXXXX359:user/btkubendran"
      username = "btkubendran"
      groups   = ["system:masters"]
    },
  ]
}

#################################
## Athena Specific Variables   ##
#################################

variable "athena_name" {
  type        = string
  #default     = "terraform created"
  description = "name of athena database"
}

variable "athena_workgroup_name" {
  type        = string
  description = "terraform-created"
}

variable "workgroup_force_destroy" {
  #default     = true
  description = "true to destroy workgroup even if results are there"
}

variable "named_query" {
  type        = string
  description = "name of named query"
}

variable "athena_bucket_acl" {
  type        = string
  #default     = "Private"
  description = "S3 bucket acl"
}

variable "athena_bucket_key" {
  type        = string
  #default     = "Private"
  description = "S3 bucket folder name to be created"
}

#-------------------------------------------------------------------#
#  ec2 module variables
#-------------------------------------------------------------------#

variable "emr_network_state_key" {}
#-----------------------------#
#Applies to all the EC2
#-----------------------------#

/*variable "prefix" {
  type        = string
  #default     = "terraform created"
  description = "Prefix for the resources"
}*/


#variable "az_one_id" {
#  description = "az one id"
#  #default     = ""
#}

#variable "az_two_id" {
#  description = "az two id"
#  #default     = ""
#}

variable "az_one_cidr" {
  description = "az one cidr block"
}

#variable "az_two_cidr" {
#  description = "az two cidr block"
#}

#variable "security_group_ids" {
#  description = "security group ids"
#  type        = list(string)
#}

variable "enviroment_tag" {
  description = "enviroment_tag"
}

variable "bu_tag" {
  description = "bu_tag"
}

variable "applicationName_tag" {
  description = "Bussiness Unit"
}

variable "region_tag" {
  description = "Region of ec2"
}

variable "applicationtype_tag" {
  description = "Application Type"
}

variable "deploymenttype_tag" {
  description = "Type of deployment"
  default     = "Terraform"
}


#-------------------------------#
# EMR Client1 variables
#-------------------------------#

variable "emr_client1_number" {
  description = "number of ec2 to deploy"
  #default     = 1
}

variable "emr_client1_ami" {
  description = "AMI to use"
}

variable "emr_client1_ami_instance_type" {
  description = "the type of instance i.e t2.nano t2.micro etc"
  #default     = "t2.nano"
}

variable "emr_client1_volume_size" {
  description = "the size of the volume"
  #default     = 100
}

variable "number_of_ebs_emr_client1" {
  description = "number of EBS to attach"
  #default     = 1
}

variable "ebs_volume_size_emr_client1" {
  description = "the size of the 2nd volume"
  #default     = 50
}

variable "ebs_device_name_emr_client1" {
  description = "device name for EBS mapping see AWS Doc for full list"
  type        = list(string)
  #default     = ["/dev/sdf"]
}


variable "machineType_emr_client1" {
  description = "machine type"
}

#-------------------------------#
# EMR Client 2 variables
#-------------------------------#


variable "emr_client2_number" {
  description = "number of ec2 to deploy"
  #default     = 1
}

variable "emr_client2_ami" {
  description = "AMI to use"
}

variable "emr_client2_ami_instance_type" {
  description = "the type of instance i.e t2.nano t2.micro etc"
  #default     = "t2.nano"
}

variable "emr_client2_volume_size" {
  description = "the size of the volume"
  #default     = 100
}

variable "number_of_ebs_emr_client2" {
  description = "number of EBS to attach"
  #default     = 1
}

variable "ebs_volume_size_emr_client2" {
  description = "the size of the 2nd volume"
  #default     = 50
}

variable "ebs_device_name_emr_client2" {
  description = "device name for EBS mapping see AWS Doc for full list"
  type        = list(string)
  #default     = ["/dev/sdf"]
}

variable "machineType_emr_client2" {
  description = "machine type"
}

variable "delete_volume_on_termination"{

 description = "Whether the volume should be destroyed on instance termination"
 #default = true

}

variable "ebs_iops" {
  description = "IOPS provision. This must be set for volume type io1"
  #default = 0

}
variable "volume_type"{

 description = "The type of volume Can be standard gp2 io1 sc1 or st1"
 #default = "gp2"
}
variable "ami_monitoring" {
  description = "if true, the launched EC2 instance will have detailed monitoring enabled"
  #default = false
}
variable "ami_termination_protection" {
  description = "if true, enables EC2 instance termination protection"
  #default = false

}
variable "associate_public_ip_address" {
  description = "Associate a public IP address "
  #default = false
}

variable "volume_iops"{

 description = "The amount of provisioned IOPS. This is only valid for volume_type of io1, and must be specified if using that type"
 #default = 0
}

variable "ebs_optimized"{
   description = "If true, the launched EC2 instance will be EBS-optimized."
   #default = false
}
variable "ebs_volume_type" {
  description = "the type of EBS volume. standard, gp or io1"
  #default     = "gp2"

}

variable "ami_shutdown_behavior" {
  description = "Shutdown behavior for the EC2 instance"
  #default = "stop"

}
variable "iam_instance_profile" {
   description = "iam role for the EC2"
   default =  ""
}
variable "sd_check" {
  description = "Controls if traffic is routed to the instance when the destination address does not match the instance. Used for NAT or VPNs. defaults true"
  default = true
}
#################################
## lambda Specific Variables  ##
#################################

variable "athena_network_state_key" {
  description = "Key of the remote state bucket"
}

variable "s3_network_state_key" {
  description = "Key of the remote state bucket"
}

variable "function_name" {
  description = "A unique name for your Lambda Function."
  type        = string
}
variable "description" {
  description = "Description of what your Lambda Function does."
  type        = string
}
variable "runtime" {
  description = "See Runtimes for valid values."
}
variable "handler" {
  description = "The function entrypoint in your code."
  type        = string
}
variable "memory_size" {
  description = "Amount of memory in MB your Lambda Function can use at runtime. defaults to 128."
}
variable "filename" {
  description = "Name of the function ZIP file."
  type        = string
}
variable "concurrency" {
  description = "The amount of reserved concurrent executions for this lambda function. A value of 0 disables lambda from being triggered and -1 removes any concurrency limitations. "
}
variable "lambda_timeout" {
  #default     = 5
  description = "The amount of time your Lambda Function has to run in seconds. defaults to 5"
}
variable "log_retention" {
  #default     = 14
  description = "Specifies the number of days you want to retain log events in the specified log group."
}

/*variable "tag_region" {
  description = "region tag."
  type        = string
}
variable "application" {
  description = "application tag."
  type        = string
}
variable "bu" {
  description = "Bussiness Unit."
  type        = string
}
variable "Applicationtype" {
  description = "application Type tag."
  type        = string
}*/
variable "tag_environment" {
  description = "environment name - eg sim, production etc."
  type        = string
}
variable "schedulejobs_filename" {}

variable "logparser_runtime" {}

variable "logparser_filename" {}

variable "logparser_description" {}

variable "logprocessor_filename" {}

variable "logprocessor_description" {}

variable "realtimereport_filename" {}

variable "realtimereport_description" {}

variable "s3bucketmonitor_filename" {}

variable "s3bucketmonitor_description" {}

variable "terminaterestartemr_filename" {}

variable "terminaterestartemr_description" {}

variable "emr_logprocessor" {}

variable "emr_logparser" {}

variable "deleteDynamodb_description" {}

variable "deleteDynamodb_filename" {}

variable "terminatemrdynamodb_description" {}

variable "terminatemrdynamodb_filename" {}

variable "stepFunction_filename" {}

variable "stepFunction_description" {}

variable "logProcessor_new_filename" {}

variable "logProcessorWeb_filename" {}

variable "ANG-Setup_filename" {}

variable "secret_names" {}

variable "ANG-ops_filename" {}

variable "ANG-lambda_update_filename" {}

variable "ANG-lambda_partitionprojection_filename" {}

variable "ANG-lambda_WeeklyRedShiftCommands_filename" {}

variable "ANG-lambda_ReadRedShiftData_filename" {}

variable "ANG-lambda_ReadKinesisDataStream_filename" {}

variable "ANG-lambda_MonitorDataEmail_filename" {}

#-------------------------------#
#Nsv variables
#-------------------------------#

variable "nsv_number" {
  description = "number of ec2 to deploy"
  #default     = 1
}

variable "nsv_ami" {
  description = "AMI to use"
}

variable "nsv_ami_instance_type" {
  description = "the type of instance i.e t2.nano t2.micro etc"
  #default     = "t2.nano"
}

variable "nsv_volume_size" {
  description = "the size of the volume"
  #default     = 100
}

/*variable "key_name" {
  description = "the key file"
}*/

#variable "az_one_id" {
#  description = "az one id"
#  #default     = ""
#}

variable "az_one_public_id" {
  description = "az one id of public"
  #default     = ""
}

variable "az_one_public_cidr" {
  description = "az one public cidr block"
}

/*variable "private_security_group_ids" {
  description = "private security group ids of LBs"
  type        = list(string)
}

variable "ami_private_subnet_id" {}
*/
variable "security_group_lb_ids" {
  description = "security group ids of LBs"
  type        = list(string)
}


#------------------------------------------------------#
#NSv LAN Nic variable for the attach Nic on the 1st NSv
#------------------------------------------------------#
variable "nsv1_lan_ip" {
  description = "the LAN ip for the Nsv Firewall, has to match the az where its being deployed"
  type        = list(string)
}

/*variable "enviroment_tag" {}

variable "bu_tag" {}

variable "applicationName_tag" {}

variable "region_tag" {}

variable "applicationtype_tag" {}
*/


variable "ebs_device_name" {

  description = "Ebs mount point"
  type        = list(string)
  #default     = ["/dev/xvdb", "/dev/xvdc", "/dev/xvdd", "/dev/xvde", "/dev/xvdf", "/dev/xvdg", "/dev/xvdh", "/dev/xvdi", "/dev/xvdj", "/dev/xvdk", "/dev/xvdl", "/dev/xvdm", "/dev/xvdn", "/dev/xvdo", "/dev/xvdp", "/dev/xvdq", "/dev/xvdr", "/dev/xvds", "/dev/xvdt", "/dev/xvdu", "/dev/xvdv", "/dev/xvdw", "/dev/xvdx", "/dev/xvdy", "/dev/xvdz"]

}



variable "ebs_volume_number" {
 description = "number of extra volumes"
 #default = 1

}

variable "ebs_volume_size"{
 description = "ebs size"
 #default = 10
}


variable "machineType_tag" {}

#################################
## Crawler Specific Variables  ##
#################################

variable "crawler_name" {
  type        = string
  #default     = "terraform created"
  description = "Crawler name"
}

variable "crawler_name_url" {
  type        = string
  #default     = "terraform created"
  description = "Crawler name"
}

variable "crawler_name_appsdata" {
  type        = string
  #default     = "terraform created"
  description = "Crawler name"
}

variable "crawler_name_coredata" {
  type        = string
  #default     = "terraform created"
  description = "Crawler name"
}

variable "crawler_name_ifacedata" {
  type        = string
  #default     = "terraform created"
  description = "Crawler name"
}

variable "crawler_name_memdata" {
  type        = string
  #default     = "terraform created"
  description = "Crawler name"
}

variable "crawler_name_reportdata" {
  type        = string
  #default     = "terraform created"
  description = "Crawler name"
}

variable "crawler_name_flowblocked" {
  type        = string
  #default     = "terraform created"
  description = "Crawler name"
}

variable "crawler_name_flowthreat" {
  type        = string
  #default     = "terraform created"
  description = "Crawler name"
}

variable "crawl_behaviour" {}


