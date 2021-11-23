output "tgw_route_table_id" {
  value = "${aws_ec2_transit_gateway_route_table.tgw_route_table.id}"
}

output "tgw_route_table_default_association_route_table" {
  value = "${aws_ec2_transit_gateway_route_table.tgw_route_table.default_association_route_table}"
}

output "tgw_route_table_default_propagation_route_table" {
  value = "${aws_ec2_transit_gateway_route_table.tgw_route_table.default_propagation_route_table}"
}

output "tgw_route_table_association_id" {
  value = "${aws_ec2_transit_gateway_route_table_association.tgw_route_table_association.id}"
}

output "tgw_route_table_association_resource_id" {
  value = "${aws_ec2_transit_gateway_route_table_association.tgw_route_table_association.resource_id}"
}

output "tgw_route_table_association_resource_type" {
  value = "${aws_ec2_transit_gateway_route_table_association.tgw_route_table_association.resource_type}"
}
