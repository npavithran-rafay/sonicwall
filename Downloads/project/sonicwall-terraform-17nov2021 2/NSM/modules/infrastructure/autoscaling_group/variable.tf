####Launch configuration#####
variable "name_lc" {
  description = "Launch Configuration Name"
  default = ""
}
variable "image_id" {
  description = "The EC2 image ID to launch"
  type        = string
  default     = ""
}

variable "instance_type" {
  description = "The size of instance to launch"
  type        = string
  default     = "t2.micro"
}
variable "iam_instance_profile" {
  description = "The IAM instance profile to associate with launched instances"
  type        = string
  default     = ""
}
variable "key_name" {
  description = "The key name that should be used for the instance"
  type        = string
  default     = ""
}

variable "security_groups" {
  description = "A list of security group IDs to assign to the launch configuration"
  type        = list(string)
  default     = []
}

variable "associate_public_ip_address" {
  description = "Associate a public ip address with an instance in a VPC"
  type        = bool
  default     = false
}

variable "user_data" {
  description = "The user data to provide when launching the instance"
  type        = string
  default     = " "
}

variable "enable_monitoring" {
  description = "Enables/disables detailed monitoring. This is enabled by default."
  type        = bool
  default     = true
}

variable "ebs_optimized" {
  description = "If true, the launched EC2 instance will be EBS-optimized"
  type        = bool
  default     = false
}
variable "spot_price" {
  description = "The price to use for reserving spot instances"
  type        = string
  default     = ""
}

variable "placement_tenancy" {
  description = "The tenancy of the instance. Valid values are 'default' or 'dedicated'"
  type        = string
  default     = "default"
}

variable "ebs_device_name" {
  description = "EBS volume device name for launch_configuration (/dev/xvdb to /dev/xvdz)"
  default = "/dev/xvdz"
}

variable "ebs_volume_type" {
  description = "EBS volume type for launch_configuration"
  default ="gp2"
}

variable "ebs_volume_size" {
  description = "EBS volume size for launch_configuration in Gb"
  default = "10"
}

variable "ebs_delete_on_termination" {
  type = bool
  default = true
}

variable "volume_size" {
  description = "root device volume_size"
  default = "10"
}

variable "volume_type" {
  description = "root device volume_type"
  default = "gp2"
}
###AutoScalingGroups####
variable "name_asg" {
  description = "Auto Scaling Group Name"
  default = ""
}
variable "max_size" {
  description = "The maximum size of the auto scale group"
  type        = string
  default     = "2"
}

variable "min_size" {
  description = "The minimum size of the auto scale group"
  type        = string
  default     = "1"
}

# variable "desired_capacity" {
#   description = "The number of Amazon EC2 instances that should be running in the group"
#   type        = string
#   default     = "1"
# }

variable "vpc_zone_identifier" {
  description = "A list of subnet IDs to launch resources in"
  type        = list(string)
  default     = [ "subnet_id", "subnet_id"]
}

variable "default_cooldown" {
  description = "The amount of time, in seconds, after a scaling activity completes before another scaling activity can start"
  type        = number
  default     = 300
}

variable "health_check_grace_period" {
  description = "Time (in seconds) after instance comes into service before checking health"
  type        = number
  default     = 300
}

variable "health_check_type" {
  description = "Controls how health checking is done. Values are - EC2 and ELB"
  type        = string
  default     = "EC2"
}

variable "force_delete" {
  description = "Allows deleting the autoscaling group without waiting for all instances in the pool to terminate. You can force an autoscaling group to delete even if it's in the process of scaling a resource. Normally, Terraform drains all the instances before deleting the group. This bypasses that behavior and potentially leaves resources dangling"
  type        = bool
  default     = false
}

variable "load_balancers" {
  description = "A list of elastic load balancer names to add to the autoscaling group names"
  type        = list(string)
  default     = []
}

variable "target_group_arns" {
  description = "A list of aws_alb_target_group ARNs, for use with Application Load Balancing"
  type        = list(string)
  default     = []
}

variable "termination_policies" {
  description = "A list of policies to decide how the instances in the auto scale group should be terminated. The allowed values are OldestInstance, NewestInstance, OldestLaunchConfiguration, ClosestToNextInstanceHour, Default"
  type        = list(string)
  default     = ["Default"]
}

variable "suspended_processes" {
  description = "A list of processes to suspend for the AutoScaling Group. The allowed values are Launch, Terminate, HealthCheck, ReplaceUnhealthy, AZRebalance, AlarmNotification, ScheduledActions, AddToLoadBalancer. Note that if you suspend either the Launch or Terminate process types, it can prevent your autoscaling group from functioning properly."
  type        = list(string)
  default     = []
}

variable "tags" {
  description = "A list of tag blocks. Each element should have keys named key, value, and propagate_at_launch."
  type        = list(map(string))
  default     = [ {"key" = "BU", "value" = "test", "propagate_at_launch" = false } ]
}

variable "tags_as_map" {
  description = "A map of tags and values in the same format as other resources accept. This will be converted into the non-standard format that the aws_autoscaling_group requires."
  type        = map(string)
  default     = {}
}

variable "placement_group" {
  description = "The name of the placement group into which you'll launch your instances, if any"
  type        = string
  default     = ""
}

variable "metrics_granularity" {
  description = "The granularity to associate with the metrics to collect. The only valid value is 1Minute"
  type        = string
  default     = "1Minute"
}

variable "enabled_metrics" {
  description = "A list of metrics to collect. The allowed values are GroupMinSize, GroupMaxSize, GroupDesiredCapacity, GroupInServiceInstances, GroupPendingInstances, GroupStandbyInstances, GroupTerminatingInstances, GroupTotalInstances"
  type        = list(string)
  default = ""
}

variable "wait_for_capacity_timeout" {
  description = "A maximum duration that Terraform should wait for ASG instances to be healthy before timing out. (See also Waiting for Capacity below.) Setting this to '0' causes Terraform to skip all Capacity Waiting behavior."
  type        = string
  default     = "10m"
}

variable "min_elb_capacity" {
  description = "Setting this causes Terraform to wait for this number of instances to show up healthy in the ELB only on creation. Updates will not wait on ELB instance number changes"
  type        = number
  default     = 0
}

variable "wait_for_elb_capacity" {
  description = "Setting this will cause Terraform to wait for exactly this number of healthy instances in all attached load balancers on both create and update operations. Takes precedence over min_elb_capacity behavior."
  type        = number
  default     = null
}

variable "protect_from_scale_in" {
  description = "Allows setting instance protection. The autoscaling group will not select instances with this setting for termination during scale in events."
  type        = bool
  default     = false
}

variable "service_linked_role_arn" {
  description = "The ARN of the service-linked role that the ASG will use to call other AWS services."
  type        = string
  default     = ""
}

variable "max_instance_lifetime" {
  description = "The maximum amount of time, in seconds, that an instance can be in service, values must be either equal to 0 or between 604800 and 31536000 seconds."
  type        = number
  default     = 0
}

####scaleup alarm####
variable "name_scaleup" {
  description = "Name for scaling up policies for autoscaling"
  default = ""
}

variable "adjustment_type" {
  description = "Specifies whether the adjustment is an absolute number or a percentage of the current capacity. Valid values are ChangeInCapacity, ExactCapacity, and PercentChangeInCapacity"
  default = "ChangeInCapacity"
}

variable "scaling_adjustment" {
  description = "The number of instances by which to scale. adjustment_type determines the interpretation of this number (e.g., as an absolute number or as a percentage of the existing Auto Scaling group size). A positive increment adds to the current capacity and a negative value removes from the current capacity."
  default = "1"
}

variable "cooldown" {
  description = "The amount of time, in seconds, after a scaling activity completes and before the next scaling activity can start."
  default = "300"
}

variable "policy_type" {
  description = "The policy type, either SimpleScaling, StepScaling or TargetTrackingScaling. If this value isn't provided, AWS will default to SimpleScaling."
  default = "SimpleScaling"
}

###Cloud Watch Alarm Metrics######
variable "alarm_name" {
  description = "The descriptive name for the alarm. This name must be unique within the user's AWS account"
  default = ""
}

variable "alarm_description" {
  description = "The description for the alarm."
  default = ""
}

variable "comparison_operator" {
  description = "The arithmetic operation to use when comparing the specified Statistic and Threshold. The specified Statistic value is used as the first operand. Either of the following is supported: GreaterThanOrEqualToThreshold, GreaterThanThreshold, LessThanThreshold, LessThanOrEqualToThreshold. Additionally, the values LessThanLowerOrGreaterThanUpperThreshold, LessThanLowerThreshold, and GreaterThanUpperThreshold are used only for alarms based on anomaly detection models."
  default = "GreaterThanOrEqualToThreshold"
}

variable "evaluation_periods" {
  description = "The number of periods over which data is compared to the specified threshold."
  default = "2"
}

variable "metric_name" {
  description = "The name for the alarm's associated metric."
  default = "CPUUtilization"
}

variable "namespace" {
  description = "The namespace for the alarm's associated metric. See docs for the list of namespaces."
  default = "AWS/EC2"
}

variable "period" {
  description = "The period in seconds over which the specified statistic is applied"
  default = "120"
}

variable "statistic" {
  description = "The statistic to apply to the alarm's associated metric. Either of the following is supported: SampleCount, Average, Sum, Minimum, Maximum"
  default = "Average"
}

variable "threshold" {
  description = "he value against which the specified statistic is compared. This parameter is required for alarms based on static thresholds, but should not be used for alarms based on anomaly detection models."
  default = "80"
}
