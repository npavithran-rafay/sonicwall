output "neptune_cluster_instances" {
  value = "${aws_neptune_cluster.rafay-cluster.cluster_members}"
}