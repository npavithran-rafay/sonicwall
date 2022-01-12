
#-----------------------------------------------#
#save the state file to s3 bucket               #
#-----------------------------------------------#
/*terraform {
  # The configuration for this backend will be filled in by Terragrunt
  backend "s3" {}
}*/

#-----------------------------------------------#
# Kinesis Stream for Analyzer ng		#
#-----------------------------------------------#

resource "aws_kinesis_stream" "analyzerng_stream" {
  name             = var.name_analyzer
  shard_count      = var.shard_count
  retention_period = var.retention_period
  tags = {
    Environment = var.Environment
    Name	= var.name_analyzer
    BU          = var.BU
    application = var.application
    Applicationtype = var.application_type
    tag_region  = var.tag_region
  }
}

/*
resource "aws_kinesis_stream" "analyzerng_flow_stream" {
  name             = var.flow_name
  shard_count      = var.flow_shard_count
  retention_period = var.flow_retention_period
  tags = {
    Environment = var.Environment
    Name        = var.flow_name
    BU          = var.BU
    application = var.application
    Region  = var.tag_region
    Applicationtype = var.application_type
    Deploymenttype  = "Terraform"
  }
}

resource "aws_kinesis_stream" "analyzerng_url_stream" {
  name             = var.url_name
  shard_count      = var.url_shard_count
  retention_period = var.url_retention_period
  tags = {
    Environment = var.Environment
    Name        = var.url_name
    BU          = var.BU
    application = var.application
    Region  = var.tag_region
    Applicationtype = var.application_type
    Deploymenttype  = "Terraform"
  }
}

resource "aws_kinesis_stream" "analyzerng_urlrating_stream" {
  name             = var.urlr_name
  shard_count      = var.urlr_shard_count
  retention_period = var.urlr_retention_period
  tags = {
    Environment = var.Environment
    Name        = var.urlr_name
    BU          = var.BU
    application = var.application
    Region  = var.tag_region
    Applicationtype = var.application_type
    Deploymenttype  = "Terraform"
  }
} */

resource "aws_kinesis_stream" "analyzerng_stream_url_ng" {
  name             = var.url_ng_name
  shard_count      = var.url_shard_count
  retention_period = var.retention_period
  tags = {
    Environment = var.Environment
    Name        = var.url_ng_name
    BU          = var.BU
    application = var.application
    Applicationtype = var.application_type
    tag_region  = var.tag_region
  }
}

resource "aws_kinesis_stream" "analyzerng_stream_urlrating" {
  name             = var.urlrating_ng_name
  shard_count      = var.url_shard_count
  retention_period = var.retention_period
  tags = {
    Environment = var.Environment
    Name        = var.urlrating_ng_name
    BU          = var.BU
    application = var.application
    Applicationtype = var.application_type
    tag_region  = var.tag_region
  }
}

resource "aws_kinesis_stream" "analyzerng_rt_stream" {
  name             = var.rt_ng_name
  shard_count      = var.url_shard_count
  retention_period = var.retention_period
  tags = {
    Environment = var.Environment
    Name        = var.rt_ng_name
    BU          = var.BU
    application = var.application
    Applicationtype = var.application_type
    tag_region  = var.tag_region
  }
}

