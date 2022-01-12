variable "public_key" {
  description = "The public API key for MongoDB Atlas"
}
variable "private_key" {
  description = "The private API key for MongoDB Atlas"
}

variable "atlas_region" {
  default     = "US_EAST_1"
  description = "Atlas Region"
}
variable "aws_region" {
  default     = "ap-southeast-1"
  description = "AWS Region"
}
variable "atlas_dbuser" {
  description = "The db user for Atlas"
}
variable "atlas_dbpassword" {
  description = "The db user passwd for Atlas"
}
variable "atlas_vpc_cidr" {
  description = "Atlas CIDR"
  #default     = ""
}

variable "aws_account_id" {
  description = "My AWS Account ID"
 # default     = ""
}


variable "vpc_id" {
 #default = "vpc-090d6746f40097acf"
}
variable "project_id" {}
variable "num_shards" {}
variable "electable_nodes" {}
variable "priority" {}
variable "read_only_nodes" {}
variable "provider_backup_enabled" {}
variable "auto_scaling_disk_gb_enabled" {}
variable "mongo_db_major_version" {}
variable "provider_name" {}
variable "disk_size_gb" {}
variable "provider_instance_size_name" {}
variable "cidr_block" {}
variable "enable_dns_hostnames" {}
variable "enable_dns_support" {}
variable "destination_cidr_block" {}