output "bucketid" {
  value = aws_s3_bucket.s3_bucket_for_emr_logs.id
}

output "emr2bucketid" {
  value = aws_s3_bucket.s3_bucket_for_emr2_logs.id
}

output "bucketarn" {
  value = [aws_s3_bucket.s3_bucket_for_emr_logs.arn,aws_s3_bucket.s3_bucket_for_emr2_logs.arn]
}

output "bucket_domain_name" {
  value = [aws_s3_bucket.s3_bucket_for_emr_logs.bucket_domain_name,aws_s3_bucket.s3_bucket_for_emr2_logs.bucket_domain_name]
}

output "bucket_regional_domain_name" {
  value = [aws_s3_bucket.s3_bucket_for_emr_logs.bucket_regional_domain_name,aws_s3_bucket.s3_bucket_for_emr2_logs.bucket_regional_domain_name]
}

output "EMR_arn" {
  value = [aws_emr_cluster.default.arn,aws_emr_cluster.Logparser.arn]
}

output "EMR_id" {
  value = [aws_emr_cluster.default.id,aws_emr_cluster.Logparser.id]
}

output "EMR_name_processor" {
   value = aws_emr_cluster.default.name
 }

 output "EMR_name_logparser" {
   value = aws_emr_cluster.Logparser.name
 }

output "EMR_release_label" {
  value = [aws_emr_cluster.default.release_label,aws_emr_cluster.Logparser.release_label]
}

output "EMR_master_public_dns" {
  value = [aws_emr_cluster.default.master_public_dns,aws_emr_cluster.Logparser.master_public_dns]
}

output "EMR_log_uri" {
  value = [aws_emr_cluster.default.log_uri,aws_emr_cluster.Logparser.log_uri]
}

output "EMR_applications" {
  value = [aws_emr_cluster.default.applications,aws_emr_cluster.Logparser.applications]
}

output "EMR_master_sg" {
  value = aws_security_group.emr_master.id
}

output "EMR_slave_sg" {
  value = aws_security_group.emr_slave.id
}
