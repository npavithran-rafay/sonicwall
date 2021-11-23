variable "vpc_id" {
  type        = "string"
  description = "VPC ID to create the cluster"
}

variable "name" {
  type        = "string"
  description = "Name of the application"
}

variable "release_label" {
  default = "emr-5.30.1"
}

variable "applications" {
  default = ["Spark"]
  type    = "list"
}

variable "termination_protection" {
  default = false
}

variable "keep_job_flow_alive_when_no_steps" {
  default = true
}

variable "ebs_root_volume_size" {
  default = "50"
}

variable "visible_to_all_users" {
  default = true
}

variable "log_uri" {
  type        = "string"
  description = "The path to the Amazon S3 location where logs for this cluster are stored"
}

variable "key_name" {}

variable "subnet_id" {}

variable "core_instance_name" {
  type        = "string"
  description = "name for Core instance group"
}

variable "core_instance_group_instance_type" {
  type        = "string"
  description = "EC2 instance type for all instances in the Core instance group"
  default     = "m5.xlarge"
}

variable "core_instance_group_instance_count" {
  description = "Target number of instances for the Core instance group. Must be at least 1"
  default     = "1"
}

variable "core_instance_group_ebs_size" {
  description = "Core instances volume size, in gibibytes (GiB)"
  default     = "64"
}

variable "core_instance_group_ebs_type" {
  type        = "string"
  description = "Core instances volume type. Valid options are `gp2`, `io1`, `standard` and `st1`"
  default     = "gp2"
}

variable "core_instance_group_ebs_iops" {
  description = "The number of I/O operations per second (IOPS) that the Core volume supports"
  default     = ""
}

variable "core_instance_group_ebs_volumes_per_instance" {
  description = "The number of EBS volumes with this configuration to attach to each EC2 instance in the Core instance group"
  default     = 1
}

variable "core_instance_group_autoscaling_policy" {
  type        = "string"
  description = "String containing the EMR Auto Scaling Policy JSON for the Core instance group"
  default     = ""
}

variable "master_instance_name" {
  type        = "string"
  description = "name for Master instance group"
}

variable "master_instance_group_instance_count" {
  description = "Target number of instances for the Master instance group. Must be at least 1"
  default     = "1"
}

variable "master_instance_group_instance_type" {
  type        = "string"
  description = "EC2 instance type for all instances in the Master instance group"
  default     = "m5.xlarge"
}

variable "master_instance_group_ebs_size" {
  description = "Master instances volume size, in gibibytes (GiB)"
  default     = "64"
}

variable "master_instance_group_ebs_type" {
  type        = "string"
  description = "Master instances volume type. Valid options are `gp2`, `io1`, `standard` and `st1`"
  default     = "gp2"
}

variable "master_instance_group_ebs_iops" {
  description = "The number of I/O operations per second (IOPS) that the Master volume supports"
  default     = ""
}

variable "master_instance_group_ebs_volumes_per_instance" {
  description = "The number of EBS volumes with this configuration to attach to each EC2 instance in the Master instance group"
  default     = "1"
}

#variable "master_instance_group_bid_price" {
#  type        = "string"
#  description = "Bid price for each EC2 instance in the Master instance group, expressed in USD. By setting this attribute, the instance group is being #declared as a Spot Instance, and will implicitly create a Spot request. Leave this blank to use On-Demand Instances"
#  default     = "10"
#}

variable "bu" {
  type        = "string"
  description = "Bussiness unit"
  default     = "Terraform"
}

variable "application" {
  type        = "string"
  description = "Application which uses EMR"
  default     = "Terraform"
}

variable "environment" {
  type        = "string"
  description = "Environment, production, prodsim or test"
  default     = "test"
}

variable "region" {
  type        = "string"
  description = "Region which EMR located"
  default     = "us-west-2"
}

variable "create_task_instance_group" {
  description = "Need to create a task instance group? true for yes"
  default     = false
}

variable "task_instance_name" {
  type        = "string"
  description = "name for task instance group"
}

variable "task_instance_group_instance_type" {
  type        = "string"
  description = "EC2 instance type for all instances in the Task instance group"
  default     = "r5.2xlarge"
}

variable "task_instance_group_instance_count" {
  description = "Target number of instances for the Task instance group. Must be at least 1"
  default     = "1"
}

variable "task_instance_group_ebs_size" {
  description = "Task instances volume size, in gibibytes (GiB)"
  default     = "64"
}

variable "task_instance_group_ebs_optimized" {
  description = "Indicates whether an Amazon EBS volume in the Task instance group is EBS-optimized. Changing this forces a new resource to be created"
  default     = false
}

variable "task_instance_group_ebs_type" {
  type        = "string"
  description = "Task instances volume type. Valid options are `gp2`, `io1`, `standard` and `st1`"
  default     = "gp2"
}

variable "task_instance_group_ebs_iops" {
  description = "The number of I/O operations per second (IOPS) that the Task volume supports"
  default     = ""
}

variable "task_instance_group_ebs_volumes_per_instance" {
  description = "The number of EBS volumes with this configuration to attach to each EC2 instance in the Task instance group"
  default     = "1"
}

#variable "task_instance_group_bid_price" {
#  type        = "string"
#  description = "Bid price for each EC2 instance in the Task instance group, expressed in USD. By setting this attribute, the instance group is being declared #as a Spot Instance, and will implicitly create a Spot request. Leave this blank to use On-Demand Instances"
#  default     = null
#}


variable "task_instance_group_autoscaling_policy" {
  type        = "string"
  description = "String containing the EMR Auto Scaling Policy JSON for the Task instance group"
  default     = ""
}
