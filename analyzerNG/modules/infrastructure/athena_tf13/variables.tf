variable "athena_name" {
  type        = string
  #default     = "terraform created"
  description = "name of athena database"
}

variable "bucket_name" {
  type        = string
  #default     = "terraform created"
  description = "name of s3 bucket to store output results"
}


variable "create_workgroup" {
  #default     = false
  description = "true to create the workgroup."
}


variable "athena_workgroup_name" {
  type        = string
  #default     = "terraform created workgroup"
  description = "name of workgroup"
}

variable "workgroup_force_destroy" {
  #default     = true
  description = "true to force destroy workgroup even if results are there."
}


variable "s3_output_location" {
  type        = string
  description = "location of s3_output"
}

variable "create_named_query" {
  #default     = false
  description = "true for creating a named query."
}

variable "named_query" {
  type        = string
  #default     = "terraform-created-namedquery"
  description = "name of named Query"
}

variable "query" {
  type        = string
  description = "Query"
}
