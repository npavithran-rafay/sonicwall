
####################################
#aws info
###################################
variable "aws_access_key" {}

variable "aws_secret_key" {}

variable "region" {
  description = "Region for the VPC"
  #default     = ""
}

#################################
## S3 Specific Variables       ##
#################################

variable "bucket_name" {
  type        = "string"
  #default     = "terraform created"
  description = "S3 bucket name"
}

variable "acl" {
  type        = "string"
  #default     = "Private"
  description = "S3 bucket acl"
}

#variable "lifecycle_name" {
 # type        = "string"
  #default     = "terraform created"
  #description = "S3 bucket lifecycle name"
#}

#variable "storage_class" {
#  type        = "string"
#  description = "S3 bucket lifecycle transition"
#}
