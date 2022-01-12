output "S3bucketname" {
  value = aws_s3_bucket.athena_output.id
}

output "S3bucketregion" {
  value = aws_s3_bucket.athena_output.region
}

output "Athena_database" {
  value = module.athena_cloudfront.database
}

output "Athena_workgroup_arn" {
  value = module.athena_cloudfront.workgrouparns
}
