/*#---------------------------------------------------------------#
#aws provider info                                              #
#---------------------------------------------------------------#
aws_access_key = ""

aws_secret_key = ""

#Region for the VPC
region = "us-west-1"


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
name                       = "redshift-analyzerng-cluster"
database_name              = "analyzerng"
isencrypted                = false
master_password            = "redshift4AnGFraIsNowLive"
master_username            = "redshiftangfraadmin"
node_type                  = "ra3.4xlarge"
number_of_nodes            = "4"
enhancedvpc                = false
publicly_accessible        = true
BU                         = "NSM"
Application                = "NSM"
Applicationtype            = "Analyzer-NG"
tag_region                 = "Frankfurt"
tag_env                    = "Production"
securitygrp_ids            = ["sg-05ea932cc63eb6904"]
preferred_maintenance_window= "sat:10:00-sat:10:30"
*/
