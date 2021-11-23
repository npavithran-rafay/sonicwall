variable "blackhole" {
  description = "Indicates whether to drop traffic that matches this route"
  default     = "false"
}

variable "transit_gateway_attachment_id" {
  description = "transit gateway attachment id- required"
}

variable "destination_cidr_block" {
  description = " IPv4 CIDR range used for destination matches. Routing decisions are based on the most specific match - required"
}

variable "transit_gateway_route_table_id" {
  description = "Identifier of EC2 Transit Gateway Route Table - required"
}
