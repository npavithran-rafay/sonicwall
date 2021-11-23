
####################################
#aws info
###################################
variable "aws_access_key" {}

variable "aws_secret_key" {}

variable "region" {
  description = "Region for the VPC"
  #default     = ""
}

###########################
## Cloud front variables ##
###########################

variable "comment" {
  type        = "string"
  #default     = "terraform created"
  description = "some comment"
}

variable "root_object" {
  type        = "string"
  #default     = "terraform created"
  description = "root object"
}

variable "aliases" {
  type        = "list"
  #default     = [""]
  description = "Extra CNAMEs (alternate domain names), if any, for this distribution"
}

variable "domain_name" {
  type        = "string"
  #default     = ""
  description = "The DNS domain name of either the S3 bucket, or web site of your custom origin."
}

variable "origin_id" {
  type        = "string"
  #default     = ""
  description = "A unique identifier for the origin."
}

variable "origin_protocol_policy" {
  type        = "string"
  #default     = "match-viewer"
  description = "The origin protocol policy to apply to your origin. One of http-only, https-only, or match-viewer."
}

variable "ssl_protocols" {
  type        = "list"
  #default     = ["TLSv1"]
  description = "The SSL/TLS protocols that you want CloudFront to use when communicating with your origin over HTTPS. A list of one or more of SSLv3, TLSv1, TLSv1.1, and TLSv1.2."
}

variable "bucket_domain_name" {
  type        = "string"
  #default     = ""
  description = "The Amazon S3 bucket to store the access logs in"
}

variable "bucket_name" {
  type        = "string"
  #default     = ""
  description = "The Amazon S3 bucket to store the access logs in"
}

variable "prefix" {
  type        = "string"
  # #default     = ""
  description = "An optional string that you want CloudFront to prefix to the access log filenames for this distribution"
}

variable "cert_arn" {
  type        = "string"
  #default     = ""
  description = "The ARN of the AWS Certificate Manager certificate that you wish to use with this distribution. Specify this, cloudfront_default_certificate, or iam_certificate_id. The ACM certificate must be in US-EAST-1."
}

variable "ssl_support_method" {
  type        = "string"
  #default     = "sni-only"
  description = "Specifies how you want CloudFront to serve HTTPS requests. One of vip or sni-only."
}

variable "min_protocol_version" {
  type        = "string"
  #default     = "TLSv1.2_2018"
  description = "The minimum version of the SSL protocol that you want CloudFront to use for HTTPS connections."
}

variable "default_cert" {
  #default     = false
  description = "if you want viewers to use HTTPS to request your objects and you're using the CloudFront domain name for your distribution."
}

variable "allowed_methods" {
  type        = "list"
  #default     = [""]
  description = "Controls which HTTP methods CloudFront processes and forwards to your Amazon S3 bucket or your custom origin."
}

variable "cached_methods" {
  type        = "list"
  #default     = [""]
  description = "Controls whether CloudFront caches the response to requests using the specified HTTP methods."
}

variable "target_origin_id" {
  type        = "string"
  #default     = ""
  description = "This should be same as origin ID"
}

variable "forward" {
  type        = "string"
  #default     = "all"
  description = "Specifies whether you want CloudFront to forward cookies to the origin that is associated with this cache behavior. You can specify all, none or whitelist. If whitelist, you must include the subsequent whitelisted_names"
}

variable "restriction_type" {
  type        = "string"
  #default     = "none"
  description = "The method that you want to use to restrict distribution of your content by country: none, whitelist, or blacklist."
}

variable "BU" {
  type        = "string"
  #default     = "Terraform created"
  description = "Bussiness Unit"
}

variable "env" {
  type        = "string"
  #default     = "Terraform Created"
  description = "Environment"
}

variable "enabled" {}
variable "ipv6enabled" {}
variable "s3_bucket_create" {}
variable "lifecycle_name" {}
variable "lifecycle_days" {}
variable "lifecycle_enabled" {}
variable "log_include_cookies" {}
variable "compress" {}
variable "query_string" {}

