#############################
#create the Trnasit gateway
#############################
resource "aws_ec2_transit_gateway" "tgw" {
  description                    = "${var.description}"
  amazon_side_asn                = "${var.amazon_side_asn}"
  auto_accept_shared_attachments = "${var.auto_accept_shared_attachments}"

  default_route_table_association = "${var.default_route_table_association}"
  default_route_table_propagation = "${var.default_route_table_propagation}"
  dns_support                     = "${var.dns_support}"
  vpn_ecmp_support                = "${var.vpn_ecmp_support}"

  tags = {
    Name = "${var.tag_tgw_name}"
    Bu   = "${var.tag_tgw_bu}"
  }
}
