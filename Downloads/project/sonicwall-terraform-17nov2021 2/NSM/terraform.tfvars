#-----------------------------------------------------------------#
# Configure Terragrunt to automatically store tfstate files in S3 #
#-----------------------------------------------------------------#
# terragrunt = {
#   remote_state {
#     backend = "s3"

#     config {
#       encrypt        = false
#       bucket         = "snwl-production-terraform-state"
#       key            = "production/frankfurt/infrastructure/vpc/main/terraform.tfstate"
#       region         = "us-west-2"
#       dynamodb_table = "production-lock-table"

#       dynamodb_table_tags {
#         owner = "terragrunt integration"
#         name  = "Terraform lock table"
#       }
#     }
#   }
# }

#-----------------------------------------------------------------------------------------#
# VPC module related variables 
#-----------------------------------------------------------------------------------------#


#---------------------------------------------------------------#
# VPC resources                                                 #
#---------------------------------------------------------------#



#"Private subnets mapping has to match your VPC CIDR Block or it will fail
az-private-subnet-mapping = [
 
  {
    name = "EU1CENTRALAWS-NSM-10.84.130.X"
    az   = "us-east-1a"
    cidr = "192.168.130.0/24"
    BU   = "NSM"
  },
  {
    name = "EUCENTRALBAWS-NSM-10.84.131.X"
    az   = "us-east-1b"
    cidr = "192.168.131.0/24"
    BU   = "NSM"
  },
  {
    name = "EUCENTRALCAWS-NSM-10.84.132.X"
    az   = "us-east-1c"
    cidr = "192.168.132.0/24"
    BU   = "NSM"
  },
]


#----------------------------------------------------#
# Security Group LB TCP rule                         #
#----------------------------------------------------#

#allow all ports from outside
sg_cass_lb_tcp_inbound_ports = "25,51212,8"

sg_cass_lb_tcp_protocol = "TCP"

cass_lb_tcp_ingress_cidr = ["0.0.0.0/0"]

#--------------------------------------------------------------#
# Security Group LB TCP rule for internal access to the servers
#-------------------------------------------------------------#
sg_cass_lb_tcp_internal_inbound_ports = "22,25,80,443"

# sg_cass_lb_tcp_protocol = "TCP"

cass_lb_tcp_ingress_cidr_internal = ["10.50.18.0/24", "10.11.0.0/16", "10.21.0.0/16", "10.100.0.0/16", "10.84.0.0/16", "10.206.34.0/24"]

sg_cass_lb_tcp_description_internal = "Allow SSH_SMTP_HTTP_HTTPS from internal IPs Only"

#-----------------------------------------------------#
# Linux Security Group                                #
#-----------------------------------------------------#

linux_sg_name = "EUCENTRALAWS-PRODUCTION-LINUX"

linux_sg_description = "LINUX SG GROUP FOR ALL PUBLIC SERVERS"

#----------------------------------------------------#
# Security Group Linux TCP rule                      #
#----------------------------------------------------#

#allow all ports control by the VPN firewall rule
sg_linux_tcp_inbound_ports = "0"

sg_linux_tcp_protocol = "-1"

linux_tcp_ingress_cidr = ["10.50.18.0/24", "10.11.0.0/16", "10.21.0.0/16", "10.100.0.0/16", "10.84.0.0/16", "10.206.34.0/24", "10.113.0.0/16"]

sg_linux_description = "allow internal access"

#----------------------------------------------------#
# Security Group Linux TCP 9080 rule for CAS API     #
#----------------------------------------------------#

#allow port 9080 rule for cas API
sg_linux_9080_tcp_inbound_ports = "9080"

sg_linux_9080_tcp_protocol = "TCP"

linux_tcp_9080_ingress_cidr = ["0.0.0.0/0"]

sg_linux_9080_description = "allow access to port 9080 for CAS API"

#----------------------------------------------------------------------------------#
# CGMS Security Group Ingress rule allow Redshift  #
##---------------------------------------------------------------------------------#

sg_cgms_redshift_inbound_ports = "5439"

sg_cgms_redshift_protocol = "tcp"

sg_cgms_redshift_ingress_cidr = ["35.158.127.160/27"]

sg_cgms_redshift_description = "redshift-firehose access"

#s3
lifecycle_name       = "Gitea_backup_archieve"

#-----------------------------------------------------------------------------------------#
# Variables for redshift Cluster
#-----------------------------------------------------------------------------------------#
subnet_grp_enabled         = true
subgrp_name                = "redshift-subnet-group"
subnet_ids                 = ["subnet-0bcff0bc99c3fb55d" , "subnet-01e3ca4ab4443a814" ,"subnet-0ccba351216d1ff58"]
parameter_gname_enabled    = true
parameter_gname            = "redshift-parameter-group"
name                       = "redshift-cluster"
database_name              = "report"
isencrypted                = false
master_password            = "redshift4FRAIsNowLive"
master_username            = "redshiftadmin"
node_type                  = "dc2.large"
number_of_nodes            = "4"
enhancedvpc                = false
publicly_accessible        = true
BU                         = "NSM"
securitygrp_ids            = ["sg-05ea932cc63eb6904"]

#-----------------------------------------------------------------------------------------#
# Variables for RDS mariadB Cluster
#-----------------------------------------------------------------------------------------#

#-----------------------------#
#Applies to RDS
#-----------------------------#

# db_vpc_security_group_ids = ["sg-05ea932cc63eb6904"]

# db_subnet_group = ["subnet-07f8ceb2c859b3e68", "subnet-05502f7982f4f6b2a" ,"subnet-0010a3d141948e0fa"]


#-------------------------------#
# RDS variables
#-------------------------------#

rds_identifier = "prod-nsm-mariadb"

engine = "mariadb"

engine_version = "10.3"

# m5.2xlarge: 8 CPU, 32GB Mem
instance_class = "db.m5.2xlarge"

allocated_storage = "500"

storage_type = "gp2"

db_name = "gitea"

db_master_username = "XXXXXXXXXXXXXXXX"
db_master_password = "xxxxxx"

db_port = "3306"

multi_az = true

dB_publicly_accessible = false

allow_major_version_upgrade = false

auto_minor_version_upgrade = true

apply_immediately = true

deletion_protection = false

skip_final_snapshot = true

tags = {
  BU = "NSM"
}

#-----------------------------------------------------------------------------------------#
# Variables for kinesis_firehose Cluster
#-----------------------------------------------------------------------------------------#

####################################
## Variables for redshift Cluster ##
####################################

#these values are coming from redshift variables

# database_name              = "report"
# master_password            = "XXXXXXXXXXXXXXX"
# master_username            = "XXXXXXXXXXXXX"
# securitygrp_ids            = ["sg-XXXXXXXXeb6904"]

####################################
## Variables for S3 Bucket        ##
####################################

bucketname                 = "nsm-fra-firehose"
acl                        = "private"


####################################
## Variables for firehose stream  ##
####################################

clusterjdbc                = "jdbc:redshift://redshift-cluster.c6jv1s93e0pt.eu-central-1.redshift.amazonaws.com:5439/report"
copy_options               = "CSV TIMEFORMAT 'epochsecs' MAXERROR AS 1000"
copy_options1              = "JSON 'auto' TIMEFORMAT 'epochsecs' MAXERROR AS 1000"
destination                = "redshift"
iam_role_name              = "firehose_delivery_role_fra"
iam_role_policy_name       = "pipeline_test_role_policy_fra"
bu                         = "NSM"
application                = "NSM"
tag_environment            = "Production"
tag_region                 = "Frankfurt"

############################
## firehose stream  names ##
############################

firehosename1              = "gms-application"
firehosename2              = "gms-user_by_session"
firehosename3              = "gms-user_by_received"
firehosename4              = "gms-user_by_sent"
firehosename5              = "gms-address_by_session"
firehosename6              = "gms-address_by_received"
firehosename7              = "gms-address_by_sent"
firehosename8              = "gms-location"
firehosename9              = "gms-domain"
firehosename10             = "gms-virus"
firehosename11             = "gms-intrusion"
firehosename12             = "gms-spyware"
firehosename13             = "gms-fw_info"
firehosename14             = "gms-capture_atp_info"
firehosename15             = "gms-dpi_ssl_info"
firehosename16             = "gms-connection_info"
firehosename17             = "gms-bandwidth_info"
firehosename18             = "gms-botnet"
firehosename19             = "gms-rating"

######################
## Data table names ##
######################

datatablename1              = "application"
datatablename2              = "user_by_session"
datatablename3              = "user_by_received"
datatablename4              = "user_by_sent"
datatablename5              = "address_by_session"
datatablename6              = "address_by_received"
datatablename7              = "address_by_sent"
datatablename8              = "location"
datatablename9              = "domain"
datatablename10             = "virus"
datatablename11             = "intrusion"
datatablename12             = "spyware"
datatablename13             = "fw_info"
datatablename14             = "capture_atp_info"
datatablename15             = "dpi_ssl_info"
datatablename16             = "connection_info"
datatablename17             = "bandwidth_info"
datatablename18             = "botnet"
datatablename19             = "rating"


#-----------------------------------------------------------------------------------------#
# Variables for elasticsearch Cluster
#-----------------------------------------------------------------------------------------#
//Set version of ES
es_version = "7.1"

//VPC Vars
elasticsearch_subnet_ids = ["subnet-012e28f341285a86d" , "subnet-01c61495db36a80fd" , "subnet-0ba59750290c3acc6"]
security_group_ids = ["sg-05ea932cc63eb6904"]

//EBS Vars
ebs_size = 250
ebs_type = "gp2"
ebs_iops = 0

//AZ Awareness Vars
zone_awareness = "true"
az_count       = 3 //Takes 1,2,3

//Instance Vars
master_instance_type  = "m5.large.elasticsearch"
master_instance_count = 4 //Takes 3 or 5

data_instance_type  = "m5.xlarge.elasticsearch"
data_instance_count = 6

//Node to node encryption
node_to_node_encryption = "false"

//Logging
log_publishing_index_enabled       = "false"
log_publishing_search_enabled      = "false"
log_publishing_application_enabled = "false"

//Enable ES Service Linked Role Creation
create_service_linked_role = "false"

//Tags
env     = "Production"
# BU      = "NSM"
appname = "NSM"



#-----------------------------------------------------------------------------------------#
# Variables for elasticache(redis) Cluster
#-----------------------------------------------------------------------------------------#

# numcache               = "2"
nodetype               = "cache.m5.large"
par_name               = "default.redis5.0"
eng_ver                = "5.0.6"
maintaince_win         = "sun:10:40-sun:11:40"
snap_win               = "09:10-10:10"
snap_reten_limit       = 1
automatic_failover     = true
at_rest                = false
transit_encry          = false
redis_apply_immediately      = true
description            = "Redis cluster for NSM-FRA Production"


name_tag               = "eu1aws-nsm-redis-prod"
enviroment_tag         = "Production"
bu_tag                 = "NSM"
sn_grp_desc            = "subnet group for nsm redis cluster"

#-----------------------------------------------------------------------------------------#
# Variables for cloudfront
#-----------------------------------------------------------------------------------------#

  comment                        = "FRA Production NSM CloudFront"
  root_object                    = ""
  origin_protocol_policy         = "match-viewer"
  ssl_protocols                  = ["TLSv1"]
  aliases                        = ["nsm-eucentral.sonicwall.com"]
  cert_arn                       = "arn:aws:acm:us-east-1:940810875359:certificate/e3XXXXXXXXXXXXXXXXX570b"
  ssl_support_method             = "sni-only"
  min_protocol_version           = "TLSv1.2_2018"
  default_cert                   = false
  allowed_methods                = ["GET", "HEAD", "OPTIONS", "PUT", "POST", "PATCH", "DELETE"]
  cached_methods                 = ["GET", "HEAD", "OPTIONS"]
  target_origin_id               = "ELB-a08f5XXXXXXXXXXXXXXXXXXXXXX547753.elb.eu-central-1.amazonaws.com"
  forward                        = "all"
  cloudfront_env                 = "Production"
  restriction_type               = "none"

#-----------------------------------------------------------------------------------------#
# Variables for eks
#-----------------------------------------------------------------------------------------#

vpc_name = "EU1AWS-EKS-PRODUCTION-VPC"

#Internet Gateway Name
ig_gw_name = "EU1AWS-EKS-PRODUCTION-INTERNET-GATEWAY"

#NAT Gateway Name
nat_gw_name = "EU1AWS-EKS-PRODUCTION-NAT-GATEWAY"

#NAT Gateway public IP name
nat_gw_eip_name = "EU1AWS-EKS-PRODUCTION-NAT-GATEWAY-IP"

#Public route table name
public_routetable_name = "EU1AWS-EKS-PRODUCTION-VPC-PUBLIC-RT"

#Private route table name
private_routetable_name = "EU1AWS-EKS-PRODUCTION-VPC-INTERNAL-RT"

#-----------------------------------------------------#
# EKS Master Security Group                           #
#-----------------------------------------------------#

eksmaster_sg_name = "EKS-SG"

eksmaster_sg_description = "eks fra master sg group"

#----------------------------------------------------#
# EKS Master Security Group  TCP rule                #
#----------------------------------------------------#

#allow all ports control by the VPN firewall rule
sg_eksmaster_tcp_inbound_ports = "443"

sg_eksmaster_tcp_protocol = "tcp"

sg_eksmaster_tcp_ingress_cidr = ["10.50.18.0/24"]

sg_eksmaster_description = "allow internal access"

#----------------------------------------------------#
# EKS worker sg all  rules                             #
#----------------------------------------------------#

sg_eksmaster_all_inbound_ports = "0"

sg_eksmaster_all_protocol = "-1"

sg_eksmaster_all_ingress_cidr = ["10.50.18.0/24", "10.82.0.0/16"]

sg_eksmaster_all_description = "Allow internal access"

#-----------------------------------------------------#
# EKS worker security group                            #
#-----------------------------------------------------#

eks_sg_name = "EKS-worker-SG"

eks_sg_description = "eks fra worker security group"

#----------------------------------------------------#
# EKS worker sg   rules                             #
#----------------------------------------------------#

sg_eksworker_tcp_inbound_ports = "0"

sg_eksworker_tcp_protocol = "-1"

sg_eksworker_tcp_ingress_cidr = ["10.50.18.0/24"]

sg_eksworker_description = "Allow node to communicate with each other and to masters"

#------------------------------------------#
# EKS cluster
#------------------------------------------#

eks_iam_role_name = "fra-eks-production-role"

eks_cluster_log_types = ["api", "audit", "scheduler"]

retention_days = "7"

# bu                         = "NSM"

# application                = "NSM"

# tag_environment            = "Production"

# tag_region                 = "Frankfurt"

#------------------------------------------#
# EKS worker auto scaling lauch config
#------------------------------------------#

eks_node_group_name = "fra-eks-production-general-woker-node-group"

eks_node_group_iam_role = "fra-eks-workernode-role"

ami_type = "AL2_x86_64"

instance_type = ["m5.xlarge"]

root_volume_size = "75"

ec2_ssh_key = "fra-keys"

#--------------------------------------#
#EKS auto scaling group
#--------------------------------------#

desired_capacity = "6"

max_size = "100"

min_size = "3"

#--------------------------------------#
# EKS gitea node group
#--------------------------------------#
#eks_node_group_gitea_name = "fra-eks-eks-production-worker-node-gitea-group"
#node_group_gitea_instance_type = ["m5.xlarge"]

#desired_capacity_gitea = "2"

#max_size_gitea = "2"

#min_size_gitea = "1"

#eks_gitea_subnet_ids = ["subnet-073c25c616640dd6f", "subnet-0860fd29c90a60acc"]

#--------------------------------------#
# EKS gitea node group-new
#--------------------------------------#
eks_node_group_gitea_new_name = "fra-eks-production-nsm-worker-nodegroup-gitea-new"
node_group_gitea_new_instance_type = ["m5.xlarge"]

desired_capacity_gitea_new = "2"

max_size_gitea_new = "2"

min_size_gitea_new = "1"

# eks_gitea_new_subnet_ids = ["subnet-0860fd29c90a60acc"]
