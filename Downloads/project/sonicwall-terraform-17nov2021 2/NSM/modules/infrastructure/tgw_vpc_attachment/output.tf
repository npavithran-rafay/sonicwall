output "tgw_attachment_id" {
  value = "${aws_ec2_transit_gateway_vpc_attachment.tgw_attachment.id}"
}

output "tgw_attachment_vpc_owner_id" {
  value = "${aws_ec2_transit_gateway_vpc_attachment.tgw_attachment.vpc_owner_id}"
}
