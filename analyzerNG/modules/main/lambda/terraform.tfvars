/*#---------------------------------------------------------------#
#aws provider info                                              #
#---------------------------------------------------------------#
aws_access_key = ""

aws_secret_key = ""

#Region for the VPC
#region = "eu-central-1"
region = "us-west-1"

network_state_bucket = "snwl-production-terraform-state"
network_state_key    = "production/Frankfurt/nsm-analyzerNG/redshift/terraform.tfstate"
#network_state_region = "us-west-2"
network_state_region         = "us-west-1"

## State file location of Athena in Analyzer-NG
athena_network_state_key= "production/Frankfurt/nsm-analyzerNG/athena/terraform.tfstate"

## State file location of S3 in Analyzer-NG
s3_network_state_key= "production/Frankfurt/nsm-analyzerNG/s3/terraform.tfstate"

#---------------------------------#
# lambda variables                #
#---------------------------------#

prefix_analyzer                 = "eu1aws"
function_name          = "query-redshift-forwarder-func"
description_analyzer            = "Redshift Forwarder Function for Query"
handler                = "lambda_function.lambda_handler"
runtime                = "python2.7"
memory_size            = 128
filename               = "query-redshift-forwarder-func-3.0.0-R0012-H0001.zip"
concurrency            = 10
lambda_timeout         = 300
log_retention          = 14
tag_region             = "Frankfurt"
tag_environment        = "Production"
application            = "NSM"
bu                     = "NSM"
Applicationtype        = "Analyzer-NG"
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

ANG-lambda_ReadRedShiftData_filename = "ReadRedShiftData.zip"*/

