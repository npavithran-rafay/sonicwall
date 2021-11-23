output "local_vpc_main_route_table_id" {
  description = "Private route table"
  value       = "${data.aws_vpc.local.main_route_table_id}"
}

output "local_vpc_id" {
  description = "local vpc id"
  value       = "${data.aws_vpc.local.id}"
}

output "remote_vpc_main_route_table_id" {
  description = "Public route table"
  value       = "${data.aws_vpc.remote.main_route_table_id}"
}

output "remote_vpc_id" {
  description = "remote vpc id"
  value       = "${data.aws_vpc.remote.id}"
}
