output "this_db_instance_address" {
  description = "The address of the RDS instance"
  value       = "${aws_db_instance.awsdb.address}"
}

output "this_db_instance_arn" {
  description = "The ARN of the RDS instance"
  value       = "${aws_db_instance.awsdb.arn}"
}

output "this_db_instance_availability_zone" {
  description = "The availability zone of the RDS instance"
  value       = "${aws_db_instance.awsdb.availability_zone}"
}

output "this_db_instance_endpoint" {
  description = "The connection endpoint"
  value       = "${aws_db_instance.awsdb.endpoint}"
}

output "this_db_instance_hosted_zone_id" {
  description = "The canonical hosted zone ID of the DB instance (to be used in a Route 53 Alias record)"
  value       = "${aws_db_instance.awsdb.hosted_zone_id}"
}

output "this_db_instance_id" {
  description = "The RDS instance ID"
  value       = "${aws_db_instance.awsdb.id}"
}

output "this_db_instance_resource_id" {
  description = "The RDS Resource ID of this instance"
  value       = "${aws_db_instance.awsdb.resource_id}"
}

output "this_db_instance_status" {
  description = "The RDS instance status"
  value       = "${aws_db_instance.awsdb.status}"
}

output "this_db_instance_name" {
  description = "The database name"
  value       = "${aws_db_instance.awsdb.name}"
}

output "this_db_instance_username" {
  description = "The master username for the database"
  value       = "${aws_db_instance.awsdb.username}"
}

output "this_subnet_group_name" {
  description = "The subnet group name"
  value       = "${aws_db_instance.awsdb.id}"
}

output "this_subnet_group_arn" {
  description = "The subnet group arn"
  value       = "${aws_db_instance.awsdb.arn}"
}
