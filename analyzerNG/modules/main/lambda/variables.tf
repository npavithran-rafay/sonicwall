variable "region" {
}

variable "network_state_bucket" {
  description = "Name of the remote state bucket to pull the values"
}

variable "network_state_key" {
  description = "Key of the remote state bucket"
}

variable "network_state_region" {
  description = "Region of the remote state bucket"
}

variable "athena_network_state_key" {
  description = "Key of the remote state bucket"
}

variable "s3_network_state_key" {
  description = "Key of the remote state bucket"
}


#------------------------#
# lambda variables       #
#------------------------#

variable "prefix_analyzer" {
  description = "A prefix for your Lambda Function."
  type        = string
}

variable "function_name" {
  description = "A unique name for your Lambda Function."
  type        = string
}
variable "description_analyzer" {
  description = "Description of what your Lambda Function does."
  type        = string
}
variable "runtime" {
  description = "See Runtimes for valid values."
}
variable "handler" {
  description = "The function entrypoint in your code."
  type        = string
}
variable "memory_size" {
  description = "Amount of memory in MB your Lambda Function can use at runtime. defaults to 128."
}
variable "filename" {
  description = "Name of the function ZIP file."
  type        = string
}
variable "concurrency" {
  description = "The amount of reserved concurrent executions for this lambda function. A value of 0 disables lambda from being triggered and -1 removes any concurrency limitations. "
}
variable "lambda_timeout" {
  #default     = 5
  description = "The amount of time your Lambda Function has to run in seconds. defaults to 5"
}
variable "log_retention" {
  #default     = 14
  description = "Specifies the number of days you want to retain log events in the specified log group."
}

variable "tag_region" {
  description = "region tag."
  type        = string
}
variable "application" {
  description = "application tag."
  type        = string
}
variable "bu" {
  description = "Bussiness Unit."
  type        = string
}
variable "tag_environment" {
  description = "environment name - eg sim, production etc."
  type        = string
}

variable "Applicationtype" {
  description = "application Type tag."
  type        = string
}

variable "schedulejobs_filename" {}

variable "logparser_runtime" {}

variable "logparser_filename" {}

variable "logparser_description" {}

variable "logprocessor_filename" {}

variable "logprocessor_description" {}

variable "realtimereport_filename" {}

variable "realtimereport_description" {}

variable "s3bucketmonitor_filename" {}

variable "s3bucketmonitor_description" {}

variable "terminaterestartemr_filename" {}

variable "terminaterestartemr_description" {}

variable "emr_logprocessor" {}

variable "emr_logparser" {}

variable "deleteDynamodb_description" {}

variable "deleteDynamodb_filename" {}

variable "terminatemrdynamodb_description" {}

variable "terminatemrdynamodb_filename" {}

variable "stepFunction_filename" {}

variable "stepFunction_description" {}

variable "logProcessor_new_filename" {}

variable "logProcessorWeb_filename" {}

variable "ANG-Setup_filename" {}

variable "secret_names" {}

variable "ANG-ops_filename" {}

variable "ANG-lambda_update_filename" {}

variable "ANG-lambda_partitionprojection_filename" {}

variable "ANG-lambda_WeeklyRedShiftCommands_filename" {}

variable "ANG-lambda_ReadRedShiftData_filename" {}

variable "ANG-lambda_ReadKinesisDataStream_filename" {}

variable "ANG-lambda_MonitorDataEmail_filename" {}

variable "ath_Athena_database" {}
 variable "ath_S3bucketname" {}
 variable "rs_redshift_cluster_endpoint" {}
 variable "rs_redshift_cluster_database_name" {}
 variable "rs_redshift_cluster_port" {}
 variable "rs_redshift_username" {}
 variable "rs_redshift_password" {}