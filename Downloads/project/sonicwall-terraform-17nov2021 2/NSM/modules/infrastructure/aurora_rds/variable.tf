variable "cluster_identifier" {
  description = "The name of the RDS instance, if omitted, Terraform will assign a random, unique identifier"
  default     = ""
  type = "string"
}

variable "identifier" {
  description = "The name of the RDS instance, if omitted, Terraform will assign a random, unique identifier"
  default     = ""
  type = "string"
}

variable "availability_zone" {
  description = "The Availability Zone of the RDS instance"
  default     = [ ]
  type = "list"
}

variable "allocated_storage" {
  description = "The allocated storage in gigabytes"
  default     = ""
}

variable "storage_encrypted" {
  description = "Specifies whether the DB instance is encrypted"
  default     = false
}

variable "iam_roles" {
  description = "A List of ARNs for the IAM roles to associate to the RDS Cluster."
  default = []
  type = "list"
}

variable "iam_database_authentication_enabled" {
  description = "Specifies whether or mappings of AWS Identity and Access Management (IAM) accounts to database accounts is enabled"
  default     = false
}

variable "engine" {
  description = "The database engine to use"
  default     = ""
  type = "string"
}

variable "engine_version" {
  description = "The engine version to use"
  default     = ""
  type = "string"
}
#
variable "instance_class" {
  description = "The instance type of the RDS instance"
  default     = ""
  type = "string"
}

variable "database_name" {
  description = "The DB name to create. If omitted, no database is created initially"
  default     = ""
  type = "string"
}

variable "master_username" {
  description = "Username for the master DB user"
  default     = ""
  type = "string"
}

variable "master_password" {
  description = "Password for the master DB user. Note that this may show up in logs, and it will be stored in the state file"
  default     = ""
  type = "string"
}

variable "port" {
  description = "The port on which the DB accepts connections"
  default     = ""
  type = "string"
}

variable "final_snapshot_identifier" {
  description = "The name of your final DB snapshot when this DB instance is deleted."
  default     = false
}

variable "backup_retention_period" {
  description = "The days to retain backups for. Default 1"
  default = ""
  type = "string"
}

variable "vpc_security_group_ids" {
  description = "List of VPC security groups to associate"
  default     = []
  type = "list"
}

variable "db_subnet_group_name" {
  description = "Name of DB subnet group. DB instance will be created in the VPC associated with the DB subnet group. If unspecified, will be created in the default VPC"
  default     = ""
  type = "string"
}

variable "parameter_group_name" {
  description = "Name of the DB parameter group to associate"
  default     = ""
}

variable "apply_immediately" {
  description = "Specifies whether any database modifications are applied immediately, or during the next maintenance window"
  default     = false
}

variable "BU" {
  description = "Business Unit"
  default = ""
  type = "string"
}

variable "Environment" {
  description = "Environment for tagging Eg: test,dev,prod"
  default = ""
  type = "string"
}

variable "deletion_protection" {
  description = "The database can't be deleted when this value is set to true."
  default     = false
}

variable "skip_final_snapshot" {
  description = "Determines whether a final DB snapshot is created before the DB instance is deleted. If true is specified, no DBSnapshot is created. If false is specified, a DB snapshot is created before the DB instance is deleted, using the value from final_snapshot_identifier"
  default     = true
}

variable "publicly_accessible" {
  description = "Bool to control if instance is publicly accessible. Default false."
  default = false
}


variable "kms_key_id" {
  description = "The ARN for the KMS encryption key. If creating an encrypted replica, set this to the destination KMS ARN. If storage_encrypted is set to true and kms_key_id is not specified the default KMS key created in your account will be used"
  default     = ""
}

variable "snapshot_identifier" {
  description = "Specifies whether or not to create this database from a snapshot. This correlates to the snapshot ID you'd find in the RDS console, e.g: rds:production-2015-06-26-06-05."
  default     = ""
}

variable "license_model" {
  description = "License model information for this DB instance. Optional, but required for some DB engines, i.e. Oracle SE1"
  default     = ""
}

variable "db_parameter_group_name" {
  description = "The name of the DB parameter group to associate with this instance."
  default = ""
}

variable "preferred_backup_window" {
  description = "The daily time range during which automated backups are created if automated backups are enabled"
  default = ""
}

variable "preferred_maintenance_window" {
  description = "The window to perform maintenance in"
  default = ""
}

variable "monitoring_role_arn" {
  description = "The ARN for the IAM role that permits RDS to send enhanced monitoring metrics to CloudWatch Logs. You can find more information on the AWS Documentation what IAM permissions are needed to allow Enhanced Monitoring for RDS Instances."
  default = ""
}

variable "monitoring_interval" {
  description = "The interval, in seconds, between points when Enhanced Monitoring metrics are collected for the DB instance. To disable collecting Enhanced Monitoring metrics, specify 0. The default is 0. Valid Values: 0, 1, 5, 10, 15, 30, 60."
  default = 0
}

variable "promotion_tier" {
  description = "Default 0. Failover Priority setting on instance level. The reader who has lower tier has higher priority to get promoted to writer."
  default = 0
}

variable "auto_minor_version_upgrade" {
  description = "Indicates that minor engine upgrades will be applied automatically to the DB instance during the maintenance window. Default true."
  default = true
}
