


variable "network_state_bucket" {
  description = "Name of the remote state bucket to pull the values"
}

variable "network_state_key" {
  description = "Key of the remote state bucket"
}

variable "network_state_region" {
  description = "Region of the remote state bucket"
}


#################################
## S3 Specific Variables       ##
#################################

variable "prefix_analyzer" {
  type        = string
  #default     = "terraform created"
  description = "Prefix for the resources"
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


variable "block_public_acls" {
  #default     = true
  description = "block_public_acls."
}

variable "ignore_public_acls" {
  #default     = true
  description = "ignore_public_acls."
}

variable "block_public_policy" {
  #default     = true
  description = "block_public_policy."
}

variable "restrict_public_buckets" {
  #default     = true
  description = "restrict_public_buckets."
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
variable "emr_bucketid" {}