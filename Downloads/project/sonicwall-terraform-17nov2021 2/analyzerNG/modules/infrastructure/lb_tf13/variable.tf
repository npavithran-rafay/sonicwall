##########################################
#load balancer variables
##########################################

variable lb_name {
  description = "name of the load balancer"
  #default     = "LB created by Terraform"
}

variable internal {
  description = "is internal"
  #default     = false
}

variable lb_type {
  description = "ALB or NLB"
  #default     = "application"
}

variable sg {
  description = "security groups list"
  #default     = []
}

variable subnets {
  description = "subnet list where to deploy the LB"
  #default     = []
}

variable idle_timeout {
  description = "The time in seconds that the connection is allowed to be idle. Only valid for Load Balancers of type application."
  #default     = "60"
}

variable delete_protection {
  description = "enable delete protection, if true deleteIf true, deletion of the load balancer will be disabled via the AWS API.This will prevent Terraform from deleting the load balancer."
  #default     = false
}

variable az_lb {
  description = "If true, cross-zone load balancing of the load balancer will be enabled.This is a network load balancer feature"
  #default     = true
}

variable http2 {
  description = "Indicates whether HTTP/2 is enabled in application load balancers"
  #default     = true
}

variable ip_type {
  description = "dualstack or ipv4"
  #default     = "ipv4"
}

#aws_lb provides the following Timeouts configuration options:
variable lb_create_timeout {
  description = "used for create LB, default 10 min"
  #default     = "10m"
}

variable lb_delete_timeout {
  description = "used for destroying LB, default 10 min"
  #default     = "10m"
}

variable lb_update_timeout {
  description = "used for LB modification"
  #default     = "10m"
}

variable enviroment_tag {
  description = "tag for the LB"
  #default     = ""
}

variable bu_tag {
  description = "tag for the lb"
  #default     = ""
}

variable applicationName_tag {
  description = "tag for the lb"
  #default     = ""
}

variable region_tag {
  description = "tag for the lb"
  #default     = ""
}

variable machineType_tag {
  description = "tag for the lb"
  #default     = ""
}

##########################################
#Target Group Variables
##########################################

variable lb_target_group_name {
  description = "name of the target group"
  #default     = "TG-created-by-Terraform"
}

variable port {
  description = "the port on which targets receive traffic, Require when target_type is instance or IP, does not apply to target_type lambda"
  #default     = ""
}

variable portocol {
  description = "The protocol to use for routing traffic to the targets. Should be one of TCP, TLS, HTTP or HTTPS. Required when target_type is instance or ip"
  #default     = ""
}

variable vpc_id {
  description = "The identifier of the VPC in which to create the target group. Required when target_type is instance or ip. Does not apply when target_type is lambda."
  #default     = ""
}

variable deregistration_delay {
  description = "The amount time for Elastic Load Balancing to wait before changing the state of a deregistering target from draining to unused. The range is 0-3600 seconds. The default value is 300 second"
  #default     = "300"
}

variable slow_start {
  description = "The amount time for targets to warm up before the load balancer sends them a full share of requests. The range is 30-900 seconds or 0 to disable. The default value is 0 seconds."
  #default     = "0"
}

variable enable_lambda_multi_value_headers {
  description = "Boolean whether the request and response headers exchanged between the load balancer and the Lambda function include arrays of values or strings. Only applies when target_type is lambda"
  #default     = false
}

variable proxy_protocol_v2 {
  description = "Boolean to enable / disable support for proxy protocol v2 on Network Load Balancers"
  #default     = ""
}

variable target_type {
  description = "The type of target that you must specify when registering targets with this target group"

  #The possible values are instance (targets are specified by instance ID) or ip (targets are specified by IP address) or lambda (targets are specified by lambda arn).
  #The default is instance. Note that you can't specify targets for a target group using both instance IDs and IP addresses.
  #If the target type is ip, specify IP addresses from the subnets of the virtual private cloud (VPC) for the target group,
  #the RFC 1918 range (10.0.0.0/8, 172.16.0.0/12, and 192.168.0.0/16), and the RFC 6598 range (100.64.0.0/10). You can't specify publicly routable IP addresses

  #default = "instance"
}

###################################
#Target Group Stickiness variables
##################################
variable stickiness_type {
  description = "The type of sticky sessions. The only current possible value is lb_cookie"
  #default     = "lb_cookie"
}

variable cookie_duration {
  description = "The time period, in seconds, during which requests from a client should be routed to the same target."

  #After this time period expires, the load balancer-generated cookie is considered stale.
  #The range is 1 second to 1 week (604800 seconds). The default value is 1 day (86400 seconds). "
  #default = "86400"
}

variable enable_stickiness {
  description = "Boolean to enable / disable stickiness"
  #default     = true
}

######################################
#Target Group health check variables
######################################

variable interval {
  description = "The approximate amount of time, in seconds, between health checks of an individual target. Minimum value 5 seconds, Maximum value 300 seconds"
  #default     = "30"
}

variable url_path {
  description = " (Required for HTTP/HTTPS ALB) The destination for the health check request. Applies to Application Load Balancers only (HTTP/HTTPS), not Network Load Balancers (TCP). "
  #default     = ""
}

variable hc_port {
  description = "The port to use to connect with the target. Valid values are either ports 1-65536, or traffic-port"
  #default     = "traffic-port"
}

variable tg_protocol {
  description = "The protocol to use to connect with the target. defaults to HTTP. Not applicable when target_type is lambda"
  #default     = ""
}

variable timeout {
  description = "The amount of time, in seconds, during which no response means a failed health check. For Application Load Balancers, the range is 2 to 60 seconds and the default is 5 seconds."

  #For Network Load Balancers, you cannot set a custom value, and the default is 10 seconds for TCP and HTTPS health checks and 6 seconds for HTTP health checks
  #default = "0"
}

variable healthy_threshold {
  description = "The number of consecutive health checks successes required before considering an unhealthy target healthy"
  #default     = "3"
}

variable unhealthy_threshold {
  description = "The number of consecutive health check failures required before considering the target unhealthy . For Network Load Balancers, this value must be the same as the healthy_threshold"
  #default     = "3"
}

variable tg_return_code {
  description = "(Required for HTTP/HTTPS ALB) The HTTP codes to use when checking for a successful response from a target."

  #You can specify multiple values (for example, 200,202) or a range of values (for example, 200-299).
  #Applies to Application Load Balancers only (HTTP/HTTPS), not Network Load Balancers (TCP)"
  #default = ""
}

variable tg_enviroment_tag {
  description = "tag for the tg"
  #default     = ""
}

variable tg_bu_tag {
  description = "tag for the tg"
  #default     = ""
}

variable tg_applicationName_tag {
  description = "tag for the tg"
  #default     = ""
}

variable tg_region_tag {
  description = "tag for the tg"
  #default     = ""
}

variable tg_machineType_tag {
  description = "tag for the tg"
  #default     = ""
}

###################################
#Load Balancer listner variables
###################################
variable lb_listener_port {
  description = "The port on which the load balancer is listening."
  #default     = ""
}

variable lb_listener_protocol {
  description = "The protocol for connections from clients to the load balancer. Valid values are TCP, TLS, HTTP and HTTPS. defaults to HTTP"
  #default     = "TCP"
}

variable ssl_policy {
  description = "The name of the SSL Policy for the listener. Required if protocol is HTTPS or TLS."
  #default     = ""
}

variable cert_arn {
  description = "The ARN of the default SSL server certificate. Exactly one certificate is required if the protocol is HTTPS"
  #default     = ""
}

####################################
#Target list
######################################
variable number_of_tgids {
  description = "Number of instances or IPs to attach to the lb"
  #default     = ""
}

variable targetids {
  description = "list of ids or ip addresses or lambda ARN to pass "
  #default     = []
}
