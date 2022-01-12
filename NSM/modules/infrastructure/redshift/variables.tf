variable "subgrp_name" {
  # type        = string
  # default     = "terraform created"
  description = "subnet group id name"
}

# variable "role_arns" {
#   # type        = list
#   # default     = [""]
#   description = "IAM roles arns to be associated to this redshift"
# }


variable "subnet_grp_enabled" {
  # default     = false
  description = "If we need to create a new subnet group, enable this."
}

variable "parameter_gname_enabled" {
  # default     = false
  description = "If we need to create a new parameter group, enable this."
}

variable "subnet_ids" {
  # type        = list
  description = "List of subnet group IDs for the cache subnet group."
}



variable "parameter_gname" {
  # default     = "redshift-1.0"
  # type        = string
  description = "The name of the parameter group."
}


variable "name" {
  # type        = string
  description = "Redshift cluster name."
}


variable "number_of_nodes" {
  # default     = "1"
  # type        = string
  description = "number of nodes."
}


variable "database_name" {
  # default     = "terraform created"
  # type        = string
  description = "Name of the DB."
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

variable "node_type" {
  # default     = ""
  # type        = string
  description = "type of DB node."
}

variable "enhancedvpc" {
  description = "(Optional) If true, enhanced VPC routing is enabled."
  # default     = false
}

variable "publicly_accessible" {
  description = "Determines if Cluster can be publicly available (NOT recommended)"
  # default     = false
}

variable "isencrypted" {
  description = "Determines if encrypted"
  # default     = false
}


variable "BU" {
  # default     = ""
  # type        = string
  description = "Bussiness Unit Name."
}

variable "securitygrp_ids" {
  # type        = list
  description = "List of security group IDs for the redshift."
}

variable "skip_final_snapshot" {
  description = "Determines if final snapshot before deletion should be taken or not"
  # default     = true
}
