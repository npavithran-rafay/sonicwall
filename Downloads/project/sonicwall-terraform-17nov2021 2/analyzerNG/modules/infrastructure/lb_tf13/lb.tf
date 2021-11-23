#######################################################
#Create the Load balancer
#######################################################
resource "aws_lb" "default" {
  name                             = var.lb_name
  internal                         = var.internal
  load_balancer_type               = var.lb_type
  security_groups                  = var.sg
  subnets                          = var.subnets
  idle_timeout                     = var.idle_timeout
  enable_deletion_protection       = var.delete_protection
  enable_cross_zone_load_balancing = var.az_lb
  enable_http2                     = var.http2
  ip_address_type                  = var.ip_type

  tags = {
    Name            = var.lb_name
    Environment     = var.enviroment_tag
    BU              = var.bu_tag
    ApplicationName = var.applicationName_tag
    Region          = var.region_tag
    MachineType     = var.machineType_tag
  }

  timeouts {
    create = var.lb_create_timeout
    delete = var.lb_delete_timeout
    update = var.lb_update_timeout
  }
}

####################################################
#Create the target group
####################################################
resource "aws_lb_target_group" "default" {
  name                               = var.lb_target_group_name
  port                               = var.port
  protocol                           = var.portocol
  vpc_id                             = var.vpc_id
#  deregistration_delay               = var.deregistration_delay
  slow_start                         = var.slow_start
  lambda_multi_value_headers_enabled = var.enable_lambda_multi_value_headers
#  proxy_protocol_v2                  = var.proxy_protocol_v2
  target_type                        = var.target_type

  stickiness {
    type            = var.stickiness_type
    cookie_duration = var.cookie_duration
    enabled         = var.enable_stickiness
  }

  health_check {
    interval = var.interval
    path     = var.url_path
    port     = var.hc_port
    protocol = var.tg_protocol

    #  timeout             = var.timeout
    healthy_threshold   = var.healthy_threshold
    unhealthy_threshold = var.unhealthy_threshold
    matcher             = var.tg_return_code
  }

  tags = {
    Name            = var.lb_target_group_name
    Environment     = var.tg_enviroment_tag
    BU              = var.tg_bu_tag
    ApplicationName = var.tg_applicationName_tag
    Region          = var.tg_region_tag
    MachineType     = var.tg_machineType_tag
  }
}

#################################################
#Create the Load Balancer Listener
#the default action will be forward
#if you want to specify different forward action for your LB
#use the LB listener module
#################################################

resource "aws_lb_listener" "default" {
  load_balancer_arn = aws_lb.default.arn
  port              = var.lb_listener_port
  protocol          = var.lb_listener_protocol
  ssl_policy        = var.ssl_policy
  certificate_arn   = var.cert_arn

  default_action {
    target_group_arn = aws_lb_target_group.default.arn
    type             = "forward"
  }
}

##################################################################
#Create the Target Group attachment
#register instances and containers with ALB or NLB target group
##################################################################

resource "aws_lb_target_group_attachment" "default" {
  count = var.number_of_tgids

  #count            = "${length(split(",","var.targetids"))}"
  target_group_arn = aws_lb_target_group.default.arn
  target_id        = element(var.targetids, count.index)
}
