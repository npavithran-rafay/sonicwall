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
  enabled_cluster_log_types = ["${var.eks_cluster_log_types}"]

  vpc_config {
    subnet_ids         = ["${var.eks_subnet_ids}"]
    security_group_ids = ["${var.eks_security_groups_ids}"]
  }

  depends_on = [
    "aws_iam_role_policy_attachment.eks-cluster-AmazonEKSClusterPolicy",
    "aws_iam_role_policy_attachment.eks-cluster-AmazonEKSServicePolicy",
    "aws_cloudwatch_log_group.eks-log-group",
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

# EKS currently documents this required userdata for EKS worker nodes to
# properly configure Kubernetes applications on the EC2 instance.
# We utilize a Terraform local here to simplify Base64 encoding this
# information into the AutoScaling Launch Configuration.
# More information: https://docs.aws.amazon.com/eks/latest/userguide/launch-workers.html
locals {
  eks-workernode-userdata = <<USERDATA
#!/bin/bash
set -o xtrace
/etc/eks/bootstrap.sh --apiserver-endpoint '${aws_eks_cluster.default-cluster.endpoint}' --b64-cluster-ca '${aws_eks_cluster.default-cluster.certificate_authority.0.data}' '${var.eks_cluster_name}'
USERDATA
}

###################################################
#launch config for auto scale group
##################################################

resource "aws_launch_configuration" "default-launch-config" {
  associate_public_ip_address = "${var.associate_public_ip_address}"
  iam_instance_profile        = "${aws_iam_instance_profile.eks-workernode-profile.name}"
  image_id                    = "${data.aws_ami.eks-worker.id}"
  instance_type               = "${var.instance_type}"
  name_prefix                 = "${var.name_prefix}"
  security_groups             = ["${var.eks_worker_security_groups_ids}"]
  user_data_base64            = "${base64encode(local.eks-workernode-userdata)}"

  root_block_device = {
    volume_size           = "${var.volume_size}"
    volume_type           = "${var.volume_type}"
    iops                  = "${var.volume_iops}"
    delete_on_termination = "${var.delete_volume_on_termination}"
    encrypted             = "${var.encrypted}"
  }

  lifecycle {
    create_before_destroy = true
  }
}

#####################################################
#extra EBS for Lauch configuration
####################################################
resource "aws_ebs_volume" "default" {
  count             = "${var.ebs_volume_number}"
  availability_zone = "${var.ebs_az}"
  size              = "${var.ebs_volume_size}"
  type              = "${var.ebs_volume_type}"
  iops              = "${var.ebs_iops}"

  tags {
    Name = "${var.name_prefix}${count.index+1}"
  }
}

resource "aws_volume_attachment" "default" {
  count       = "${var.ebs_volume_number}"
  device_name = "${element(var.ebs_device_name,count.index)}"
  volume_id   = "${element(aws_ebs_volume.default.*.id, count.index)}"
  instance_id = "${data.aws_ami.eks-worker.id}"

  lifecycle {
    ignore_changes = [
      "instance_id",
    ]
  }
}

################################################
#Create the auto scaling group
################################################
resource "aws_autoscaling_group" "asg" {
  name                 = "${var.asg_name}"
  desired_capacity     = "${var.desired_capacity}"
  launch_configuration = "${aws_launch_configuration.default-launch-config.id}"
  max_size             = "${var.max_size}"
  min_size             = "${var.min_size}"
  vpc_zone_identifier  = ["${var.eks_worker_subnet_ids}"]

  tag {
    key                 = "Name"
    value               = "${var.asg_name}"
    propagate_at_launch = true
  }

  tag {
    key                 = "kubernetes.io/cluster/${var.eks_cluster_name}"
    value               = "owned"
    propagate_at_launch = true
  }
}
