#----------------------------------#
#Store the state file in S3 Bucket #
#----------------------------------#
# terraform {
#   # The configuration for this backend will be filled in by Terragrunt
#   backend "s3" {}
# }

#############################
## Coudfront distribution  ##
#############################

module "elb_distribution" {
  source                         = "../../../../modules/infrastructure/cloudfront"
  enabled                        = "${var.enabled}"
  ipv6enabled                    = "${var.ipv6enabled}"
  comment                        = "${var.comment}"
  root_object                    = "${var.root_object}"
  domain_name                    = "${var.domain_name}"
  origin_id                      = "${var.origin_id}"
  origin_protocol_policy         = "${var.origin_protocol_policy}"
  ssl_protocols                  = "${var.ssl_protocols}"
  s3_bucket_create               = "${var.s3_bucket_create}"
  lifecycle_name                 = "${var.lifecycle_name}"
  lifecycle_days                 = "${var.lifecycle_days}"
  lifecycle_enabled              = "${var.lifecycle_enabled}"
  log_include_cookies            = "${var.log_include_cookies}"
  bucket_domain_name             = "${var.bucket_domain_name}"
  bucket_name                    = "${var.bucket_name}"
  prefix                         = "${var.prefix}"
  aliases                        = "${var.aliases}"
  cert_arn                       = "${var.cert_arn}"
  ssl_support_method             = "${var.ssl_support_method}"
  min_protocol_version           = "${var.min_protocol_version}"
  default_cert                   = "${var.default_cert}"
  allowed_methods                = "${var.allowed_methods}"
  cached_methods                 = "${var.cached_methods}"
  target_origin_id               = "${var.target_origin_id}"
  compress                       = "${var.compress}"
  query_string                   = "${var.query_string}"
  forward                        = "${var.forward}"
  env                            = "${var.env}"
  BU                             = "${var.BU}"
  restriction_type               = "${var.restriction_type}"
}


