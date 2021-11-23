

########################################
## AWS S3 bucket for cloudfront logs  ##
########################################

resource "aws_s3_bucket" "s3_bucket" {
  count         = "${var.s3_bucket_create ? 1 : 0}"
  bucket        = "${var.bucket_name}"
  //Access Connect List
  force_destroy = true
  lifecycle {
     prevent_destroy = false
  }
  lifecycle_rule {
     id      = "${var.lifecycle_name}"
     enabled = "${var.lifecycle_enabled}"
     expiration {
        days = "${var.lifecycle_days}"
     }
  }
}

resource "aws_s3_bucket_public_access_block" "public_access_block" {
  count                   = "${var.s3_bucket_create ? 1 : 0}"
  bucket                  = "${aws_s3_bucket.s3_bucket.id}"
  block_public_acls       = true
  ignore_public_acls      = true
  block_public_policy     = true
  restrict_public_buckets = true
}

#####################################
## AWS S3 folder creation step     ##
#####################################

resource "aws_s3_bucket_object" "cloudfront-logs" {
    count       = "${var.s3_bucket_create ? 1 : 0}"
    depends_on  = ["aws_s3_bucket.s3_bucket"]
    bucket      = "${var.bucket_name}"
    key         = "${var.prefix}"
}



resource "aws_cloudfront_distribution" "elb_distribution" {
  depends_on          = ["aws_s3_bucket.s3_bucket"]
  enabled             = "${var.enabled}"
  is_ipv6_enabled     = "${var.ipv6enabled}"
  comment             = "${var.comment}"
  default_root_object = "${var.root_object}"
  aliases             = ["${var.aliases}"]
  origin {
    domain_name = "${var.domain_name}"
    origin_id   = "${var.origin_id}"
    custom_origin_config {
      http_port                = "${var.http_port}"
      https_port               = "${var.https_port}"
      origin_protocol_policy   = "${var.origin_protocol_policy}"
      origin_ssl_protocols     = ["${var.ssl_protocols}"]
      origin_keepalive_timeout = "${var.keepalive_timeout}"
      origin_read_timeout      = "${var.read_timeout}"
    }
  }
  logging_config = {
    include_cookies = "${var.log_include_cookies}"
    bucket          = "${var.bucket_domain_name}"
    prefix          = "${var.prefix}"
  }  
  viewer_certificate {
    acm_certificate_arn            = "${var.cert_arn}"
    ssl_support_method             = "${var.ssl_support_method}"
    minimum_protocol_version       = "${var.min_protocol_version}"
    cloudfront_default_certificate = "${var.default_cert}"
  }
  default_cache_behavior {
    allowed_methods  = ["${var.allowed_methods}"]
    cached_methods   = ["${var.cached_methods}"]
    target_origin_id = "${var.target_origin_id}"   ### target ID should be same as origin_id ###
    compress         = "${var.compress}"
    forwarded_values {
      headers      = "${var.headers}"
      query_string = "${var.query_string}"
      cookies {
        forward = "${var.forward}"
      }
    }
    viewer_protocol_policy = "${var.viewer_protocol_policy}"
    default_ttl            = "${var.default_ttl}"
    min_ttl                = "${var.minttl}"
    max_ttl                = "${var.maxttl}"
  }
  restrictions {
    geo_restriction {
      restriction_type = "${var.restriction_type}"
    }
  }
  tags = {
     BU          = "${var.BU}"
     Environment = "${var.env}"
  }
}

