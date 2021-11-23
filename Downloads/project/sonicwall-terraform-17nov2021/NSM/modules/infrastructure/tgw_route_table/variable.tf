variable "tag_tgw_route_table_description" {
  description = "transit gateway route table description"
  default     = "tgw-example-terraform-routetable"
}

variable "transit_gateway_id" {
  description = "transit gateway id - required"
}

variable "transit_gateway_attachment_id" {
  description = "transit gateway attachment id- required"
}

variable "transit_gateway_default_route_table_propagation" {
  description = "Boolean whether the VPC Attachment should propagate routes with the EC2 Transit Gateway propagation default route table"
  default     = true
}

variable "transit_gateway_default_route_table_association" {
  description = "Boolean whether the VPC Attachment should be associated with the EC2 Transit Gateway association default route table"
  default     = true
}
