output "eks_node_group_name_arn" {
  value = "${aws_eks_node_group.default-worker-nodes-group.arn}"
}

output "eks_node_group_id" {
  value = "${aws_eks_node_group.default-worker-nodes-group.id}"
}

output "eks_node_resources" {
  value = "${aws_eks_node_group.default-worker-nodes-group.resources}"
}
