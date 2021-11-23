output "bucketname" {
    value	 = "${aws_s3_bucket.default.*.id}"
}

output "arns" {
  value       	= "${aws_s3_bucket.default.*.arn}"
}

output "regions" {
  value        = "${aws_s3_bucket.default.*.region}"
}
