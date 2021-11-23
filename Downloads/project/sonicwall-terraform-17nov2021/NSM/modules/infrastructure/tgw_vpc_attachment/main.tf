################################################
#create the Trnasit gateway VPC attachment
##############################################
resource "aws_ec2_transit_gateway_vpc_attachment" "tgw_attachment" {
  subnet_ids                                      = ["${var.subnet_ids}"]
  transit_gateway_id                              = "${var.transit_gateway_id}"
  vpc_id                                          = "${var.vpc_id}"
  dns_support                                     = "${var.dns_support}"
  ipv6_support                                    = "${var.ipv6_support}"
  transit_gateway_default_route_table_propagation = "${var.transit_gateway_default_route_table_propagation}"
  transit_gateway_default_route_table_association = "${var.transit_gateway_default_route_table_association}"

  tags = {
    Name = "${var.tag_tgw_attachment_description}"
  }
}
