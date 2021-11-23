output "configuration_endpoint_address" {
  value = "${aws_elasticache_replication_group.redis-cluster.*.configuration_endpoint_address}"
}

output "primary_endpoint_address" {
  value = "${aws_elasticache_replication_group.default.*.primary_endpoint_address}"
}

#output "replication_group_id" {
#  value = "${aws_elasticache_replication_group.elasticache.*.id}"
#}

