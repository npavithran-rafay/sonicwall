
#-----------------------------------------------#
#save the state file to s3 bucket               #
#-----------------------------------------------#
/*terraform {
  # The configuration for this backend will be filled in by Terragrunt
  backend "s3" {}
}*/

#######################################################
## Create the S3 bucket for storing Analyzer-NG logs ##
#######################################################

module "s3_bucket_analyzerng_logs" {
  source                    = "../../../modules/infrastructure/s3_tf13"
  bucketname                = "${var.prefix_analyzer}-analyzerng-log-bucket" 
  acl                       = var.acl
  versioning                = var.versioning
  region                    = var.s3_region
  lifecycle_rule = [
    {
      id      = var.lifecycle_name_analyzer
      enabled = var.lifecycle_enabled
      expiration = {
        days = var.analyzerng_logs_lifecycle_expiration_days
      }
    },
    {
      id      = var.lifecycle_name_1
      enabled = var.lifecycle_enabled
      prefix  = "flowblocked/"
      expiration = {
        days = var.flow_lifecycle_expiration_days
      }
    },
    {
      id      = var.lifecycle_name_2
      enabled = var.lifecycle_enabled
      prefix  = "reportdata/"
      expiration = {
        days = var.flow_lifecycle_expiration_days
      }
    },
    {
      id      = var.lifecycle_name_3
      enabled = var.lifecycle_enabled
      prefix  = "flowdata/"
      expiration = {
        days = var.flow_lifecycle_expiration_days
      }
    },
    {
      id      = var.lifecycle_name_4
      enabled = var.lifecycle_enabled
      prefix  = "flowthreat/"
      expiration = {
        days = var.flow_lifecycle_expiration_days
      }
    },
    {
      id      = var.lifecycle_name_5
      enabled = var.lifecycle_enabled
      prefix  = "flowurl/"
      expiration = {
        days = var.flow_lifecycle_expiration_days
      }
    },
        {
      id      = var.lifecycle_name_6
      enabled = var.lifecycle_enabled
      prefix  = "flowbytime/"
      expiration = {
        days = var.flow_lifecycle_expiration_days
      }
    },
  ]
  Application               = var.Application
  Applicationtype           = var.Applicationtype
  bu                        = var.bu
  tagenv                    = var.tagenv
  tagregion                 = var.tagregion
  block_public_acls         = var.block_public_acls
  ignore_public_acls        = var.ignore_public_acls
  block_public_policy       = var.block_public_policy
  restrict_public_buckets   = var.restrict_public_buckets
  create_folder             = var.create_folder
  S3_key                    = var.S3_key
  prevent_destroy           = var.prevent_destroy
  force_destroy             = var.force_destroy
  server_side_encryption_configuration = var.server_side_encryption_configuration
}


module "s3_bucket_analyzerng_static" {
  source                    = "../../../modules/infrastructure/s3_tf13"
  bucketname                = "${var.prefix_analyzer}-analyzerng-static-bucket-test"
  acl                       = var.acl
  versioning                = var.versioning
  region                    = var.s3_region
#  lifecycle_rule = [
#    {
#      id      = var.lifecycle_name
#      enabled = false
#      expiration = {
#        days = var.lifecycle_expiration_days
#      }
#    },
#  ]
  Application               = var.Application
  Applicationtype           = var.Applicationtype
  bu                        = var.bu
  tagenv                    = var.tagenv
  tagregion                 = var.tagregion
  block_public_acls         = var.block_public_acls
  ignore_public_acls        = var.ignore_public_acls
  block_public_policy       = var.block_public_policy
  restrict_public_buckets   = var.restrict_public_buckets
  create_folder             = false
  S3_key                    = var.S3_key
  prevent_destroy           = var.prevent_destroy
  lifecycle_rule            = var.lifecycle_rule
  server_side_encryption_configuration = var.server_side_encryption_configuration
  force_destroy             = var.force_destroy
}

module "s3_bucket_analyzerng_jar" {
  source                    = "../../../modules/infrastructure/s3_tf13"
  bucketname                = "${var.prefix_analyzer}-analyzerng-jar-bucket-test"
  acl                       = var.acl
  versioning                = true
  region                    = var.s3_region
  Application               = var.Application
  Applicationtype           = var.Applicationtype
  bu                        = var.bu
  tagenv                    = var.tagenv
  tagregion                 = var.tagregion
  block_public_acls         = var.block_public_acls
  ignore_public_acls        = var.ignore_public_acls
  block_public_policy       = var.block_public_policy
  restrict_public_buckets   = var.restrict_public_buckets
  create_folder             = false
  S3_key                    = var.S3_key
  prevent_destroy           = var.prevent_destroy
  lifecycle_rule            = var.lifecycle_rule
  server_side_encryption_configuration = var.server_side_encryption_configuration
  force_destroy             = var.force_destroy

}


