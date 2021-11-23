/*#---------------------------------------------------------------#
#aws provider info                                              #
#---------------------------------------------------------------#
aws_access_key = ""

aws_secret_key = ""

#Region for the VPC
#region = "eu-central-1"
 region = "us-west-1"

######################
## S3 bucket values ##
######################

  prefix                    = "eu1aws"
  acl                       = "private"
  lifecycle_name            = "analyzerng-s3-lifecycle"
  versioning                = false
  lifecycle_enabled         = true
  s3_region                 = "us-west-1"
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
*/