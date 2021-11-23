##############################################
#Create the eks workers
##############################################

resource "aws_eks_node_group" "default-worker-nodes-group" {
  cluster_name    = "${var.eks_cluster_name}"
  node_group_name = "${var.eks_cluster_node_group_name}"
  node_role_arn   = "${var.eks_worker_node_role_arn}"
  subnet_ids      = ["${var.eks_worker_subnet_ids}"]
  ami_type        = "${var.ami_type}"
  instance_types  = "${var.instance_type}"
  disk_size       = "${var.volume_size}"
  release_version = "${var.release_version}"
  version         = "${var.eks_cluster_version}"

  scaling_config {
    desired_size = "${var.desired_capacity}"
    max_size     = "${var.max_size}"
    min_size     = "${var.min_size}"
  }

  remote_access {
    ec2_ssh_key               = "${var.ec2_ssh_key}"
    source_security_group_ids = ["${var.eks_worker_security_groups_ids}"]
  }

  tags {
    key   = "Name"
    value = "${var.eks_cluster_node_group_name}"
  }

  tags {
    key   = "kubernetes.io/cluster/${var.eks_cluster_name}"
    value = "owned"
  }
}
