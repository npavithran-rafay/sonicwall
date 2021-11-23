#aws info
variable "aws_access_key" {}

variable "aws_secret_key" {}

variable "region" {
  description = "Region for the VPC"
}

variable "production_vpc_id" {
  description = "VPC id"
}

#variable "private_routetable_name" {
#    description = "Private route table name"
#    #default = "Terraform-created-RTB-Private"
#}

variable "az-private-subnet-mapping" {
  type        = "list"
  description = "Private subnets mapping"
  #default     = []
}

#--------------------------#
#CGMS Security Group
#--------------------------#
variable "cgms_sg_name" {
  description = "Security Group name"
  #default     = "Terraform-created-cgms-sg"
}

variable "cgms_sg_description" {
  description = "Security Group description"
  #default     = "Terraform-created-group"
}

#----------------------------------#
#CGMS Security Group Ingress rule  #
#----------------------------------#

variable "sg_cgms_inbound_ports" {
  description = "inbound ports to allow"
  #default     = 0
}

variable "sg_cgms_protocol" {
  description = "TCP | UDP"
  #default     = "tcp"
}

variable "cgms_ingress_cidr" {
  description = "allowed subnets"
  type        = "list"
  #default     = ["192.168.0.0/16"]
}

variable "sg_cgms_description" {
  description = "rule descriptions"
  #default     = ""
}

#--------------------------------------#
#CGMS Security Group Ingress rule NLB  #
#--------------------------------------#

variable "sg_cgms_inbound_ports_nlb" {
  description = "inbound ports to allow"
  #default     = 0
}

variable "sg_cgms_protocol_nlb" {
  description = "TCP | UDP"
  #default     = "-1"
}

variable "cgms_ingress_cidr_nlb" {
  description = "allowed subnets"
  type        = "list"
  #default     = ["192.168.0.0/16"]
}

variable "sg_cgms_description_nlb" {
  description = "rule descriptions"
  #default     = ""
}

#--------------------------------------#
#Security rule for APISRV rule
#--------------------------------------#
variable "sg_cgms_apisrv_inbound_ports_nlb" {
  description = "inbound ports to allow"
  #default     = 0
}

variable "cgms_apisrv_ingress_cidr_nlb" {
  description = "allowed subnets"
  type        = "list"
  #default     = ["192.168.0.0/16"]
}

variable "sg_cgms_apisrv_description_nlb" {
  description = "rule descriptions"
  #default     = ""
}

#-------------------------------------#
#CGMS Security Group UDP Ingress rule
#-------------------------------------#
variable "sg_cgms_udp_inbound_ports" {
  description = "inbound ports to allow"
  #default     = 0
}

variable "sg_cgms_udp_protocol" {
  description = "TCP | UDP"
  #default     = "udp"
}

variable "cgms_udp_ingress_cidr" {
  description = "allowed subnets"
  type        = "list"
  #default     = ["192.168.0.0/16"]
}

variable "sg_cgms_udp_description" {
  description = "rule descriptions"
  #default     = ""
}

#--------------------------#
#CGMS LB Security Group
#--------------------------#
variable "cgms_lb_sg_name" {
  description = "Security Group name"
  #default     = "Terraform-created-cgms-lb-sg"
}

variable "cgms_lb_sg_description" {
  description = "Security Group description"
  #default     = "Terraform-created-group"
}

#---------------------------------------#
#CGMS Security Group TCP Ingress rule   #
#---------------------------------------#

variable "sg_cgms_lb_tcp_inbound_ports" {
  description = "inbound ports to allow"
  #default     = 0
}

variable "sg_cgms_lb_tcp_protocol" {
  description = "TCP | UDP"
  #default     = "tcp"
}

variable "cgms_lb_tcp_ingress_cidr" {
  description = "allowed subnets"
  type        = "list"
  #default     = ["192.168.0.0/16"]
}

variable "sg_cgms_lb_tcp_description" {
  description = "rule descriptions"
  #default     = ""
}

#-----------------------------------------------#
#CGMS Security Group TCP Ingress rule internal  #
#-----------------------------------------------#

variable "sg_cgms_lb_tcp_internal_inbound_ports" {
  description = "inbound ports to allow"
  #default     = 0
}

variable "cgms_lb_tcp_ingress_cidr_internal" {
  description = "allowed subnets"
  type        = "list"
  #default     = ["192.168.0.0/16"]
}

variable "sg_cgms_lb_tcp_description_internal" {
  description = "rule descriptions"
  #default     = ""
}

#--------------------------------------------------#
#CGMS LB Security Group TCP monitors Ingress rule  #
#--------------------------------------------------#

variable "sg_cgmsmon_inbound_ports" {
  description = "inbound ports to allow"
  #default     = 0
}

variable "sg_cgmsmon_protocol" {
  description = "TCP | UDP"
  #default     = "tcp"
}

variable "cgmsmon_ingress_cidr" {
  description = "allowed subnets"
  type        = "list"
  #default     = ["192.168.0.0/16"]
}

variable "sg_cgmsmon_lb_tcp_description_internal" {
  description = "rule descriptions"
  #default     = ""
}


#--------------------------------------#
#CGMS Security Group UDP Ingress rule  #
#---------------------------------------#

variable "sg_cgms_lb_udp_inbound_ports" {
  description = "inbound ports to allow"
  #default     = 0
}

variable "sg_cgms_lb_udp_protocol" {
  description = "TCP | UDP"
  #default     = "udp"
}

variable "cgms_lb_udp_ingress_cidr" {
  description = "allowed subnets"
  type        = "list"
  #default     = ["192.168.0.0/16"]
}

variable "sg_cgms_lb_udp_description" {
  description = "rule descriptions"
  #default     = ""
}

#--------------------------#
#CASS Security Group
#--------------------------#
variable "cass_sg_name" {
  description = "Security Group name"
  #default     = "Terraform-created-cass-sg"
}

variable "cass_sg_description" {
  description = "Security Group description"
  #default     = "Terraform-created-group"
}

#----------------------------------#
#CASS Security Group Ingress rule  #
#----------------------------------#

variable "sg_cass_inbound_ports" {
  description = "inbound ports to allow"
  #default     = 0
}

variable "sg_cass_protocol" {
  description = "TCP | UDP"
  #default     = "tcp"
}

variable "cass_ingress_cidr" {
  description = "allowed subnets"
  type        = "list"
  #default     = ["192.168.0.0/16"]
}

variable "sg_cass_description" {
  description = "rule descriptions"
  #default     = ""
}

#--------------------------------------#
#CASS Security Group Ingress rule NLB  #
#--------------------------------------#

variable "sg_cass_inbound_ports_nlb" {
  description = "inbound ports to allow"
  #default     = 0
}

variable "sg_cass_protocol_nlb" {
  description = "TCP | UDP"
  #default     = "tcp"
}

variable "cass_ingress_cidr_nlb" {
  description = "allowed subnets"
  type        = "list"
  #default     = ["192.168.0.0/16"]
}

variable "sg_cass_description_nlb" {
  description = "rule descriptions"
  #default     = ""
}

#--------------------------#
#CASS LB Security Group
#--------------------------#
variable "cass_lb_sg_name" {
  description = "Security Group name"
  #default     = "Terraform-created-cass-lb-sg"
}

variable "cass_lb_sg_description" {
  description = "Security Group description"
  #default     = "Terraform-created-group"
}

#---------------------------------------#
#CASS Security Group TCP Ingress rule   #
#---------------------------------------#

variable "sg_cass_lb_tcp_inbound_ports" {
  description = "inbound ports to allow"
  #default     = 0
}

variable "sg_cass_lb_tcp_protocol" {
  description = "TCP | UDP"
  #default     = "tcp"
}

variable "cass_lb_tcp_ingress_cidr" {
  description = "allowed subnets"
  type        = "list"
  #default     = ["192.168.0.0/16"]
}

variable "sg_cass_lb_tcp_description" {
  description = "rule descriptions"
  #default     = ""
}

#-----------------------------------------------#
#CASS Security Group TCP Ingress rule internal  #
#-----------------------------------------------#

variable "sg_cass_lb_tcp_internal_inbound_ports" {
  description = "inbound ports to allow"
  #default     = 0
}

variable "cass_lb_tcp_ingress_cidr_internal" {
  description = "allowed subnets"
  type        = "list"
  #default     = ["192.168.0.0/16"]
}

variable "sg_cass_lb_tcp_description_internal" {
  description = "rule descriptions"
  #default     = ""
}

#--------------------------#
#Linux Security Group
#--------------------------#
variable "linux_sg_name" {
  description = "Security Group name"
  #default     = "Terraform-created-linux-sg"
}

variable "linux_sg_description" {
  description = "Security Group description"
  #default     = "Terraform-created-group"
}

#----------------------------------#
#Linux Security Group Ingress rule  #
#----------------------------------#

variable "sg_linux_tcp_inbound_ports" {
  description = "inbound ports to allow"
  #default     = 0
}

variable "sg_linux_tcp_protocol" {
  description = "TCP | UDP"
  #default     = "tcp"
}

variable "linux_tcp_ingress_cidr" {
  description = "allowed subnets"
  type        = "list"
  #default     = ["192.168.0.0/16"]
}

variable "sg_linux_description" {
  description = "rule descriptions"
  #default     = ""
}

#----------------------------------------#
#Linux Security Group Ingress rule 9080  #
#----------------------------------------#

variable "sg_linux_9080_tcp_inbound_ports" {
  description = "inbound ports to allow"
  #default     = 0
}

variable "sg_linux_9080_tcp_protocol" {
  description = "TCP | UDP"
  #default     = "tcp"
}

variable "linux_tcp_9080_ingress_cidr" {
  description = "allowed subnets"
  type        = "list"
  #default     = ["192.168.0.0/16"]
}

variable "sg_linux_9080_description" {
  description = "rule descriptions"
  #default     = ""
}

#--------------------------#
# ITOPS Security Group	   #
#--------------------------#
variable "itops_sg_name" {
  description = "Security Group name"
  #default     = "Terraform-created-itops-sg"
}

variable "itops_sg_description" {
  description = "Security Group description"
  #default     = "Terraform-created-group"
}

#----------------------------------#
# ITOPS Security Group Ingress rule#
#----------------------------------#

variable "sg_itops_inbound_ports" {
  description = "inbound ports to allow"
  #default     = 0
}

variable "sg_itops_protocol" {
  description = "TCP | UDP"
  #default     = "tcp"
}

variable "itops_ingress_cidr" {
  description = "allowed subnets"
  type        = "list"
  #default     = ["192.168.0.0/16"]
}

variable "sg_itops_description" {
  description = "rule descriptions"
  #default     = ""
}

#----------------------------------#
#Redshift Security Group Ingress rule  #
#----------------------------------#

variable "sg_cgms_redshift_inbound_ports" {
  description = "inbound ports to allow"
  #default     = 0
}

variable "sg_cgms_redshift_protocol" {
  description = "TCP | UDP"
  #default     = "tcp"
}

variable "sg_cgms_redshift_ingress_cidr" {
  description = "allowed subnets"
  type        = "list"
  #default     = ["192.168.0.0/16"]
}

variable "sg_cgms_redshift_description" {
  description = "rule descriptions"
  #default     = ""
}

