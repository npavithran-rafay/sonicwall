variable "region" {
  #default = "us-west-2"
}

variable "user_arn" {}

variable "key_spec" {
  #default = "SYMMETRIC_DEFAULT"
}

variable "kms_alias" {
 #default = "kms_test"
}
variable "enabled" {
  #default = true
}

variable "rotation_enabled" {
  #default = false
}

output "key_arn" {
  value = aws_kms_key.my_kms_key.arn
}