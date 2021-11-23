################################################
#create the Trnasit gateway route table
##############################################
resource "aws_ec2_transit_gateway_route_table" "tgw_route_table" {
  transit_gateway_id = "${var.transit_gateway_id}"

  tags = {
    Name = "${var.tag_tgw_route_table_description}"
  }
}

########################################################
#create the Trnasit gateway route table association
########################################################

resource "aws_ec2_transit_gateway_route_table_association" "tgw_route_table_association" {
  transit_gateway_attachment_id  = "${var.transit_gateway_attachment_id}"
  transit_gateway_route_table_id = "${aws_ec2_transit_gateway_route_table.tgw_route_table.id}"
}
