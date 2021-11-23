output "vpc_block" {
  value = "${module.vpc.vpc_cidr_block}"
}

output "vpcid" {
  value = "${module.vpc.vpc_id}"
}

output "vpc_private_subnets_ids" {
  value = "${module.vpc.private_subnets_ids}"
}

output "vpc_private_subnets_cidrs" {
  value = "${module.vpc.private_subnets_cidrs}"
}

output "vpc_pubic_subnets_ids" {
  value = "${module.vpc.public_subnets_ids}"
}

output "vpc_public_subnets_cidrs" {
  value = "${module.vpc.public_subnets_cidrs}"
}

output "vpc_eksmaster_security_group_id" {
  value = "${module.vpc_sg_eksmaster.sgid}"
}

output "vpc_eksworker_security_group_id" {
  value = "${module.vpc_sg_eksworker.sgid}"
}

output "eks_cluster_name" {
  value = "${var.eks_cluster_name}"
}

output "eks_cluster_id" {
  value = "${module.eks_node_group.id}"
}

output "eks_cluster_arn" {
  value = "${module.eks_node_group.arn}"
}

output "eks_cluster_endpoint" {
  value = "${module.eks_node_group.endpoint}"
}

output "eks_cluster_platform_version" {
  value = "${module.eks_node_group.platform_version}"
}

output "eks_cluster_version" {
  value = "${module.eks_node_group.version}"
}

output "eks_cluster_cert_authority" {
  value = "${module.eks_node_group.kubeconfig-certificate-authority-data}"
}

output "eks_worker_node_group_arn" {
  value = "${module.eks_node_group.eks_node_group_name_arn}"
}

output "eks_worker_node_group_id" {
  value = "${module.eks_node_group.eks_node_group_id}"
}

output "eks_worker_node_group_resources" {
  value = "${module.eks_node_group.eks_node_resources}"
}

locals {
  config_map_aws_auth = <<CONFIGMAPAWSAUTH
apiVersion: v1
kind: ConfigMap
metadata:
  name: aws-auth
  namespace: kube-system
data:
  mapRoles: |
    - rolearn: ${module.eks_node_group.eks_worker_role_arn}
      username: system:node:{{EC2PrivateDNSName}}
      groups:
        - system:bootstrappers
        - system:nodes
CONFIGMAPAWSAUTH

  kubeconfig = <<KUBECONFIG
apiVersion: v1
clusters:
- cluster:
    certificate-authority-data: ${module.eks_node_group.kubeconfig-certificate-authority-data}
    server: ${module.eks_node_group.endpoint}
  name: ${var.eks_cluster_name}
contexts:
- context:
    cluster: ${var.eks_cluster_name}
    user: aws
  name: aws@${var.eks_cluster_name}
current-context: aws@${var.eks_cluster_name}
kind: Config
preferences: {}
users:
- name: aws
  user:
    exec:
      apiVersion: client.authentication.k8s.io/v1alpha1
      command: aws-iam-authenticator
      args:
        - "token"
        - "-i"
        - "${var.eks_cluster_name}"
KUBECONFIG
}
