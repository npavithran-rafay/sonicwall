output "id" {
  value = "${aws_eks_cluster.default-cluster.id}"
}

output "arn" {
  value = "${aws_eks_cluster.default-cluster.arn}"
}

output "endpoint" {
  value = "${aws_eks_cluster.default-cluster.endpoint}"
}

output "platform_version" {
  value = "${aws_eks_cluster.default-cluster.platform_version}"
}

output "version" {
  value = "${aws_eks_cluster.default-cluster.version}"
}

output "kubeconfig-certificate-authority-data" {
  value = "${aws_eks_cluster.default-cluster.certificate_authority.0.data}"
}

output "cluster-security-group-id" {
  value = "${aws_eks_cluster.default-cluster.vpc_config.0.cluster_security_group_id}"
}

output "eks_worker_role_arn" {
  value = "${aws_iam_role.eks-workernode-role.arn}"
}

output "eks_node_group_name_arn" {
  value = "${aws_eks_node_group.default-worker-nodes-group.arn}"
}

output "eks_node_group_id" {
  value = "${aws_eks_node_group.default-worker-nodes-group.id}"
}

output "eks_node_resources" {
  value = "${aws_eks_node_group.default-worker-nodes-group.resources}"
}

output "node_groups" {
  value = "${aws_eks_node_group.default-worker-nodes-group.id}"
}
