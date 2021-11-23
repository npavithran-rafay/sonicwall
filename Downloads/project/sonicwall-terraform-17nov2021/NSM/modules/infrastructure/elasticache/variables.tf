#variable "cluster_id" {
#  type        = "string"
#  description = "The cluster identifier. This parameter is stored as a lowercase string."
#}

#variable "vpc_id" {}

variable "replication_enabled" {
  default     = false
  description = "(Redis only) Enabled or disabled replication_group for redis standalone instance."
}

variable "cluster_replication_enabled" {
  default     = false
  description = "(Redis only) Enabled or disabled replication_group for redis cluster."
}

variable "engine_name" {
  type        = "string"
  description = "The name of the elasticache engine. redis or memcache"
}


variable "engine_ver" {
  default     = "5.0.6"
  type        = "string"
  description = "The version number of the cache engine to be used for the cache clusters in this replication group."
}


variable "port" {
  type        = "string"
  description = "The port number on which each of the cache nodes will accept connections."
}


variable "subnet_group_name" {
  type        = "string"
  description = "The subnet group name."
}


variable "num_cache_clusters" {
  # default     = " "
  type        = "string"
  description = "Number of cache clusters."
}

variable "parameter_gname" {
  default     = "Terraform Created"
  type        = "string"
  description = "Parameter group name."
}

variable "node_type" {
  default     = ""
  type        = "string"
  description = "The type and associated memory size of the nodes to be deployed."
}



variable "num_cache_nodes" {
  default     = "1"
  type        = "string"
  description = "The type and associated memory size of the nodes to be deployed."
}

variable "sg_ids" {
  type        = "list"
  description = "List of security group IDs for the cache subnet group."
}

variable "maintenance_window" {
  default     = ""
  type        = "string"
  description = "Specifies the weekly time range for when maintenance on the cache cluster is performed."
}


variable "ec_az" {
  type        = "list"
  description = "A list of EC2 availability zones in which the replication group's cache clusters will be created. "
}

variable "kms_key_id" {
  default     = ""
  type        = "string"
  description = "The ARN of the key that you wish to use if encrypting at rest. If not supplied, uses service managed encryption."
}

variable "auth_token" {
  default     = ""
  type        = "string"
  description = "(optional)The password used to access a password protected server."
}

variable "notification_topic_arn" {
  default     = ""
  description = "An Amazon Resource Name (ARN) of an SNS topic to send ElastiCache notifications to."
}

variable "snapshot_arns" {
  default     = [""]
  type        = "list"
  description = "A single-element string list containing an Amazon Resource Name (ARN) of a Redis RDB snapshot file stored in Amazon S3."
}

variable "snapshot_name" {
  default     = ""
  description = "The name of a snapshot from which to restore data into the new node group. Changing the snapshot_name forces a new resource."
}

variable "snapshot_window" {
  default     = ""
  type        = "string"
  description = "The daily time range (in UTC) during which ElastiCache will begin taking a daily snapshot of your cache cluster."
}

variable "snapshot_retention_limit" {
  default     = "5"
  type        = "string"
  description = "The number of days for which ElastiCache will retain automatic cache cluster snapshots before deleting them."
}

variable "automatic_failover_enabled" {
  default     = false
  type        = "string"
  description = "Specifies whether a read-only replica will be automatically promoted to read/write primary if the existing primary fails."
}

variable "auto_minor_version_upgrade" {
  default     = true
  description = "Specifies whether a minor engine upgrades will be applied automatically to the underlying Cache Cluster instances during the maintenance window. Defaults to true."
}

variable "at_rest_encryption_enabled" {
  default     = false
  type        = "string"
  description = "Whether to enable encryption at rest."
}

variable "transit_encryption_enabled" {
  default     = false
  type        = "string"
  description = "Whether to enable encryption in transit."
}

variable "apply_immediately" {
  default     = false
  type        = "string"
  description = "Specifies whether any modifications are applied immediately, or during the next maintenance window."
}

variable "replicas_per_node" {
  default     = "1"
  type        = "string"
  description = " Number of replicas per node"
}

variable "num_node_group" {
  default     = "2"
  type        = "string"
  description = " Number of node groups"
}


variable "repl_grp_id" {
  type        = "string"
  description = "Replication group id."
}


variable "description" {
  default     = "Managed by Terraform"
  type        = "string"
  description = "The description of the all resources."
}

variable "name_tag" {
  default     = "Managed by Terraform"
  type        = "string"
  description = "Name of the resource."
}

variable "enviroment_tag" {
  default     = "Managed by Terraform"
  type        = "string"
  description = "The env tag of the resources."
}

variable "bu_tag" {
  default     = "Managed by Terraform"
  type        = "string"
  description = "The Bussiness unit of the elasticache."
}

variable "sub_grp_name" {
  # default     = "xx"
  type        = "string"
  description = "elasticache subnet group name."
}

variable "subnet_ids" {
  type        = "list"
  description = "List of subnet IDs for the cache subnet group."
}

variable "sub_grp_description" {
  default     = ""
  type        = "string"
  description = "elasticache subnet group description."
}

