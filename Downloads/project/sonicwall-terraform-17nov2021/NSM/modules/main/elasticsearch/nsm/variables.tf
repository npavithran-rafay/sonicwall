// AWS CONFIG
variable "region" {
  description = "Set AWS region for deployment"
}

variable "aws_access_key" {}
variable "aws_secret_key" {}

//TF CONFIG
variable "domain_name" {
  description = "Domain name for the ES cluster"
}

//Set ES Version
variable "es_version" {
  description = "Version of ES to deploy"
  #default     = "6.8"
}

//VPC vars
variable "subnet_ids" {
  description = "Subnet IDs to deploy into"
  #default     = []
  type        = "list"
}

variable "security_group_ids" {
  description = "Security Group id to attach"
  #default     = []
  type        = "list"
}

//EBS vars for data nodes
variable "ebs_size" {
  description = "EBS volume size"
  #default     = 80
}

variable "ebs_type" {
  description = "EBS volume type"
  #default     = "gp2"
}

variable "ebs_iops" {
  description = "IOPS for io1 volume type"
  #default     = "0"
}

//Instance vars
variable "master_instance_count" {
  description = "Number of master instances, 3/5"
  #default     = 3
}

variable "master_instance_type" {
  description = " Type of master instances"
  #default     = "t2.small.elasticsearch"
}

variable "data_instance_count" {
  description = "Number of data instances"
  #default     = 2
}

variable "data_instance_type" {
  description = "Type of data instances"
  #default     = "t2.small.elasticsearch"
}

//AZ awareness vars
variable "zone_awareness" {
  description = "Enable zone awareness"
  #default     = "false"
}

variable "az_count" {
  description = "Number of AZs. 1/2/3"
  #default     = 2
}

//Node to node encryption vars
variable "node_to_node_encryption" {
  description = "Enable node-to-node encryption"
  #default     = "false"
}

//Logging
//Slow Logs Index
variable "log_publishing_index_enabled" {
  description = "Enable slow log indexing"
  #default     = "false"
}

#variable "log_publishing_index_cloudwatch_log_group_arn" {
 # description = "ARN of Cloudwatch Log Group for Slow Index Logs"
  #default     = ""
#}

//Search Slow Logs
variable "log_publishing_search_enabled" {
  description = "Enable slow log search"
  #default     = "false"
}

#variable "log_publishing_search_cloudwatch_log_group_arn" {
 # description = "ARN of Cloudwatch Log Group for Slow log search"
  #default     = ""
#}

//App Logs
variable "log_publishing_application_enabled" {
  description = "Enable ES Application Logs"
  #default     = "false"
}

#variable "log_publishing_application_cloudwatch_log_group_arn" {
 # description = "ARN of Cloudwatch Log Group for ES Application Logs"
  #default     = ""
#}

//Tags
variable "env" {
  description = "Environment"
  #default     = "dev"
}

variable "BU" {
  description = "Business unit"
  #default     = ""
}

variable "appname" {
  description = "Application Name"
  #default     = ""
}

variable "create_service_linked_role" {
  #default     = "false"
  description = ""
}
