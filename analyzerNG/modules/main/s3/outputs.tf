output "bucketname" {
  value = module.s3_bucket_analyzerng_logs.bucketname
}

output "bucketname_static" {
  value = module.s3_bucket_analyzerng_static.bucketname
}

output "bucketname_jar" {
  value = module.s3_bucket_analyzerng_jar.bucketname
}

output "bucketdomainname" {
  value = [module.s3_bucket_analyzerng_logs.bucketdomainname,module.s3_bucket_analyzerng_static.bucketdomainname,module.s3_bucket_analyzerng_jar.bucketdomainname]
}


output "bucket_arn" {
  value = [module.s3_bucket_analyzerng_logs.arns,module.s3_bucket_analyzerng_static.arns,module.s3_bucket_analyzerng_jar.arns]
}


output "Bucket_region" {
  value = [module.s3_bucket_analyzerng_logs.regions,module.s3_bucket_analyzerng_static.regions,module.s3_bucket_analyzerng_jar.regions]
}


