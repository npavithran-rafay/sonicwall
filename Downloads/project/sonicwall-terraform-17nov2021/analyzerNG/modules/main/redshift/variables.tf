
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

variable "subgrp_name" {
  type        = string
  #default     = "terraform created"
  description = "subnet group id name"
}

variable "subnet_grp_enabled" {
  #default     = false
  description = "If we need to create a new subnet group, enable this."
}

variable "parameter_gname_enabled" {
  #default     = false
  description = "If we need to create a new parameter group, enable this."
}


variable "subnet_ids" {
  type        = list
  description = "List of subnet group IDs for the cache subnet group."
}

variable "parameter_gname" {
  #default     = "redshift-1.0"
  type        = string
  description = "The name of the parameter group."
}

variable "name" {
  type        = string
  description = "Redshift cluster name."
}


variable "database_name" {
  #default     = "terraform created"
  type        = string
  description = "Name of the DB."
}

variable "isencrypted" {
  description = "Determines if encrypted"
  #default     = false
}


variable "master_password" {
  #default     = "terraformcreated"
  type        = string
  description = "Master password for the DB."
}

variable "master_username" {
  #default     = "terraformcreated"
  type        = string
  description = "Master password for the DB."
}

variable "cluster_iam_roles" {
  description = "A list of IAM Role ARNs to associate with the cluster. A Maximum of 10 can be associated to the cluster at any time."
  type        = list(string)
  default     = []
}

variable "node_type" {
  #default     = ""
  type        = string
  description = "type of DB node."
}

variable "number_of_nodes" {
  #default     = "1"
  type        = string
  description = "number of nodes."
}

variable "enhancedvpc" {
  description = "(Optional) If true, enhanced VPC routing is enabled."
  #default     = false
}

variable "publicly_accessible" {
  description = "Determines if Cluster can be publicly available (NOT recommended)"
  #default     = false
}

variable "securitygrp_ids" {
  type        = list
  description = "List of security group IDs for the redshift."
}

variable "preferred_maintenance_window" {
  description = "When AWS can run with maintenance window"
  type        = string
  #default     = "sat:10:00-sat:10:30"
}

variable "paramname" {
  description  = "Parameter Name"
  type         = string
}


variable "paramvalue" {
  description  = "Prameter value"
  type         = string
}

variable "BU" {
  description  = "Business Unit"
  type         = string
}

variable "Application" {
  description  = "Application Name"
  type         = string
}

variable "Applicationtype" {
  description  = "Application Type"
  type         = string
}

variable "tag_region" {
  description  = "Region"
  type         = string
}

variable "tag_env" {
  description  = "Environment -Sim, prod etc"
  type         = string
}

