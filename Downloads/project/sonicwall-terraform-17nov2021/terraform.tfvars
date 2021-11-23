/*#-----------------------------------------------------------------#
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

#---------------------------------------------------------------#
#aws provider info                                              #
#---------------------------------------------------------------#
aws_access_key = ""

aws_secret_key = ""

#Region for the VPC
# region = "eu-central-1"
region = "us-west-2"

#-----------------------------------------------------------------------------------------#
# VPC module related variables 
#-----------------------------------------------------------------------------------------#
production_vpc_id = "vpc-0a3ed4a473c8c0362"

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

#-----------------------------------------------------------------------------------------#
# S3 module related variables 
#-----------------------------------------------------------------------------------------#
############################################
## Variables for S3 bucket for reportlite ##
############################################

bucket_name_reportlite    = "nsmfra-report-lite"
acl_reportlite            = "private"
#######################################
## Variables for S3 bucket for gitea ##
#######################################

bucket_name_gitea    = "nsm-fra-gitea-production"
acl_gitea            = "private"
lifecycle_name       = "Gitea_backup_archieve"
storage_class        = "INTELLIGENT_TIERING"

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

db_vpc_security_group_ids = ["sg-05ea932cc63eb6904"]

db_subnet_group = ["subnet-07f8ceb2c859b3e68", "subnet-05502f7982f4f6b2a" ,"subnet-0010a3d141948e0fa"]
db_subnet_group_name = "eu1aws-nsm-mariadb"

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

arn_deliverystream         = "arn:aws:firehose:eu-central-1:940810875359:deliverystream/*"

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

domain_name = "eu1aws-nsm-elasticsearch"
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

sn_grp_name            = "nsm-redis-subnetgroup"
sg_ids                 = ["sg-05ea932cc63eb6904"]
sn_ids                 = ["subnet-012e28f341285a86d" , "subnet-01c61495db36a80fd" , "subnet-0ba59750290c3acc6"]
eng_name               = "redis" 
port                   = 6379
repl_grp               = "eu1aws-nsm-redis"
numcache               = "2"

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

 cloudfront_domain_name         = "a08f5eXXXXXXXXXXXXXXXXXXXXXX7753.elb.eu-central-1.amazonaws.com"
 bucket_name                    = "nsm-fra-cloudfront"
 bucket_domain_name             = "nsm-fra-cloudfront.s3.amazonaws.com"
 origin_id                      = "ELB-a08f5ee0fb4XXXXXXXXXXXXXXXXXXXXXXX6547753.elb.eu-central-1.amazonaws.com"
 prefix                         = "cloudfront-logs"
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

#eks_gitea_new_subnet_ids = ["subnet-0860fd29c90a60acc"]

##eks
eks_cluster_name                = "fra-eks-production-general-cluster"
eks_cluster_version             = "1.16"
eks_endpoint_private_access     = true 
eks_endpoint_public_access      = false
vpccidr                         = "10.113.0.0/16"
#"Private subnets mapping has to match your VPC CIDR Block or it will fail
private_az_subnets_cidr = [
  {
    name = "EKS-PRODUCTION-10.113.0.0/19"
    az   = "eu-central-1a"
    cidr = "10.113.0.0/19"
  },
  {
    name = "EKS-PRODUCTION-10.113.32.0/19"
    az   = "eu-central-1b"
    cidr = "10.113.32.0/19"
  },
  {
    name = "EKS-PRODUCTION-10.113.64.0/19"
    az   = "eu-central-1c"
    cidr = "10.113.64.0/19"
  },
]

#Pubic subnets mapping has to match your VPC CIDR Block or it will fail

public_az_subnets_cidr = [
  {
    name = "EKS-PUBLIC-10.113.128.0/19"
    az   = "eu-central-1a"
    cidr = "10.113.128.0/19"
  },
  {
    name = "EKS-PUBLIC-10.113.160.0/19"
    az   = "eu-central-1b"
    cidr = "10.113.160.0/19"
  },
  {
    name = "EKS-PUBLIC-10.113.192.0/19"
    az   = "eu-central-1c"
    cidr = "10.113.192.0/19"
  },
]
eks_gitea_new_subnet_ids = ["subnet-0860fd29c90a60acc"]
eks_neo4j_new_subnet_ids = ["xx"]*/


#----------------------------------------------------------------------------------------------------------------------------------------------------------------#

################################################################
## AnlyazerNG  variables
################################################################

#---------------------------------------------------------------#
#aws provider info                                              #
#---------------------------------------------------------------#
aws_access_key = ""
aws_secret_key = ""
#Region for the VPC
region = "us-west-2"

## IAM
iam_name           = "NSM-Production-FRA-Analyzer-NG-Policy" 
nsm_eks_worker_iam = "fra-eks-workernode-role"

######################
## S3 bucket values ##
######################

  prefix                    = "eu1aws"
  acl                       = "private"
  lifecycle_name            = "analyzerng-s3-lifecycle"
  versioning                = false
  lifecycle_enabled         = true
  #s3_region                 = "eu-central-1"
  s3_region                 = "us-west-2"
  lifecycle_expiration_days = 15
  tagenv                    = "Production"
  tagregion                 = "Frankfurt"
  Application               = "NSM"
  Applicationtype           = "Analyzer-NG"
  bu                        = "NSM"
  block_public_acls         = true
  ignore_public_acls        = true
  block_public_policy       = true
  restrict_public_buckets   = true
  create_folder             = true
  S3_key                    = "flowdata/"
  flow_lifecycle_expiration_days  = 365
  lifecycle_name_1                = "flowblocked_lifecycle"
  lifecycle_name_2                = "reportdata_lifecycle"
  lifecycle_name_3                = "flowdata_lifecycle"
  lifecycle_name_4                = "flowthreat_lifecycle"
  lifecycle_name_5                = "flowurl_lifecycle"
  lifecycle_name_6                = "flowbytime_lifecycle"
  analyzerng_logs_lifecycle_expiration_days = 365
  
  prevent_destroy                  = "false"
  force_destroy                    = "true"

#################
## EMR  values ##
#################
# bucket location where the VPC state file is stored
#network_state_bucket = "nsm-production-terraform-state"
network_state_bucket = "gopi-bucket"
#network_state_key    = "production/Frankfurt/nsm/general_vpc/vpc/terraform.tfstate"
network_state_key    = "snwl/analyzerNG/terraform.tfstate"
network_state_region = "us-west-1"

#prefix               = "eu1aws"  
  #acl                       = "private"
  #lifecycle_enabled         = true
  #lifecycle_expiration_days = 14
  #tagenv                    = "Production"
  #block_public_acls         = true
  #ignore_public_acls        = true
  #block_public_policy       = true
  #restrict_public_buckets   = true
  #S3_key                    = "emr-logs/"

 vpc_id                                         = "vpc-0fbd2eb5666a69c88"
 name                                           = "eu1aws-ang-logprocessor-emr-cluster"
 emr2_name                                      = "eu1aws-ang-logparser-emr-cluster"
 release_label                                  = "emr-5.30.1"
 applications                                   = ["Spark","Ganglia","Hadoop"]
 ebs_root_volume_size                           = 60
 key_name                                       = "fra-keys"
 # Public subnet ID
 subnet_id                                      = "subnet-0bcff0bc99c3fb55d"
 termination_protection                         = false
 #bu                                             = "NSM"
 application                                    = "NSM"
 environment                                    = "Production"
 tag_region                                     = "Frankfurt"
 #Applicationtype                                = "Analyzer-NG"
 create_task_instance_fleet                     = true
# Instance Fleet Common values

 ebs_size             = 32
 ebs_type             = "gp2"
 volumes_per_instance = 2

# MASTER Instance fleet

 master_instance_bidprice_percentage_1 = 100

 master_instance_type                  = "r5.xlarge"
 master_fleet_name                     = "MASTER-1"
 master_target_on_demand_capacity      = 1
 master_target_spot_capacity           = 0

# CORE Instance fleet

 core_instance_bidprice_percentage_1   = 100
 core_instance_bidprice_percentage_2   = 100

 core_instance_type_1                  = "r4.xlarge"
 core_instance_weighted_capacity_1     = 2

 core_instance_type_2                  = "r5.xlarge"
 core_instance_weighted_capacity_2     = 2

# core_spot_allocation_strategy         = "capacity-optimized"
# core_spot_block_duration_minutes      = 0
# core_spot_timeout_action              = "SWITCH_TO_ON_DEMAND"
# core_spot_timeout_duration_minutes    = 10

 core_fleet_name                       = "CORE-FLEET"
 core_target_on_demand_capacity        = 4
 core_target_spot_capacity             = 0

# Task Instance fleet

 task_instance_bidprice_percentage_1 = 100
 task_instance_bidprice_percentage_2 = 100
 task_instance_bidprice_percentage_3 = 100
 task_instance_bidprice_percentage_4 = 100

 task_instance_type_1                = "r4.xlarge"
 task_instance_weighted_capacity_1   = 2

 task_instance_type_2                = "r5.xlarge"
 task_instance_weighted_capacity_2   = 2

 task_instance_type_3                = "r4.2xlarge"
 task_instance_weighted_capacity_3   = 2

 task_instance_type_4                = "r5.2xlarge"
 task_instance_weighted_capacity_4   = 2

 task_spot_allocation_strategy       = "capacity-optimized"
 task_spot_block_duration_minutes    = 0
 task_spot_timeout_action            = "SWITCH_TO_ON_DEMAND"
 task_spot_timeout_duration_minutes  = 10

 task_fleet_name                     = "TASK FLEET"
 task_target_on_demand_capacity      = 2
 task_target_spot_capacity           = 4 

# Cluster Scaling variables

 scaling_unit_type                       = "InstanceFleetUnits"
 scaling_minimum_capacity_units          = 6
 scaling_maximum_capacity_units          = 12
 scaling_maximum_ondemand_capacity_units = 12
 scaling_maximum_core_capacity_units     = 12

 keep_job_flow_alive_when_no_steps       = "true"
 visible_to_all_users                    = "true"
#-----------------------------------------------#
# Kinesis        
#-----------------------------------------------#

  #name                  = "eu1aws-analyzer-ng-stream"
  shard_count           = 32
  retention_period      = "24"
  flow_name             = "eu1aws-analyzer-ng-flow_ve2"
  flow_shard_count      = 10
  flow_retention_period = 24
  url_name              = "eu1aws-analyzer-ng-url_ng"
  url_shard_count       = 8
  urlr_name             = "eu1aws-analyzer-ng-urlrating_ng"
  urlr_shard_count      = 2
  urlr_retention_period = 24
  url_retention_period  = 24

  ## Please dont change the below values since the application has hardcoded these stream values
  url_ng_name           = "url_ng"
  urlrating_ng_name     = "urlrating_ng"
  rt_ng_name            = "analyzer-ng-rt-stream" 

#-----------------------------------------------#
#  tags for AnalyzerNG Kinesis                  #
#-----------------------------------------------#
    Environment      = "Production"
    Name             = "eu1aws-analyzer-ng-stream"
    BU               = "NSM"
    #application      = "NSM"
    #tag_region       = "Frankfurt"
    application_type = "Analyzer-NG"

########################
## Dynamodb vales   ##
########################
db_tablename       = "ANGRealtimeMonitor"
billing_mode       = "PROVISIONED"
write_capacity     = 50
read_capacity      = 50
hash_key           = "dataype-serialnum"
attribute_type     = "S"
range_key          = "time"
range_attribute_type = "N"
tags_BU            = "NSM"
tags_Application   = "NSM"
#Applicationtype    = "Analyzer-NG"
tags_Region        = "Frankfurt"


alert_db_tablename       = "alerts"
alert_write_capacity     = 50
alert_read_capacity      = 50
alert_hash_key           = "serialnum_cat_subcat"


trafficstats_db_tablename       = "trafficstats"
trafficstats_write_capacity     = 5
trafficstats_read_capacity      = 5
trafficstats_hash_key           = "serialnum-type"

trafficstatsDebug_db_tablename  = "trafficstatsDebug"
trafficstatsDebug_hash_key      = "serialnum-type-id"

trafficalerts_db_tablename      = "trafficalerts"
trafficalerts_hash_key          = "serialcatsubcat"

alertconfig_db_tablename        = "alertconfiguration"
alertconfig_hash_key            = "serialcatsubcat"

serial_db_tablename             = "serial"
serial_hash_key                 = "subserial"

ANGRealtime_hash_key             = "datatype-serialnum"
ANGRealtime_attribute_type       = "S"
ANGRealtime_range_key            = "ts"
ANGRealtime_range_attribute_type = "N"

server_side_encryption_enabled  = "false"
point_in_time_recovery_enabled  = "fasle"
stream_enabled                     = "false"
ttl_enabled                        = "false"

####################################
## Variables for redshift Cluster ##
####################################

subnet_grp_enabled         = true
subgrp_name                = "redshift-analyzerng-subnet-group"
## Public subnets for NSM
subnet_ids                 = ["subnet-0bcff0bc99c3fb55d", "subnet-01e3ca4ab4443a814", "subnet-0ccba351216d1ff58"]
parameter_gname_enabled    = true
parameter_gname            = "redshift-analyzerng-parameter-group"
paramname                  = "max_concurrency_scaling_clusters"
paramvalue                 =  4
#name                       = "redshift-analyzerng-cluster"
database_name              = "analyzerng"
isencrypted                = false
master_password            = "redshift4AnGFraIsNowLive"
master_username            = "redshiftangfraadmin"
node_type                  = "ra3.4xlarge"
number_of_nodes            = "4"
enhancedvpc                = false
publicly_accessible        = true
#BU                         = "NSM"
#Application                = "NSM"
#Applicationtype            = "Analyzer-NG"
#tag_region                 = "Frankfurt"
tag_env                    = "Production"
securitygrp_ids            = ["sg-05ea932cc63eb6904"]
preferred_maintenance_window= "sat:10:00-sat:10:30"

#--------------------------------------------------------------------------#
# eks-collecter-NG variables
#--------------------------------------------------------------------------#

tcp_port     = 22
protocol     = "tcp"

#elb_num          = "1"
#internal_elb_num = "1"

subnet_tags      = "shared"

#vpc_id           = "vpc-0fbd2XXXXXXXXXXXXX88"

## Change the CIDR to match the environments
cidr_blocks_all_worker_groups = ["10.84.0.0/16", "10.50.18.0/24", "10.11.0.0/16", "10.21.0.0/16", "10.100.0.0/16", "10.206.34.0/24", "10.203.15.0/24", "10.108.0.0/16", "10.202.0.0/16", "10.113.0.0/16", "10.114.0.0/16"]

cluster_endpoint_private_access_cidrs = ["10.84.0.0/16", "10.50.18.0/24", "10.11.0.0/16", "10.21.0.0/16", "10.100.0.0/16", "10.206.34.0/24", "10.113.0.0/16", "10.203.15.0/24", "10.108.0.0/16", "10.202.0.0/16", "10.114.0.0/16"]

## Private subnets of the NSM R&A NSV's (LAN)
vpc_private_subnets = ["subnet-012e28f341285a86d","subnet-01c61495db36a80fd"]

cluster_name        = "eu1aws-collectorNG-eks-cluster"
cluster_version     = "1.16"

log_types             = ["api", "audit", "scheduler"]
log_retention_in_days = 7

nodegroup_name                 = "eu1aws-nsm-collectorNG-node-group"
instance_type_group_one        = "m5.xlarge"
asg_desired_capacity_group_one = 7
asg_max_size_group_one         = 10
asg_min_size_group_one         = 1

#Tags
#environment     = "Production"
#tag_region      = "Frankfurt"
applicationtype = "Analyzer-NG"
#bu              = "NSM"
#application     = "NSM"

ssh_key                = "XXXXXXXXXX"
map_accounts           = ["940XXXX9"]
map_roles = [
  {
    rolearn  = "arn:aws:iam::940XXXX9:role/role1"
    username = "role1"
    groups   = ["system:masters"]
  },
]
map_users = [
    {
      userarn  = "arn:aws:iam::940XXXX9:user/btkubendran"
      username = "btkubendran"
      groups   = ["system:masters"]
    },
    ]

####################
## Athena Values  ##
####################
## Statefile location of EMR component
#network_state_bucket = "snwl-production-terraform-state"
#network_state_key    = "production/Frankfurt/nsm-analyzerNG/emr/terraform.tfstate"
#network_state_region = "us-west-1"

#prefix                  = "eu1aws"
athena_bucket_acl       = "private" 
athena_bucket_key       = "athena-query-results/"
#block_public_acls       = true
#ignore_public_acls      = true
#block_public_policy     = true
#restrict_public_buckets = true 

athena_name             = "productionnsmfraflowlogs"
athena_workgroup_name   = "flowlogs-workgroup"
named_query             = "flowlogs table creation"
workgroup_force_destroy = true
#s3_output_location      = "s3://frankfurt-nsm-analyzerng-athena-output/athena-output/"
#cloudfront_log_location = "'s3://eu1aws-nsm-analyzerng-emr-logs/emr-logs/'"

##ec2################################################

 ## State file location of EMR to pull values
 emr_network_state_key        = "production/Frankfurt/nsm-analyzerNG/emr/terraform.tfstate"

#----------------------------------#
#Applies to all the production EC2 #
#----------------------------------#
#key_name               = "fra-keys"
#prefix                 = "eu1aws"
#az_one_id              = "subnet-012e28f341285a86d"
#security_group_ids     = ["sg-085e9c2c46863edfd"]
az_one_cidr            = "10.84.130.0/24"
enviroment_tag         = "production"
bu_tag                 = "NSM"
applicationName_tag    = "NSM"
region_tag             = "Frankfurt"
applicationtype_tag    = "Analyzer-NG"
##ami
ebs_optimized          = "false"
ami_termination_protection = "false"
ami_shutdown_behavior      = "stop"
ami_monitoring             = "false"
associate_public_ip_address = "false"
volume_type                 = "gp2"
volume_iops                 = 0
delete_volume_on_termination= "true"
ebs_volume_type             = "gp2"
ebs_iops                    = 0
#---------------------------------#
# production EMRClient1 variables #
#---------------------------------#
emr_client1_number = 1
emr_client1_ami = "ami-00a205cb8e06c3c4e"
emr_client1_ami_instance_type = "t2.xlarge"
emr_client1_volume_size = 100
number_of_ebs_emr_client1 = 1
ebs_volume_size_emr_client1 = 50
machineType_emr_client1       = "EMR Client"
#device name for EBS mapping see AWS Doc for full list
ebs_device_name_emr_client1 = ["/dev/sdf"]
#----------------------------------#
# production EMRClient2 variables  #
#----------------------------------#
emr_client2_number = 1
emr_client2_ami = "ami-00a205cb8e06c3c4e"
emr_client2_ami_instance_type = "t2.xlarge"
emr_client2_volume_size = 100
number_of_ebs_emr_client2 = 1
ebs_volume_size_emr_client2 = 100
machineType_emr_client2        = "EMR Client"
#device name for EBS mapping see AWS Doc for full list
ebs_device_name_emr_client2 = ["/dev/sdf"]
##
#delete_volume_on_termination = "true"
#ami_monitoring               = "false"
#ami_shutdown_behavior        = "stop"
#ami_termination_protection   = "false"
#associate_public_ip_address  = "false"
#ebs_iops                     = 0
#ebs_optimized                = "false"
#ebs_volume_type              = "gp2"
sd_check                     = "true"
#volume_iops                  = 0
#volume_type                  = "gp2"

#---------------------------------#
# lambda variables                #
#---------------------------------#
## State file location of Athena in Analyzer-NG
athena_network_state_key= "production/Frankfurt/nsm-analyzerNG/athena/terraform.tfstate"

## State file location of S3 in Analyzer-NG
s3_network_state_key= "production/Frankfurt/nsm-analyzerNG/s3/terraform.tfstate"

#---------------------------------#
# lambda variables                #
#---------------------------------#

#prefix                 = "eu1aws"
function_name          = "query-redshift-forwarder-func"
description            = "Redshift Forwarder Function for Query"
handler                = "lambda_function.lambda_handler"
runtime                = "python2.7"
memory_size            = 128
filename               = "query-redshift-forwarder-func-3.0.0-R0012-H0001.zip"
concurrency            = 10
lambda_timeout         = 300
log_retention          = 14
#tag_region             = "Frankfurt"
tag_environment        = "Production"
#application            = "NSM"
#bu                     = "NSM"
#Applicationtype        = "Analyzer-NG"
emr_logprocessor            = "eu1aws-analyzerng-logprocessor-emr-cluster"
emr_logparser               = "eu1aws-analyzerng-logparser-emr-cluster"
schedulejobs_filename       = "analyzerng-schedulejobs-lambda-3.0.0-R0012-H0003.zip"
logparser_runtime           = "python3.8"
logparser_filename          = "logparser-lambda-3.0.0-R0012-H0003.zip"
logparser_description       = "Delete DynamoDB tables. Create and run logParser EMR on EventBridge calls from s3-bucket-monitor and terminate-restart-emr-cluster lambdas"

logprocessor_filename       = "logprocessor-lambda-3.0.0-R0012-H0003.zip"
logprocessor_description    = "Delete DynamoDB tables. Create and run logProcessor EMR on EventBridge calls from s3-bucket-monitor and terminate-restart-emr-cluster lambdas"

realtimereport_filename     = "realtimereport-lambda-3.0.0-R0012-H0003.zip"
realtimereport_description  = "Create and run realTimeReport EMR on EventBridge calls from the realTimeReport-daily rule"

s3bucketmonitor_filename    = "s3-bucket-monitor-3.0.0-R0012-H0001.zip"
s3bucketmonitor_description = "Monitors the S3 bucket for new objects created. In case that fails thrice consecutively, terminates and restarts EMR. Invoked by EventBridge rules logparser-s3objectmonitoring and logprocessor-s3objectmonitoring every 25 minutes"

terminaterestartemr_filename    = "terminate-restart-emr-cluster-3.0.0-R0012-H0003.zip"
terminaterestartemr_description = "Terminates and creates a new EMR cluster, if it exceeds a certain period (currently 12 hours). Invoked every 6 hours via 2 EventBridge rules logprocessor-restart-daily and logparser-restart-daily"

deleteDynamodb_description  = "An AWS Serverless Specification template describing your function."
deleteDynamodb_filename     = "event-EventBridge-terminateEMR-deleteDynamodbTables-3.0.0-R0012-H0003.zip"

terminatemrdynamodb_description = "terminates the previously running EMR and deletes the tables then disables the rule that ran it."
terminatemrdynamodb_filename    = "terminateEMR-deleteDynamodbTables-Lambda-3.0.0-R0012-H0003.zip"

stepFunction_description      = "An AWS Serverless Specification template describing your function."
stepFunction_filename         = "eventBridge-stepFunction-cease.zip"

logProcessor_new_filename     = "logProcessor.zip"

logProcessorWeb_filename      = "logProcessorWeb.zip"

ANG-Setup_filename            = "setup_lambda.zip"

secret_names                  = "ANG-Secrets-Name"

ANG-ops_filename  = "DeleteValues_DynamoDB_KStreamState_LPB.zip"

ANG-lambda_update_filename    = "lambda_update.zip"

ANG-lambda_partitionprojection_filename   = "partitionProjectionLambda.zip"

ANG-lambda_WeeklyRedShiftCommands_filename = "WeeklyRedShiftCommands.zip"

ANG-lambda_MonitorDataEmail_filename = "MonitorDataEmail.zip"

ANG-lambda_ReadKinesisDataStream_filename = "ReadKinesisDataStream.zip"

ANG-lambda_ReadRedShiftData_filename = "ReadRedShiftData.zip"

#----------------------------------#
# Production nsv variables         #
#----------------------------------#

nsv_number = "1"
nsv_ami = "ami-0c2bf11bd07dfa9b2"
nsv_ami_instance_type = "c5.2xlarge"
nsv_volume_size = "60"
#key_name = "XXXXXX"
security_group_lb_ids = ["sg-02f417ad65729328d"]
az_one_public_id = "subnet-0bcff0bc99c3fb55d"
az_one_public_cidr = "10.84.30.0/24"
#---------------------------------------------------------------#
#NSv LAN Nic variable for the attach Nic on the 1st Production NSv #
#---------------------------------------------------------------#
nsv1_lan_ip = ["10.84.130.210"]
#prefix                 = "eu1aws"
#enviroment_tag         = "Production"
#bu_tag                 = "NSM"
#applicationName_tag    = "NSM"
#region_tag             = "Frankfurt"
machineType_tag        = "NSv"
#applicationtype_tag    = "Analyzer-NG"
#ami_termination_protection  = "false"
#ebs_optimized               = "false"
#ebs_volume_type             = "gp2"
ebs_device_name             = ["/dev/xvdb", "/dev/xvdc", "/dev/xvdd", "/dev/xvde", "/dev/xvdf", "/dev/xvdg", "/dev/xvdh", "/dev/xvdi", "/dev/xvdj", "/dev/xvdk", "/dev/xvdl", "/dev/xvdm", "/dev/xvdn", "/dev/xvdo", "/dev/xvdp", "/dev/xvdq", "/dev/xvdr", "/dev/xvds", "/dev/xvdt", "/dev/xvdu", "/dev/xvdv", "/dev/xvdw", "/dev/xvdx", "/dev/xvdy", "/dev/xvdz"]
#ami_monitoring              = "false"
#ami_shutdown_behavior       = "stop"
#associate_public_ip_address = "false"
#volume_type                 = "gp2"
ebs_volume_number           = 1
#volume_iops                 = 0
#delete_volume_on_termination= "true"
ebs_volume_size             = 10
#ebs_iops                    = 0

#----------------------------------#
# Glue-Crawler variables           #
#----------------------------------#
## State file location of EMR in Analyzer-NG
#emr_network_state_key= "production/XXXXXXXXXXXXXX/nsm-analyzerNG/emr/terraform.tfstate"

## State file location of Athena in Analyzer-NG
#athena_network_state_key= "production/XXXXXXXXXXXXXX/nsm-analyzerNG/athena/terraform.tfstate"

crawler_name           = "eu1aws-analyzer-ng-crawler"
crawler_name_url       = "eu1aws-analyzer-ng-crawler-url"
crawler_name_appsdata  = "eu1aws-analyzer-ng-crawler-appsdata"
crawler_name_coredata  = "eu1aws-analyzer-ng-crawler-coredata"
crawler_name_ifacedata = "eu1aws-analyzer-ng-crawler-ifacedata"
crawler_name_memdata   = "eu1aws-analyzer-ng-crawler-memdata"
crawler_name_reportdata   = "eu1aws-analyzer-ng-crawler-reportdata"
crawler_name_flowblocked   = "eu1aws-analyzer-ng-crawler-flowblocked"
crawler_name_flowthreat   = "eu1aws-analyzer-ng-crawler-flowthreat"
crawl_behaviour = "CRAWL_NEW_FOLDERS_ONLY"

