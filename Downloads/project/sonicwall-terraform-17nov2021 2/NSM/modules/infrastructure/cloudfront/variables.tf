
variable "enabled" {
  default     = true
  description = "enable the cloudfront."
}

variable "ipv6enabled" {
  default     = false
  description = "enable the ipv6."
}

variable "s3_bucket_create" {
  default     = false
  description = "true for creating S3 bucket for logging."
}

variable "lifecycle_name" {
  type        = "string"
  default     = "terraform created"
  description = "lifecycle rule name"
}

variable "lifecycle_days" {
  type        = "string"
  default     = "30"
  description = "number of days for lifecyle"
}

variable "lifecycle_enabled" {
  default     = true
  description = "true for enabling lifecycle in S3."
}

variable "comment" {
  type        = "string"
  default     = "terraform created"
  description = "some comment"
}

variable "root_object" {
  type        = "string"
  default     = "terraform created"
  description = "root object"
}

variable "aliases" {
  type        = "list"
  default     = [""]
  description = "Extra CNAMEs (alternate domain names), if any, for this distribution"
}

variable "domain_name" {
  type        = "string"
  default     = ""
  description = "The DNS domain name of either the S3 bucket, or web site of your custom origin."
}

variable "origin_id" {
  type        = "string"
  default     = ""
  description = "A unique identifier for the origin."
}

variable "http_port" {
  default     = 80
  description = "The HTTP port the custom origin listens on."
}

variable "https_port" {
  default     = 443
  description = "The HTTPS port the custom origin listens on."
}

variable "origin_protocol_policy" {
  type        = "string"
  default     = "match-viewer"
  description = "The origin protocol policy to apply to your origin. One of http-only, https-only, or match-viewer."
}

variable "ssl_protocols" {
  type        = "list"
  default     = ["TLSv1"]
  description = "The SSL/TLS protocols that you want CloudFront to use when communicating with your origin over HTTPS. A list of one or more of SSLv3, TLSv1, TLSv1.1, and TLSv1.2."
}

variable "keepalive_timeout" {
  type        = "string"
  default     = "10"
  description = "The Custom KeepAlive timeout, in seconds. By default, AWS enforces a limit of 60. But you can request an increase."
}

variable "read_timeout" {
  type        = "string"
  default     = "60"
  description = "The Custom Read timeout, in seconds. By default, AWS enforces a limit of 60. But you can request an increase."
}

variable "log_include_cookies" {
  default     = false
  description = "Specifies whether you want CloudFront to include cookies in access logs"
}

variable "bucket_domain_name" {
  type        = "string"
  default     = ""
  description = "The Amazon S3 bucket to store the access logs in"
}

variable "log_prefix" {
  type        = "string"
  default     = ""
  description = "An optional string that you want CloudFront to prefix to the access log filenames for this distribution"
}

variable "bucket_name" {
  type        = "string"
  default     = ""
  description = "The Amazon S3 bucket to store the access logs in"
}

variable "prefix" {
  type        = "string"
  # default     = ""
  description = "An optional string that you want CloudFront to prefix to the access log filenames for this distribution"
}


variable "cert_arn" {
  type        = "string"
  default     = ""
  description = "The ARN of the AWS Certificate Manager certificate that you wish to use with this distribution. Specify this, cloudfront_default_certificate, or iam_certificate_id. The ACM certificate must be in US-EAST-1."
}

variable "ssl_support_method" {
  type        = "string"
  default     = "sni-only"
  description = "Specifies how you want CloudFront to serve HTTPS requests. One of vip or sni-only."
}

variable "min_protocol_version" {
  type        = "string"
  default     = "TLSv1.2_2018"
  description = "The minimum version of the SSL protocol that you want CloudFront to use for HTTPS connections."
}

variable "default_cert" {
  default     = false
  description = "if you want viewers to use HTTPS to request your objects and you're using the CloudFront domain name for your distribution."
}

variable "allowed_methods" {
  type        = "list"
  default     = [""]
  description = "Controls which HTTP methods CloudFront processes and forwards to your Amazon S3 bucket or your custom origin."
}

variable "cached_methods" {
  type        = "list"
  default     = [""]
  description = "Controls whether CloudFront caches the response to requests using the specified HTTP methods."
}

variable "headers" {
  type        = "list"
  default     = ["*"]
  description = "Specifies the Headers, if any, that you want CloudFront to vary upon for this cache behavior."
}


variable "target_origin_id" {
  type        = "string"
  default     = ""
  description = "This should be same as origin ID"
}

variable "compress" {
  default     = false
  description = "Whether you want CloudFront to automatically compress content for web requests that include Accept-Encoding: gzip in the request header "
}

variable "query_string" {
  default     = true
  description = "Indicates whether you want CloudFront to forward query strings to the origin that is associated with this cache behavior."
}

variable "forward" {
  type        = "string"
  default     = "all"
  description = "Specifies whether you want CloudFront to forward cookies to the origin that is associated with this cache behavior. You can specify all, none or whitelist. If whitelist, you must include the subsequent whitelisted_names"
}

variable "viewer_protocol_policy" {
  default     = "redirect-to-https"
  description = "One of allow-all, https-only, or redirect-to-https"
}

variable "default_ttl" {
  type        = "string"
  default     = "3600"
  description = "The default amount of time (in seconds) that an object is in a CloudFront cache before CloudFront forwards another request in the absence of an Cache-Control max-age or Expires header."
}

variable "minttl" {
  type        = "string"
  default     = "0"
  description = "he minimum amount of time that you want objects to stay in CloudFront caches before CloudFront queries your origin to see whether the object has been updated."
}

variable "maxttl" {
  type        = "string"
  default     = "86400"
  description = "The maximum amount of time (in seconds) that an object is in a CloudFront cache before CloudFront forwards another request to your origin"
}

variable "restriction_type" {
  type        = "string"
  default     = "none"
  description = "The method that you want to use to restrict distribution of your content by country: none, whitelist, or blacklist."
}

variable "BU" {
  type        = "string"
  default     = "Terraform created"
  description = "Bussiness Unit"
}

variable "env" {
  type        = "string"
  default     = "Terraform Created"
  description = "Environment"
}
