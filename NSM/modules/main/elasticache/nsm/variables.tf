


####################################
# Elasticache specific variables   #
####################################

variable "eng_name" {
  # type        = string
  description = "The name of the elasticache engine. redis or memcache"
}

variable "eng_ver" {
  # default     = "5.0.6"
  #type        = string
  description = "The version number of the cache engine to be used for the cache clusters in this replication group."
}

variable "port" {
  #type        = string
  description = "The port number on which each of the cache nodes will accept connections."
}

variable "numcache" {
  # default     = " "
  #type        = string
  description = "Number of cache clusters."
}

variable "par_name" {
  # default     = "Terraform Created"
  #type        = string
  description = "Parameter group name."
}
variable "par_name_cluster_mode_enabled" {
  # default     = "Terraform Created"
  type        = string
  description = "Parameter group name."
}
variable "nodetype" {
  # default     = ""
  #type        = string
  description = "The type and associated memory size of the nodes to be deployed."
}

variable "num_cache_nodes" {
  # default     = "1"
  #type        = string
  description = "The type and associated memory size of the nodes to be deployed."
}

variable "sg_ids" {
  #type        = list
  description = "List of security group IDs for the cache subnet group."
}

variable "maintenance_win" {
  # default     = ""
  #type        = string
  description = "Specifies the weekly time range for when maintenance on the cache cluster is performed."
}

variable "ec_az" {
  # default     = [""]
  #type        = list
  description = "A list of EC2 availability zones in which the replication group's cache clusters will be created. "
}

variable "snap_win" {
  # default     = ""
  #type        = string
  description = "The daily time range (in UTC) during which ElastiCache will begin taking a daily snapshot of your cache cluster."
}

variable "snap_reten_limit" {
  # default     = "5"
  #type        = string
  description = "The number of days for which ElastiCache will retain automatic cache cluster snapshots before deleting them."
}

variable "automatic_failover" {
  # default     = false
  #type        = string
  description = "Specifies whether a read-only replica will be automatically promoted to read/write primary if the existing primary fails."
}

# variable "at_rest" {
#   # default     = false
#   #type        = string
#   description = "Whether to enable encryption at rest."
# }

# variable "transit_encry" {
#   # default     = false
#   #type        = string
#   description = "Whether to enable encryption in transit."
# }

variable "apply_immediately" {
  # default     = false
  #type        = string
  description = "Specifies whether any modifications are applied immediately, or during the next maintenance window."
}

variable "replicas_per_node" {
  # default     = "1"
  #type        = string
  description = " Number of replicas per node"
}

variable "num_node_group" {
  # default     = "2"
  #type        = string
  description = " Number of node groups"
}

variable "repl_grp" {
  #type        = string
  description = "Replication group id."
}

variable "description" {
  # default     = "Managed by Terraform"
  #type        = string
  description = "The description of the all resources."
}

variable "name_tag" {
  # default     = "Managed by Terraform"
  #type        = string
  description = "Name of the resource."
}

variable "enviroment_tag" {
  # default     = "Managed by Terraform"
  #type        = string
  description = "The env tag of the resources."
}

variable "bu_tag" {
  # default     = "Managed by Terraform"
  #type        = string
  description = "The Bussiness unit of the elasticache."
}

variable "sn_grp_name" {
  # default     = ""
  #type        = string
  description = "elasticache subnet group name."
}

variable "sn_ids" {
  type        = list
  description = "List of subnet IDs for the cache subnet group."
}

variable "sn_grp_desc" {
  # default     = ""
  #type        = string
  description = "elasticache subnet group description."
}

variable "replication_enabled" {
  type = bool  
}
variable "cluster_replication_enabled" { 
  type = bool
}
variable "auth_token" {}
variable "kms_key_id" {}
variable "snapshot_arns" {
  # type = list
}
variable "at_rest_encryption_enabled" {}
variable "notification_topic_arn" {}
variable "transit_encryption_enabled" {}
variable "snapshot_name" {}
variable "auto_minor_version_upgrade" {}

