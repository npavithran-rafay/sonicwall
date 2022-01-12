############################################################
#Create the eks  IAM role to allow EKS service to manage
#other AWS services
##########################################################

resource "aws_iam_role" "eks-iamcluster-role" {
  name = "${var.eks_iam_role_name}"

  assume_role_policy = <<POLICY
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Principal": {
        "Service": "eks.amazonaws.com"
      },
      "Action": "sts:AssumeRole"
    }
  ]
}
POLICY
}

resource "aws_iam_role_policy_attachment" "eks-cluster-AmazonEKSClusterPolicy" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSClusterPolicy"
  role       = "${aws_iam_role.eks-iamcluster-role.name}"
}

resource "aws_iam_role_policy_attachment" "eks-cluster-AmazonEKSServicePolicy" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSServicePolicy"
  role       = "${aws_iam_role.eks-iamcluster-role.name}"
}

resource "aws_cloudwatch_log_group" "eks-log-group" {
  name              = "/aws/eks/${var.eks_cluster_name}/cluster"
  retention_in_days = "${var.retention_days}"
}

##########################################
#Create the eks cluster
#########################################
resource "aws_eks_cluster" "default-cluster" {
  name                      = "${var.eks_cluster_name}"
  version                   = "${var.eks_cluster_version}"
  role_arn                  = "${aws_iam_role.eks-iamcluster-role.arn}"
  enabled_cluster_log_types = "${var.eks_cluster_log_types}"

  vpc_config {
    subnet_ids              = flatten("${var.eks_subnet_ids}")
    security_group_ids      = "${var.eks_security_groups_ids}"
    endpoint_private_access = "${var.eks_endpoint_private_access}"
    endpoint_public_access  = "${var.eks_endpoint_public_access}"
    public_access_cidrs     = "${var.eks_endpoint_public_access_cidr}"
  }
 
  tags = {
    Name        = "${var.eks_cluster_name}"
    BU          = "${var.bu}"
    Application = "${var.application}"
    Environment = "${var.tag_environment}"
    Region      = "${var.tag_region}"
  }

  depends_on = [
    aws_iam_role_policy_attachment.eks-cluster-AmazonEKSClusterPolicy,
    aws_iam_role_policy_attachment.eks-cluster-AmazonEKSServicePolicy,
    aws_cloudwatch_log_group.eks-log-group,
  ]
}

##############################################
#eks workers roles
#############################################
resource "aws_iam_role" "eks-workernode-role" {
  name = "${var.eks_workernode_iam_role_name}"

  assume_role_policy = <<POLICY
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Principal": {
        "Service": "ec2.amazonaws.com"
      },
      "Action": "sts:AssumeRole"
    }
  ]
}
POLICY
}

#################################################
#eks worker role policies to attach
#################################################
resource "aws_iam_role_policy_attachment" "eks-workernode-AmazonEKSWorkerNodePolicy" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSWorkerNodePolicy"
  role       = "${aws_iam_role.eks-workernode-role.name}"
}

resource "aws_iam_role_policy_attachment" "eks-workernode-AmazonEKS_CNI_Policy" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKS_CNI_Policy"
  role       = "${aws_iam_role.eks-workernode-role.name}"
}

resource "aws_iam_role_policy_attachment" "eks-workernode-AmazonEC2ContainerRegistryReadOnly" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonEC2ContainerRegistryReadOnly"
  role       = "${aws_iam_role.eks-workernode-role.name}"
}

#####################################################
#An instance profile is a container for an IAM role
# that you can use to pass role information to an EC2 instance
#when the instance starts.
#####################################################
resource "aws_iam_instance_profile" "eks-workernode-profile" {
  name = "${var.eks_workernode_iam_role_name}"
  role = "${aws_iam_role.eks-workernode-role.name}"
}

##############################################
#Create the eks workers
##############################################

resource "aws_eks_node_group" "default-worker-nodes-group" {
  cluster_name    = "${var.eks_cluster_name}"
  node_group_name = "${var.eks_cluster_node_group_name}"
  node_role_arn   = "${aws_iam_role.eks-workernode-role.arn}"
  subnet_ids      = flatten("${var.eks_worker_subnet_ids}")
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
    source_security_group_ids = "${var.eks_worker_security_groups_ids}"
  }

  tags = {
     "Name" = "${var.eks_cluster_node_group_name}"
     "kubernetes.io/cluster/${var.eks_cluster_name}" = "owned"
  }

  depends_on = [
    aws_eks_cluster.default-cluster,
  ]
  lifecycle {
    create_before_destroy = true
  }
}
