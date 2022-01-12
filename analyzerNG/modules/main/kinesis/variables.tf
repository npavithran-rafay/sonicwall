


variable "name_analyzer" {

  description = "Name of the Analyzer Ng Stream"

}

variable "shard_count" {
 
  description = "no of shard count of Kinesis"
  #default     = 10

}

variable "retention_period" {
   description = "Period to store the data"
   #default     = 24
}

variable "application_type" {}

/*
variable "flow_name" {}
variable "flow_shard_count" {

  description = "no of shard count of Kinesis"
  #default     = 10

}
variable "flow_retention_period" {
   description = "Period to store the data"
   #default     = 24
}
*/
#variable "url_name" {}
variable "url_shard_count" {

  description = "no of shard count of Kinesis"
  #default     = 5

}
variable "url_retention_period" {
   description = "Period to store the data"
   #default     = 24
}
#variable "urlr_name" {}
variable "urlr_shard_count" {

  description = "no of shard count of Kinesis"
  #default     = 10

}
variable "urlr_retention_period" {
   description = "Period to store the data"
   #default     = 24
}

variable "url_ng_name" {}

variable "urlrating_ng_name" {}

variable "rt_ng_name" {}

variable "BU" {
  type        = string
  description = "Bussiness unit"
  #default     = "Terraform"
}

variable "application" {
  type        = string
  description = "Application which uses Kinesis"
  #default     = "Terraform"
}

variable "Environment" {
  type        = string
  description = "Environment, production, prodsim or test"
  #default     = "test"
}

variable "Name" {
  type        = string
  description = "Tag Name for the Application"
  #default     = "Terraform"
}

variable "tag_region" {
  type        = string
  description = "Region which Kinesis is located"
  #default     = "us-west-2"
}

