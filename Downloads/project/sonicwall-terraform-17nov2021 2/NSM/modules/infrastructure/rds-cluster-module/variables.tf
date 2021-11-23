variable "identifier_string" {
    default = "instance-register"
}

variable "status" {
  default     = ""
}

variable "rds_cluster_sg" {
  default     = "rds_cluster_security_group"
}


variable "vpc_id" {
  type        = "string"
  default     = "vpc-2bc8ce50"
}

variable apply_immediately {
    type = "string"
    default = "false"
}

variable port {
    type = "string"
    default = "3306"
}

variable engine_mode {
    type = "string"
    default = "provisioned"
}

variable tag {
  default       = "rds cluster for instance register"
}

variable deletion_protection {
    type = "string"
    default = "false"
}
variable skip_final_snapshot {
    type = "string"
    default = "true"
}

variable subnet_ids {
    type = "list"
    default = ["subnet-50a1b96f","subnet-ccd94886"]
}

variable azs {
    type = "list"
    default = ["us-east-1a","us-east-1b"]
}

variable cluster_identifier {
    default = "instance-register-cluster"
}
variable subnet_group_name {
    default = "instance-register"
}
variable publicly_accessible {
    default = "false"
}
variable instance_class {
    default = "db.t2.small"
}
variable engine {
    default = "aurora"
}
variable engine_version {
    default = "5.6.10a"
}
variable database_name {
    default = "sonicwall"
}
variable master_username {
    default = "sonicwall"
}
variable master_password {
    default = "sonicwall"
}
variable backup_retention_period {
    default = "5"
}
