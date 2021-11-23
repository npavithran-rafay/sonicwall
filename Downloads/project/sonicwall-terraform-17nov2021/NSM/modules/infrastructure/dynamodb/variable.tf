variable "db_tablename" {  
  description = "Name of the DynamoDB table"
  type        = "string"
  default     = "test"
}
variable "billing_mode" {
  description = "Controls how you are billed for read/write throughput and how you manage capacity. The valid values are PROVISIONED or PAY_PER_REQUEST"
  type        = "string"
  default     = "PROVISIONED"
}
variable "write_capacity" {
  description = "The number of write units for this table. If the billing_mode is PROVISIONED, this field should be greater than 0"
  default     = 1
}

variable "read_capacity" {
  description = "The number of read units for this table. If the billing_mode is PROVISIONED, this field should be greater than 0"
  default     = 1
}
variable "hash_key" {
  description = "The attribute to use as the hash (partition) key. Must also be defined as an attribute"
  type        = "string"
  default     = "test_key"
}

variable "range_key" {
  description = "The attribute to use as the range (sort) key. Must also be defined as an attribute"
  type        = "string"
  default     = "ITOps"
}

variable "stream_enabled" {
  description = "Indicates whether Streams are to be enabled (true) or disabled (false)."
  default     = false
}

variable "stream_view_type" {
  description = "When an item in the table is modified, StreamViewType determines what information is written to the table's stream. Valid values are KEYS_ONLY, NEW_IMAGE, OLD_IMAGE, NEW_AND_OLD_IMAGES."
  type        = "string"
  default     = "NEW_AND_OLD_IMAGES"
}

variable "attribute_type" {
  description = "Attribute type, which must be a scalar type: S, N, or B for (S)tring, (N)umber or (B)inary data"
  type        = "string"
  default     = "S"
}

variable "ttl_enabled" {
  description = "Indicates whether ttl is enabled"
  default     = false
}

variable "ttl_attribute_name" {
  description = "The name of the table attribute to store the TTL timestamp in"
  type        = "string"
  default     = "timetolive"
}

variable "server_side_encryption_enabled" {
  description = "Whether or not to enable encryption at rest using an AWS managed KMS customer master key (CMK)"
  default     = false
}

variable "server_side_encryption_kms_key_arn" {
  description = "The ARN of the CMK that should be used for the AWS KMS encryption. This attribute should only be specified if the key is different from the default DynamoDB CMK, alias/aws/dynamodb."
  type        = "string"
  default     = "null"
}

variable "point_in_time_recovery_enabled" {
  description = "Whether to enable point-in-time recovery"
  default     = false
}

variable "tags_Name" {
  description = "key name"
  type        = "string"
  default     = "project"
}

variable "tags_BU" {
  description = "key name"
  type        = "string"
  default     = "project"
}

variable "tags_Region" {
  description = "key value"
  type        = "string"
  default     = "test"
}

variable "tags_application" {
  description = "key value"
  type        = "string"
  default     = "test"
}

