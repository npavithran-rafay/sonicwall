output "domain_name" {
  description = "The domain name corresponding to the distribution."
  value       = "${aws_cloudfront_distribution.elb_distribution.*.domain_name}"
}

output "status" {
  description = "The current status of the distribution."
  value       = "${aws_cloudfront_distribution.elb_distribution.*.status}"
}

output "id" {
  description = "The identifier for the distribution."
  value       = "${aws_cloudfront_distribution.elb_distribution.*.id}"
}

