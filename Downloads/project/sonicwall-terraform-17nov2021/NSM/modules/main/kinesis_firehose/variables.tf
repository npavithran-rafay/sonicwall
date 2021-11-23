
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
## Redshift Specific Variables ##
#################################

variable "bucketname" {
  type        = "string"
  #default     = "terraform created"
  description = "S3 bucket name"
}


variable "arn_deliverystream" {
  type        = "string"
  description = "arn for firehose delivery streams."
}

#variable "database_name" {
  #default     = "terraform created"
 # type        = "string"
  #description = "Name of the DB."
##}

#variable "isencrypted" {
#  description = "Determines if encrypted"
#  #default     = false
#}


variable "iam_role_name" {
  #default     = "terraformcreated"
  type        = "string"
  description = "Name of the IAM role."
}

variable "iam_role_policy_name" {
  #default     = "terraformcreated"
  type        = "string"
  description = "Name of the IAM rolepolicy ."
}

variable "master_password" {
  #default     = "terraformcreated"
  type        = "string"
  description = "Master password for the DB."
}

variable "master_username" {
  #default     = "terraformcreated"
  type        = "string"
  description = "Master password for the DB."
}

variable "acl" {
  #default     = ""
  type        = "string"
  description = "public or private"
}

variable "clusterjdbc" {
  #default     = ""
  type        = "string"
  description = "redshift cluster jdbc endpoint"
}

variable "copy_options" {
  description = "copy options for fireshose"
  #default     = ""
  type        = "string"
}

#variable "copy_options1" {
 # description = "copy options for fireshose"
  #default     = ""
  #type        = "string"
#}

variable "destination" {
  # #default     = ""
  type        = "string"
  description = "whether its redshift or S3 or splunk etc."
}

#variable "firehosenames" {
  #default     = [""]
 # type        = "list"
#}


variable "firehosename1" {
  #default     = ""
  type        = "string"
  description = "firehose name."
}

variable "firehosename2" {
  #default     = ""
  type        = "string"
  description = "firehose name."
}
variable "firehosename3" {
  #default     = ""
  type        = "string"
  description = "firehose name."
}
variable "firehosename4" {
  #default     = ""
  type        = "string"
  description = "firehose name."
}
variable "firehosename5" {
  #default     = ""
  type        = "string"
  description = "firehose name."
}
variable "firehosename6" {
  #default     = ""
  type        = "string"
  description = "firehose name."
}
variable "firehosename7" {
  #default     = ""
  type        = "string"
  description = "firehose name."
}
variable "firehosename8" {
  #default     = ""
  type        = "string"
  description = "firehose name."
}
variable "firehosename9" {
  #default     = ""
  type        = "string"
  description = "firehose name."
}
variable "firehosename10" {
  #default     = ""
  type        = "string"
  description = "firehose name."
}
variable "firehosename11" {
  #default     = ""
  type        = "string"
  description = "firehose name."
}
variable "firehosename12" {
  #default     = ""
  type        = "string"
  description = "firehose name."
}
variable "firehosename13" {
  #default     = ""
  type        = "string"
  description = "firehose name."
}
variable "firehosename14" {
  #default     = ""
  type        = "string"
  description = "firehose name."
}
variable "firehosename15" {
  #default     = ""
  type        = "string"
  description = "firehose name."
}
variable "firehosename16" {
  #default     = ""
  type        = "string"
  description = "firehose name."
}
variable "firehosename17" {
  #default     = ""
  type        = "string"
  description = "firehose name."
}
variable "firehosename18" {
  #default     = ""
  type        = "string"
  description = "firehose name."
}
variable "firehosename19" {
  #default     = ""
  type        = "string"
  description = "firehose name."
}

variable "datatablename1" {
  #default     = ""
  type        = "string"
  description = "data table  name."
}

variable "datatablename2" {
  #default     = ""
  type        = "string"
  description = "data table  name."
}
variable "datatablename3" {
  #default     = ""
  type        = "string"
  description = "data table  name."
}
variable "datatablename4" {
  #default     = ""
  type        = "string"
  description = "data table  name."
}
variable "datatablename5" {
  #default     = ""
  type        = "string"
  description = "data table  name."
}
variable "datatablename6" {
  #default     = ""
  type        = "string"
  description = "data table  name."
}
variable "datatablename7" {
  #default     = ""
  type        = "string"
  description = "data table  name."
}
variable "datatablename8" {
  #default     = ""
  type        = "string"
  description = "data table  name."
}
variable "datatablename9" {
  #default     = ""
  type        = "string"
  description = "data table  name."
}
variable "datatablename10" {
  #default     = ""
  type        = "string"
  description = "data table  name."
}
variable "datatablename11" {
  #default     = ""
  type        = "string"
  description = "data table  name."
}
variable "datatablename12" {
  #default     = ""
  type        = "string"
  description = "data table  name."
}
variable "datatablename13" {
  #default     = ""
  type        = "string"
  description = "data table  name."
}
variable "datatablename14" {
  #default     = ""
  type        = "string"
  description = "data table  name."
}
variable "datatablename15" {
  #default     = ""
  type        = "string"
  description = "data table  name."
}
variable "datatablename16" {
  #default     = ""
  type        = "string"
  description = "data table  name."
}
variable "datatablename17" {
  #default     = ""
  type        = "string"
  description = "data table  name."
}
variable "datatablename18" {
  #default     = ""
  type        = "string"
  description = "data table  name."
}
variable "datatablename19" {
  #default     = ""
  type        = "string"
  description = "data table  name."
}

variable "bu" {
  #default     = "terraform"
  description = "Bussiness unit."
  type        = "string"
}

variable "application" {
  #default     = "terraform"
  description = "application name."
  type        = "string"
}

variable "tag_environment" {
  #default     = "terraform-created"
  description = "environment - prod, sim etc."
  type        = "string"
}

variable "tag_region" {
  #default     = "terraform-created"
  description = "name of the region."
  type        = "string"
}

