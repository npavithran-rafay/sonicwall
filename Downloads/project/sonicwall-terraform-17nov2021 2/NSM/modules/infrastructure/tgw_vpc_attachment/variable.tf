variable "tag_tgw_attachment_description" {
  description = "transit gateway tag attachment description"
  default     = "tgw-example-terraform-attachment"
}

variable "subnet_ids" {
  description = "subnet ids this field is- required"
  type        = "list"
}

variable "transit_gateway_id" {
  description = "transit gateway id - required"
}

variable "vpc_id" {
  description = "vpc id - required"
}

variable "transit_gateway_default_route_table_propagation" {
  description = "Boolean whether the VPC Attachment should propagate routes with the EC2 Transit Gateway propagation default route table"
  default     = true
}

variable "transit_gateway_default_route_table_association" {
  description = "Boolean whether the VPC Attachment should be associated with the EC2 Transit Gateway association default route table"
  default     = true
}

variable "dns_support" {
  description = "Whether DNS support is enabled"
  default     = "enable"
}

variable "ipv6_support" {
  description = "Whether ipv6 is enabled"
  default     = "disable"
}
