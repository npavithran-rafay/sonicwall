/*#---------------------------------------------------------------#
#aws provider info                                              #
#---------------------------------------------------------------#
aws_access_key = ""

aws_secret_key = ""

#Region for the VPC
#region = "eu-central-1"
region  = "us-west-1"
## Statefile location of EMR component
network_state_bucket = "snwl-production-terraform-state"
network_state_key    = "production/Frankfurt/nsm-analyzerNG/emr/terraform.tfstate"
#network_state_region = "us-west-2"
network_state_region = "us-west-1"


###############
## S3 Values ##
###############

prefix                  = "eu1aws"
athena_bucket_acl       = "private" 
athena_bucket_key       = "athena-query-results/"
block_public_acls       = true
ignore_public_acls      = true
block_public_policy     = true
restrict_public_buckets = true 

####################
## Athena Values  ##
####################

athena_name             = "productionnsmfraflowlogs"
athena_workgroup_name   = "flowlogs-workgroup"
named_query             = "flowlogs table creation"
workgroup_force_destroy = true
#s3_output_location      = "s3://frankfurt-nsm-analyzerng-athena-output/athena-output/"
#cloudfront_log_location = "'s3://eu1aws-nsm-analyzerng-emr-logs/emr-logs/'"*/
