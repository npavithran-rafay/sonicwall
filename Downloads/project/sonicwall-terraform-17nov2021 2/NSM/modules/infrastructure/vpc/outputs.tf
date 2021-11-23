output "vpc_id"{
  value = "${aws_vpc.production_vpc.id}"
}

output "vpc_cidr_block"{
  value = "${aws_vpc.production_vpc.cidr_block}"
}

output "private_subnets_ids"{
   value = "${aws_subnet.production_private_subnets.*.id}"
}

output "private_subnets_cidrs" {
  value = "${aws_subnet.production_private_subnets.*.cidr_block}"
}

output "public_subnets_cidrs" {
  value = "${aws_subnet.production_public_subnets.*.cidr_block}"
}

output "public_subnets_ids" {
   value = "${aws_subnet.production_public_subnets.*.id}"
}

output "main_routetable_id" {
  value = "${aws_vpc.production_vpc.main_route_table_id}"
}

output "private_routetable_id" {
   value = "${aws_route_table.production_private_routetable.id}"
}

output "public_routetable_id" {
   value = "${aws_route_table.production_public_routetable.id}"
}

