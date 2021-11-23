output "launch_configuration_id" {
  description = "launch_configuration_id"
  value = aws_launch_configuration.launch_config.id
}
output "launch_configuration_arn" {
  description = "launch_configuration_arn"
  value = aws_launch_configuration.launch_config.arn
}
output "asg_min_size" {
  description = "asg_min_size"
  value = aws_autoscaling_group.asg_test.min_size
}
output "asg_max_size" {
  description = "asg_max_size"
  value = aws_autoscaling_group.asg_test.max_size
}
output "asg_arn" {
  description = "asg_arn"
  value = aws_autoscaling_group.asg_test.arn
}
