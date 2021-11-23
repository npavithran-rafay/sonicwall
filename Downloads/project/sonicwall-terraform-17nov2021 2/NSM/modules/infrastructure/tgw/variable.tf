variable "tag_tgw_name" {
  description = "transit gateway tag name"
  default     = "tgw-example-terraform"
}

variable "tag_tgw_bu" {
  description = "transit gateway tag bu "
  default     = "itops"
}

variable "description" {
  description = "transit gateway description"
  default     = "tgw create by terraform "
}

variable "amazon_side_asn" {
  description = "Private Autonomous System Number (ASN) for the Amazon side of a BGP session The range is 64512 to 65534 for 16-bit ASNs and 4200000000 to 4294967294 for 32-bit ASNs"
  default     = "64512"
}

variable "auto_accept_shared_attachments" {
  description = "Whether resource attachment requests are automatically accepted"
  default     = "disable"
}

variable "default_route_table_association" {
  description = "Whether resource attachments are automatically associated with the default association route table"
  default     = "enable"
}

variable "default_route_table_propagation" {
  description = "Whether resource attachments automatically propagate routes to the default propagation route table"
  default     = "enable"
}

variable "dns_support" {
  description = "Whether DNS support is enabled"
  default     = "enable"
}

variable "vpn_ecmp_support" {
  description = "Whether VPN Equal Cost Multipath Protocol support is enabled"
  default     = "enable"
}
