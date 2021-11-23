#-------------------------------#
#aws info: 
#-------------------------------#
variable "aws_access_key" {}

variable "aws_secret_key" {}

variable "region" {
  description = "Region for the VPC"
  #default     = "us-west-2"
}

#-----------------------------#
#Applies to all the RDS
#-----------------------------#

# variable "security_group_ids" {
#   description = "security group ids"
#   type        = "list"
# }

# variable "db_subnet_group" {
#   description = "List of subnets to create the db_subnet_group"
#   type        = "list"
# }

variable "db_subnet_group_name" {
  description = "Name of DB subnet group. DB instance will be created in the VPC associated with the DB subnet group. If unspecified, will be created in the default VPC"
  # default     = ""
}

#-------------------------------#
# RDS variables
#-------------------------------#

variable "rds_identifier" {
  description = "The name of the RDS instance, if omitted, Terraform will assign a random, unique identifier"
}

variable "engine" {
  description = "The database engine to use"
}

variable "engine_version" {
  description = "The engine version to use"
}

variable "instance_class" {
  description = "The instance type of the RDS instance"
}

variable "allocated_storage" {
  description = "The allocated storage in gigabytes"
  #default     = 50
}

variable "storage_type" {
  description = "One of 'standard' (magnetic), 'gp2' (general purpose SSD), or 'io1' (provisioned IOPS SSD). The default is 'io1' if iops is specified, 'standard' if not. Note that this behaviour is different from the AWS web console, where the default is 'gp2'."
  #default     = "gp2"
}

variable "db_name" {
  description = "The DB name to create. If omitted, no database is created initially"
  #default     = ""
}

variable "db_master_username" {
  description = "Username for the master DB user"
}

variable "db_master_password" {
  description = "Password for the master DB user. Note that this may show up in logs, and it will be stored in the state file"
}

variable "db_port" {
  description = "The port on which the DB accepts connections"
}

variable "multi_az" {
  description = "Specifies if the RDS instance is multi-AZ"
  #default     = false
}

variable "publicly_accessible" {
  description = "Bool to control if instance is publicly accessible"
  #default     = false
}

variable "allow_major_version_upgrade" {
  description = "Indicates that major version upgrades are allowed. Changing this parameter does not result in an outage and the change is asynchronously applied as soon as possible"
  #default     = false
}

variable "auto_minor_version_upgrade" {
  description = "Indicates that minor engine upgrades will be applied automatically to the DB instance during the maintenance window"
  #default     = true
}

variable "apply_immediately" {
  description = "Specifies whether any database modifications are applied immediately, or during the next maintenance window"
  #default     = false
}

variable "deletion_protection" {
  description = "The database can't be deleted when this value is set to true."
  #default     = false
}

variable "skip_final_snapshot" {
  description = "Determines whether a final DB snapshot is created before the DB instance is deleted. If true is specified, no DBSnapshot is created. If false is specified, a DB snapshot is created before the DB instance is deleted, using the value from final_snapshot_identifier"
  #default     = true
}

variable "db_backup_retention_period" {}
variable "db_backup_window" {}
variable "db_vpc_security_group_ids" {
  type = "list"
}
variable "db_subnet_ids" {
  type = "list"
}


variable "tags" {
  description = "all tags as a map"
  type = "map"
  #default = {}
}
