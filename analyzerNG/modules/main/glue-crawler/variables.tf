

variable "network_state_bucket" {
  description = "Name of the remote state bucket to pull the values"
}

variable "network_state_key" {
  description = "Key of the remote state bucket"
}

variable "network_state_region" {
  description = "Region of the remote state bucket"
}

variable "emr_network_state_key" {
  description = "Key of the remote state bucket"
}

variable "athena_network_state_key" {
  description = "Key of the remote state bucket"
}


#################################
## Crawler Specific Variables  ##
#################################

variable "crawler_name" {
  type        = string
  #default     = "terraform created"
  description = "Crawler name"
}

variable "crawler_name_url" {
  type        = string
  #default     = "terraform created"
  description = "Crawler name"
}

variable "crawler_name_appsdata" {
  type        = string
  #default     = "terraform created"
  description = "Crawler name"
}

variable "crawler_name_coredata" {
  type        = string
  #default     = "terraform created"
  description = "Crawler name"
}

variable "crawler_name_ifacedata" {
  type        = string
  #default     = "terraform created"
  description = "Crawler name"
}

variable "crawler_name_memdata" {
  type        = string
  #default     = "terraform created"
  description = "Crawler name"
}

variable "crawler_name_reportdata" {
  type        = string
  #default     = "terraform created"
  description = "Crawler name"
}

variable "crawler_name_flowblocked" {
  type        = string
  #default     = "terraform created"
  description = "Crawler name"
}

variable "crawler_name_flowthreat" {
  type        = string
  #default     = "terraform created"
  description = "Crawler name"
}

variable "crawl_behaviour" {}

variable "s3_bucketname" {}
variable "emr2_emr2bucketid" {}
variable "emr_bucketid" {}
variable "ath_Athena_database" {}
 