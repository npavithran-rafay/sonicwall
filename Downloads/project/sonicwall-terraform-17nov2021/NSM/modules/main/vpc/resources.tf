#----------------------------------#
#Store the state file in S3 Bucket #
#----------------------------------#
# terraform {
#   # The configuration for this backend will be filled in by Terragrunt
#   backend "s3" {}
# }

#-----------------------------#
#create VPC resources         #
#-----------------------------#

# Creates N private subnets according to the subnet mapping described in
# the `az-private-subnet-mapping` variable.
#
# The variable is a list of maps in the following form:
#
#
# For instance:
#
#   [ { name =  "sub1", az = "us-east-1a", cidr = "192.168.0.0/24"  } ]
#
resource "aws_subnet" "add_private_subnets" {
  count = "${length(var.az-private-subnet-mapping)}"

  cidr_block        = "${lookup(var.az-private-subnet-mapping[count.index], "cidr")}"
  vpc_id            = "${var.production_vpc_id}"
  availability_zone = "${lookup(var.az-private-subnet-mapping[count.index], "az")}"

  tags = {
    Name = "${lookup(var.az-private-subnet-mapping[count.index], "name")}"
    BU   = "${lookup(var.az-private-subnet-mapping[count.index], "BU")}"
  }
}

# Associate the Subnets to the private Route Table
# we get the route tabe id from reading the VPC (see data_source.tf )

resource "aws_route_table_association" "production_private_routetable_association" {
  count          = "${length(var.az-private-subnet-mapping)}"
  subnet_id      = "${element(aws_subnet.add_private_subnets.*.id, count.index)}"
  route_table_id = "${data.aws_route_table.selected_rt.route_table_id}"
}

#---------------------------------------------#
#create the Default Security Group for CGMS   #
#---------------------------------------------#

module "vpc_security_cgms_group" {
  source         = "../../../modules/infrastructure/security/group"
  vpc_id         = "${var.production_vpc_id}"
  sg_name        = "${var.cgms_sg_name}"
  sg_description = "${var.cgms_sg_description}"
  sg_bu          = "CGMS"
}

#---------------------------------------------------#
#create the Default Security Groups Rules for CGMS  #
#--------------------------------------------------#

#---------#
#Ingress  #
#---------#

#allow all ports, restriction & ports are control via the VPN firewall
module "vpc_sg_cgms_ingress_rules" {
  source       = "../../../modules/infrastructure/security/rule"
  sg_id        = "${module.vpc_security_cgms_group.sgid}"
  sg_rule_type = "ingress"
  ports        = "${var.sg_cgms_inbound_ports}"
  cidr         = ["${var.cgms_ingress_cidr}"]
  protocol     = "${var.sg_cgms_protocol}"
  description  = "${var.sg_cgms_description}"
}

#allow specific ports,to the EC2 instances since NLB passes client IP to EC2
module "vpc_sg_cgms_ingress_rules_nlb" {
  source       = "../../../modules/infrastructure/security/rule"
  sg_id        = "${module.vpc_security_cgms_group.sgid}"
  sg_rule_type = "ingress"
  ports        = "${var.sg_cgms_inbound_ports_nlb}"
  cidr         = ["${var.cgms_ingress_cidr_nlb}"]
  protocol     = "${var.sg_cgms_protocol_nlb}"
  description  = "${var.sg_cgms_description_nlb}"
}

module "vpc_sg_cgms_apisrv_ingress_rules_nlb" {
  source       = "../../../modules/infrastructure/security/rule"
  sg_id        = "${module.vpc_security_cgms_group.sgid}"
  sg_rule_type = "ingress"
  ports        = "${var.sg_cgms_apisrv_inbound_ports_nlb}"
  cidr         = ["${var.cgms_apisrv_ingress_cidr_nlb}"]
  protocol     = "${var.sg_cgms_protocol_nlb}"
  description  = "${var.sg_cgms_apisrv_description_nlb}"
}

#UDP allow
module "vpc_sg_cgms_udp_ingress_rules" {
  source       = "../../../modules/infrastructure/security/rule"
  sg_id        = "${module.vpc_security_cgms_group.sgid}"
  sg_rule_type = "ingress"
  ports        = "${var.sg_cgms_udp_inbound_ports}"
  cidr         = ["${var.cgms_udp_ingress_cidr}"]
  protocol     = "${var.sg_cgms_udp_protocol}"
  description  = "${var.sg_cgms_udp_description}"
}

#--------#
#Egress  #
#--------#

module "vpc_sg_cgms_engress_rules" {
  source       = "../../../modules/infrastructure/security/rule"
  sg_id        = "${module.vpc_security_cgms_group.sgid}"
  sg_rule_type = "egress"
  ports        = "0"
  cidr         = ["0.0.0.0/0"]
  protocol     = "-1"
  description  = "Allow all outbound traffic"
}

#---------------------------------------------#
#create the LB Security Group for CGMS        #
#---------------------------------------------#

module "vpc_security_cgms_lb_group" {
  source         = "../../../modules/infrastructure/security/group"
  vpc_id         = "${var.production_vpc_id}"
  sg_name        = "${var.cgms_lb_sg_name}"
  sg_description = "${var.cgms_lb_sg_description}"
  sg_bu          = "CGMS"
}

#---------------------------------------------#
#create the LB Security Group for CASS        #
#---------------------------------------------#

module "vpc_security_cass_lb_group" {
  source         = "../../../modules/infrastructure/security/group"
  vpc_id         = "${var.production_vpc_id}"
  sg_name        = "${var.cass_lb_sg_name}"
  sg_description = "${var.cass_lb_sg_description}"
  sg_bu          = "CASS"
}


#------------------------------------------#
#create the LB  Security Groups Rules      #
#------------------------------------------#

#---------#
#Ingress  #
#---------#

#allow ports to the LB Public
module "vpc_sg_cass_lb_tcp_ingress_rules" {
  source       = "../../../modules/infrastructure/security/rule"
  sg_id        = "${module.vpc_security_cass_lb_group.sgid}"
  sg_rule_type = "ingress"
  ports        = "${var.sg_cass_lb_tcp_inbound_ports}"
  cidr         = ["${var.cass_lb_tcp_ingress_cidr}"]
  protocol     = "${var.sg_cass_lb_tcp_protocol}"
  description  = "${var.sg_cass_lb_tcp_description}"
}

#allow ssh internal access to the LB servers only
module "vpc_sg_cass_lb_tcp_internal_ingress_rules" {
  source       = "../../../modules/infrastructure/security/rule"
  sg_id        = "${module.vpc_security_cass_lb_group.sgid}"
  sg_rule_type = "ingress"
  ports        = "${var.sg_cass_lb_tcp_internal_inbound_ports}"
  cidr         = ["${var.cass_lb_tcp_ingress_cidr_internal}"]
  protocol     = "${var.sg_cass_lb_tcp_protocol}"
  description  = "${var.sg_cass_lb_tcp_description_internal}"
}

#--------#
#Egress  #
#--------#

module "vpc_sg_cass_lb_egress_rules" {
  source       = "../../../modules/infrastructure/security/rule"
  sg_id        = "${module.vpc_security_cass_lb_group.sgid}"
  sg_rule_type = "egress"
  ports        = "0"
  cidr         = ["0.0.0.0/0"]
  protocol     = "-1"
  description  = "Allow all outbound traffic"
}

#-----------------------------------------#
# create Linux Security Group
#-----------------------------------------#

module "vpc_security_linux_default_group" {
  source         = "../../../modules/infrastructure/security/group"
  vpc_id         = "${var.production_vpc_id}"
  sg_name        = "${var.linux_sg_name}"
  sg_description = "${var.linux_sg_description}"
  sg_bu          = "ITOPS"
}

#---------------------------------------------------#
#Create the Default Security Groups Rules for Linux #
#---------------------------------------------------#

#---------#
#Ingress  #
#---------#

#allow all ports, restriction & ports are control via the VPN firewall
module "vpc_sg_linux_default_ingress_rules" {
  source       = "../../../modules/infrastructure/security/rule"
  sg_id        = "${module.vpc_security_linux_default_group.sgid}"
  sg_rule_type = "ingress"
  ports        = "${var.sg_linux_tcp_inbound_ports}"
  cidr         = ["${var.linux_tcp_ingress_cidr}"]
  protocol     = "${var.sg_linux_tcp_protocol}"
  description  = "${var.sg_linux_description}"
}

module "vpc_sg_linux_default_9080_ingress_rules" {
  source       = "../../../modules/infrastructure/security/rule"
  sg_id        = "${module.vpc_security_linux_default_group.sgid}"
  sg_rule_type = "ingress"
  ports        = "${var.sg_linux_9080_tcp_inbound_ports}"
  cidr         = ["${var.linux_tcp_9080_ingress_cidr}"]
  protocol     = "${var.sg_linux_9080_tcp_protocol}"
  description  = "${var.sg_linux_9080_description}"
}

module "vpc_sg_linux_default_redshift_ingress_rules" {
  source       = "../../../modules/infrastructure/security/rule"
  sg_id        = "${module.vpc_security_linux_default_group.sgid}"
  sg_rule_type = "ingress"
  ports        = "${var.sg_cgms_redshift_inbound_ports}"
  cidr         = ["${var.sg_cgms_redshift_ingress_cidr}"]
  protocol     = "${var.sg_cgms_redshift_protocol}"
  description  = "${var.sg_cgms_redshift_description}"
}

#--------#
#Egress  #
#--------#

module "vpc_sg_linux_default_engress_rules" {
  source       = "../../../modules/infrastructure/security/rule"
  sg_id        = "${module.vpc_security_linux_default_group.sgid}"
  sg_rule_type = "egress"
  ports        = "0"
  cidr         = ["0.0.0.0/0"]
  protocol     = "-1"
  description  = "Allow all outbound traffic"
}
