output "rds_cluster_sg" {
  value       = "rds_cluster_security_group"
  description = "Database name"
}

output "subnet_groupname" {
     value = "${aws_db_subnet_group.dbsubnetgroup.name}"
}

output "sg_id" {
    value = "${aws_security_group.default.id}"
}

output "db_name" {
  value       = "${aws_rds_cluster.default.database_name}"
  description = "Database name"
}

output "db_user" {
  value       = "${aws_rds_cluster.default.master_username}"
  description = "Username for the master DB user"
}

output "cluster_name" {
  value       = "${aws_rds_cluster.default.cluster_identifier}"
  description = "Cluster Identifier"
}

output "arn" {
  value       = "${aws_rds_cluster.default.arn}"
  description = "Amazon Resource Name (ARN) of cluster"
}

output "endpoint" {
  value       = "${aws_rds_cluster.default.endpoint}"
  description = "The DNS address of the RDS instance"
}

output "reader_endpoint" {
  value       = "${aws_rds_cluster.default.reader_endpoint}"
  description = "A read-only endpoint for the Aurora cluster, automatically load-balanced across replicas"
}

output "dbi_resource_ids" {
  value       = ["${aws_rds_cluster_instance.default.*.dbi_resource_id}"]
  description = "List of the region-unique, immutable identifiers for the DB instances in the cluster."
}

output "cluster_resource_id" {
  value       = "${aws_rds_cluster.default.cluster_resource_id}"
  description = "The region-unique, immutable identifie of the cluster."
}

output "cluster_members" {
  value       = "${aws_rds_cluster.default.cluster_members}"
  description = "The cluster members"
}
