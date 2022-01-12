
#################################
## Redshift Specific Variables ##
#################################

variable "bucketname" {
  # type        = string
  # default     = "terraform created"
  description = "S3 bucket name"
}

variable "iam_role_name" {
  # type        = string
  # default     = "terraform created"
  description = "IAM role name"
}


variable "iam_role_policy_name" {
  # type        = string
  # default     = "terraform created"
  description = "IAM role policy name"
}

variable "log_grp_name" {
  # type        = string
  description = "Name of cloudwatch log group."
}

variable "bucket_arn" {
  # type        = string
  description = "ARN for S3 Bucket."
}

variable "role_arn" {
  # type        = string
  description = "ARN for IAM role ."
}

variable "data_table_name" {
  # type        = string
  description = "name of the data table name."
}
#

#variable "log_stream_name" {
#  type        = string
##  description = "cloudwatch log stream name ."
#}

#variable "log_s3stream_name" {
#  type        = string
#  description = "cloudwatch log stream name ."
#}


# variable "database_name" {
#   # default     = "terraform created"
#   type        = string
#   description = "Name of the DB."
# }

variable "isenabled" {
  description = "Determines if enabled"
  # default     = false
}

variable "s3isenabled" {
  description = "Determines if enabled"
  # default     = false
}
variable "master_password" {
  # default     = "terraformcreated"
  # type        = string
  description = "Master password for the DB."
}

variable "master_username" {
  # default     = "terraformcreated"
  # type        = string
  description = "Master password for the DB."
}

variable "acl" {
  # default     = ""
  # type        = string
  description = "public or private"
}

variable "clusterjdbc" {
  # default     = ""
  # type        = string
  description = "redshift cluster jdbc endpoint"
}

variable "copy_options" {
  description = "copy options for fireshose"
  # default     = ""
  # type        = string
}


variable "destination" {
  # default     = ""
  # type        = string
  description = "whether its redshift or S3 or splunk etc."
}

variable "firehosename" {
  # default     = ""
  # type        = string
  description = "firehose name."
}

variable "bu" {
  # default     = "terraform"
  description = "Bussiness unit."
  # type        = string
}

variable "application" {
  # default     = "terraform"
  description = "application name."
  # type        = string
}

variable "tag_environment" {
  # default     = "terraform-created"
  description = "environment - prod, sim etc."
  # type        = string
}

variable "tag_region" {
  # default     = "terraform-created"
  description = "name of the region."
  # type        = string
}

