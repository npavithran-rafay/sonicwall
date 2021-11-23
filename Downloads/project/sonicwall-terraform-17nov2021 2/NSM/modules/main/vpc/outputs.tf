output "vpc_private_subnets_ids" {
  value = ["${aws_subnet.add_private_subnets.*.id}"]
}

output "vpc_private_subnets_cidrs" {
  value = ["${aws_subnet.add_private_subnets.*.cidr_block}"]
}

output "vpc_security_group_id" {
  value = "${module.vpc_security_cgms_group.sgid}"
}

#output "vpc_security_group_id" {
#  value = "${module.vpc_security_cass_group.sgid}"
#}
