



#########################
## S3 Bucket variables ##
#########################

variable "prefix_analyzer"  {
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

variable "lifecycle_name_analyzer" {
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

variable "prevent_destroy" {
  #default = false
}
variable "lifecycle_rule" {
  description = "List of maps containing configuration of object lifecycle management."
  type        = any
  default     = []
}
variable "server_side_encryption_configuration" {
  description = "Map containing server-side encryption configuration."
  type        = any
  default     = {}
}
variable "force_destroy" {
  #default = true
}