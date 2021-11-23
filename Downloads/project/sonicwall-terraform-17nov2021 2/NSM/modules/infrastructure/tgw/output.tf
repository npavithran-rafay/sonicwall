output "tgw_id" {
  value = "${aws_ec2_transit_gateway.tgw.id}"
}

output "tgw_arn" {
  value = "${aws_ec2_transit_gateway.tgw.arn}"
}

output "tgw_association_default_route_table_id" {
  value = "${aws_ec2_transit_gateway.tgw.association_default_route_table_id}"
}

output "tgw_owner_id" {
  value = "${aws_ec2_transit_gateway.tgw.owner_id}"
}

output "tgw_propagation_default_route_table_id" {
  value = "${aws_ec2_transit_gateway.tgw.propagation_default_route_table_id}"
}
