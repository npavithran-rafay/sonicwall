
output "S3Bucket" {
  description = "The name of the S3 Bucket."
  value       = "${aws_s3_bucket.s3_bucket.id}"
}


