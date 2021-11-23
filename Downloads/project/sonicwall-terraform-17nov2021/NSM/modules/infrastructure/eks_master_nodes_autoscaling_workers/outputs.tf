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

output "eks_worker_role_arn" {
  value = "${aws_iam_role.eks-workernode-role.arn}"
}

output "ebs_ids" {
  description = "IDs of EBSs"
  value       = "${aws_ebs_volume.default.*.id}"
}

output "launch_config_name" {
  value = "${aws_launch_configuration.default-launch-config.name}"
}

output "launch_config_id" {
  value = "${aws_launch_configuration.default-launch-config.id}"
}

output "autoscaling_group_name" {
  value = "${aws_autoscaling_group.asg.name}"
}

output "autoscaling_group_id" {
  value = "${aws_autoscaling_group.asg.id}"
}

output "autoscaling_group_arn" {
  value = "${aws_autoscaling_group.asg.arn}"
}

output "autoscaling_group_az" {
  value = "${aws_autoscaling_group.asg.availability_zones}"
}

output "autoscaling_group_desired_capacity" {
  value = "${aws_autoscaling_group.asg.desired_capacity}"
}

output "autoscaling_group_min_size" {
  value = "${aws_autoscaling_group.asg.min_size}"
}

output "autoscaling_group_max_size" {
  value = "${aws_autoscaling_group.asg.max_size}"
}

output "autoscaling_group_launch_config_use" {
  value = "${aws_autoscaling_group.asg.launch_configuration}"
}

output "autoscaling_group_vpc_zone_identifier" {
  value = "${aws_autoscaling_group.asg.vpc_zone_identifier}"
}
