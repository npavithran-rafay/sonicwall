
output "database_name" {
  description = "The name of the default database in the Cluster."
  value       = "${module.redshift_cluster.database_name}"
}

output "endpoint" {
  description = "The Redshift endpoint."
  value       = "${module.redshift_cluster.endpoint}"
}

output "port" {
  description = "The Port the cluster responds on."
  value       = "${module.redshift_cluster.port}"
}
