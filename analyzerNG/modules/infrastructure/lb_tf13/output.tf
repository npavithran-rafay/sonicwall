##########################################
#load balancer output
##########################################

output "lb_dns_name" {
  description = "The DNS name of the LB"
  value       = aws_lb.default.dns_name
}

output "lb_id" {
  description = "The ARN of the load balancer (matches arn)"
  value       = aws_lb.default.id
}

output "lb_arn" {
  description = "The ARN of the load balancer (matches id)"
  value       = aws_lb.default.arn
}

output "lb_arn_suffix" {
  description = "The ARN suffix for use with CloudWatch Metrics"
  value       = aws_lb.default.arn_suffix
}

output "lb_zone_id" {
  description = "The canonical hosted zone ID of the load balancer (to be used in a Route 53 Alias record). "
  value       = aws_lb.default.zone_id
}

##########################################
#Target Group Variables
##########################################
output "tg_name" {
  description = "The name of the target group"
  value       = aws_lb_target_group.default.name
}

output "tg_id" {
  description = "The ARN of the Target Group (matches arn)"
  value       = aws_lb_target_group.default.id
}

output "tg_arn" {
  description = "The ARN of the Target Group (matches id)"
  value       = aws_lb_target_group.default.arn
}

output "tg_arn_suffix" {
  description = "The ARN suffix for use with CloudWatch Metrics"
  value       = aws_lb_target_group.default.arn_suffix
}
