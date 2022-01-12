/*#---------------------------------------------------------------#
#aws provider info                                              #
#---------------------------------------------------------------#
aws_access_key = ""

aws_secret_key = ""

#----------------------------------------------#
#Region for the VPC			       #
#----------------------------------------------#
#region = "eu-central-1"
region = "us-west-1"
#-----------------------------------------------#
# Kinesis Stream for Analyzer ng                #
#-----------------------------------------------#

  name_analyzer                  = "eu1aws-analyzer-ng-stream"
  shard_count           = 32
  retention_period      = "24"
#  flow_name             = "eu1aws-analyzer-ng-flow_ve2"
#  flow_shard_count      = 10
#  flow_retention_period = 24
#  url_name              = "eu1aws-analyzer-ng-url_ng"
  url_shard_count       = 8
  url_retention_period  = 24
#  urlr_name             = "eu1aws-analyzer-ng-urlrating_ng"
   urlr_shard_count      = 2
   urlr_retention_period = 24

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
    application      = "NSM"
    tag_region       = "Frankfurt"
    application_type = "Analyzer-NG"*/
  
