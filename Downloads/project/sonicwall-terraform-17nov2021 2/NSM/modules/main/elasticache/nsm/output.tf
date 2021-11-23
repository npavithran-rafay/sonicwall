output "primary_endpoint_address" {
  value = "${module.elasticache_redis_cluster.primary_endpoint_address}"
}

#output "id" {
#  value = "${module.elasticache_redis_cluster.id}"
#}
