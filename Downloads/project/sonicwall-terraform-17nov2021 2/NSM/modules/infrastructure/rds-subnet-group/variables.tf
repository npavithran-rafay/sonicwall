
variable "db_subnet_group_name" {
  description  = "Name of subnet group"
}

variable "db_subnet_group_ids" {
  type = "list"
}

variable "tag_name" {
  description = "tag to db subnet group"
  default     = ""
} 

variable "db_sg_description" {
  description = "db subnet group description" 
  default     = ""
