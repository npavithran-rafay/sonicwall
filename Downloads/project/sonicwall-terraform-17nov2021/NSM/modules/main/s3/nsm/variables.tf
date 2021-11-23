variable "aws_access_key" {}

variable "aws_secret_key" {}

variable "region" {
  description = "Region for the VPC"
  
}
variable "acl_gitea" {}
variable "acl_reportlite" {}
variable "bucket_name_gitea" {}
variable "bucket_name_reportlite" {}
#variable "lifecycle_name" {}
variable "storage_class" {}