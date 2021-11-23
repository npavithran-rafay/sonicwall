####Launch Configuration####
resource "aws_launch_configuration" "launch_config" {
  name                        = "${var.name_lc}"
  image_id                    = "${var.image_id}"
  instance_type               = "${var.instance_type}"
  iam_instance_profile        = "${var.iam_instance_profile}"
  key_name                    = "${var.key_name}"
  security_groups             = "${var.security_groups}"
  associate_public_ip_address = "${var.associate_public_ip_address}"
  user_data                   = "${var.user_data}"
  enable_monitoring           = "${var.enable_monitoring}"
  spot_price                  = "${var.spot_price}"
  placement_tenancy           = "${var.placement_tenancy}"
  ebs_optimized               = "${var.ebs_optimized}"
###extra ebs volume mount####
  ebs_block_device {
    device_name           = "${var.ebs_device_name}"
    volume_type           = "${var.ebs_volume_type}"
    volume_size           = "${var.ebs_volume_size}"
    delete_on_termination = "${var.ebs_delete_on_termination}"
  }
###root volume disk###
  root_block_device {
     volume_size = "${var.volume_size}"
     volume_type = "${var.volume_type}"
   }
  lifecycle {
    create_before_destroy = true
  }
}
###AutoScalingGroups####
resource "aws_autoscaling_group" "asg_test" {
  name                      = "${var.name_asg}"
  launch_configuration      = "${aws_launch_configuration.launch_config.name}"
  max_size                  = "${var.max_size}"
  min_size                  = "${var.min_size}"
#  desired_capacity          = "${var.desired_capacity}"
  load_balancers            = "${var.load_balancers}"
  health_check_grace_period = "${var.health_check_grace_period}"
  health_check_type         = "${var.health_check_type}"
  min_elb_capacity          = "${var.min_elb_capacity}"
  wait_for_elb_capacity     = "${var.wait_for_elb_capacity}"
  target_group_arns         = "${var.target_group_arns}"
  default_cooldown          = "${var.default_cooldown}"
  force_delete              = "${var.force_delete}"
  termination_policies      = "${var.termination_policies}"
  suspended_processes       = "${var.suspended_processes}"
  placement_group           = "${var.placement_group}"
  enabled_metrics           = "${var.enabled_metrics}"
  metrics_granularity       = "${var.metrics_granularity}"
  wait_for_capacity_timeout = "${var.wait_for_capacity_timeout}"
  protect_from_scale_in     = "${var.protect_from_scale_in}"
  service_linked_role_arn   = "${var.service_linked_role_arn}"
  max_instance_lifetime     = "${var.max_instance_lifetime}"
  vpc_zone_identifier       = "${var.vpc_zone_identifier}"
  tags                      = var.tags
  lifecycle {
    create_before_destroy = true
  }
}

###Scaling policies not required in case of manual scaling (desired_capacity)####
###Below policies applicable only incase of dynamic scaling policies###
###scale up alarm###
resource "aws_autoscaling_policy" "example-cpu-policy" {
name = "${var.name_scaleup}"
autoscaling_group_name = "${aws_autoscaling_group.asg_test.name}"
adjustment_type = "${var.adjustment_type}"
scaling_adjustment = "${var.scaling_adjustment}"
cooldown = "${var.cooldown}"
policy_type = "${var.policy_type}"
}
resource "aws_cloudwatch_metric_alarm" "example-cpu-alarm" {
alarm_name = "${var.alarm_name}"
alarm_description = "${var.alarm_description}"
comparison_operator = "${var.comparison_operator}"
evaluation_periods = "${var.evaluation_periods}"
metric_name = "${var.metric_name}"
namespace = "${var.namespace}"
period = "${var.period}"
statistic = "${var.statistic}"
threshold = "${var.threshold}"
dimensions = {
"AutoScalingGroupName" = "${aws_autoscaling_group.asg_test.name}"
}
actions_enabled = true
alarm_actions = ["${aws_autoscaling_policy.example-cpu-policy.arn}"]
}

###Run below tf incase of notification required###
###Auto Scaling Notification####
resource "aws_autoscaling_notification" "example_notifications" {
  group_names = [
    "${aws_autoscaling_group.asg_test.name}",
    ]

  notifications = [
    "autoscaling:EC2_INSTANCE_LAUNCH",
    "autoscaling:EC2_INSTANCE_TERMINATE",
    "autoscaling:EC2_INSTANCE_LAUNCH_ERROR",
    "autoscaling:EC2_INSTANCE_TERMINATE_ERROR",
  ]

  topic_arn = "${aws_sns_topic.example.arn}"
}

###SNS NotificationTopic####
resource "aws_sns_topic" "example" {
  name = "example-topic"
}
