output "redshift_cluster_arn" {
  description = "The Redshift cluster ID"
  value       =  module.redshift_cluster.this_redshift_cluster_arn
}

#output "redshift_cluster_arn" {
#  description = "The Redshift cluster ARN"
#  value       = module.redshift_cluster.this.arn
#}

output "redshift_cluster_id" {
  description = "The Redshift cluster ID"
  value       = module.redshift_cluster.this_redshift_cluster_id
}

output "redshift_cluster_identifier" {
  description = "The Redshift cluster identifier"
  value       = module.redshift_cluster.this_redshift_cluster_identifier
}

output "redshift_cluster_type" {
  description = "The Redshift cluster type"
  value       = module.redshift_cluster.this_redshift_cluster_type
}

output "redshift_cluster_node_type" {
  description = "The type of nodes in the cluster"
  value       = module.redshift_cluster.this_redshift_cluster_node_type
}

output "redshift_cluster_database_name" {
  description = "The name of the default database in the Cluster"
  value       = module.redshift_cluster.this_redshift_cluster_database_name
}

output "redshift_cluster_endpoint" {
  description = "The connection endpoint"
  value       = trimsuffix(module.redshift_cluster.this_redshift_cluster_endpoint, ":5439")
}

output "redshift_password" {
  value  = var.master_password
}

output "redshift_username" {
  value  = var.master_username
}

output "redshift_cluster_port" {
  description = "The port the cluster responds on"
  value       = module.redshift_cluster.this_redshift_cluster_port
}
