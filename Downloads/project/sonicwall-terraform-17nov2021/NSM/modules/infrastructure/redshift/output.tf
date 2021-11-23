output "id" {
  description = "The Redshift Cluster ID."
  value       = "${aws_redshift_cluster.redshift.*.id}"
}

output "database_name" {
  description = "The name of the default database in the Cluster."
  value       = "${aws_redshift_cluster.redshift.*.database_name}"
}

output "endpoint" {
  description = "The Redshift endpoint."
  value       = "${aws_redshift_cluster.redshift.*.endpoint}"
}

output "port" {
  description = "The Port the cluster responds on."
  value       = "${aws_redshift_cluster.redshift.*.port}"
}

#output "redshift_cluster_ip" {
#  value       = "${data.aws_redshift_cluster.redshift_ip.elastic_ip}"
#}

