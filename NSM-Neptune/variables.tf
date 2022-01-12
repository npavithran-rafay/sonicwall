variable "aws_region" {
  type = string
}
variable "neptune_cluster_name" {
  type = string
}
variable "neptune_engine" {
  type = string
}
variable "neptune_instance_class" {
  type = string
}
variable "neptune_publicly_accessible" {
  type = string
}
variable "vpc_id" {
  type = string
}
variable "backup_retention_period" {
  type = string
}
variable "preferred_backup_window" {
  type = string
}
variable "neptune_skip_final_snapshot" {
  type = string
}
variable "neptune_iam_database_authentication_enabled" {
  type = string
}
variable "neptune_apply_immediately" {
  type = string
}
variable "neptune_sg_name" {}
variable "neptune_count" {}

variable "availability_zones" {
  type = list(string)
}
