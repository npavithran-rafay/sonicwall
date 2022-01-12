output "vpc_id" {
  value = var.production_vpc_id != "" ? var.production_vpc_id : aws_vpc.vpc[0].id
}

output "vpc_private_subnets_ids" {
  value = ["${aws_subnet.add_private_subnets.*.id}"]
}
output "redshift_public_subnet_ids" {
  value = ["${aws_subnet.redshift_public_subnets.*.id}"]
}
output "mariadB_private_subnet_ids" {
  value = ["${aws_subnet.mariadB_private_subnets.*.id}"]
}
output "elasticsearch_private_subnet_ids" {
  value = ["${aws_subnet.elasticsearch_private_subnets.*.id}"]
}
output "vpc_private_subnets_cidrs" {
  value = ["${aws_subnet.add_private_subnets.*.cidr_block}"]
}

output "vpc_security_group_id" {
  value = "${module.vpc_security_cgms_group.sgid}"
}
output "linux_default_security_group_id" {
  value = ["${module.vpc_security_linux_default_group.sgid}"]
}
#output "vpc_security_group_id" {
#  value = "${module.vpc_security_cass_group.sgid}"
#}
