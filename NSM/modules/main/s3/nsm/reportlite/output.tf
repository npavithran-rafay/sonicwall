
output "S3Bucket_reportlite" {
  description = "The name of the S3 Bucket."
  value       = "${aws_s3_bucket.s3_bucket.id}"
}


