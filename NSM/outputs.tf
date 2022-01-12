output "vpc_id" {
  value = module.vpc.vpc_id
}

output "redshift_public_subnet_ids" {
  value = ["${module.vpc.redshift_public_subnet_ids}"]
}

output "mariadB_private_subnet_ids" {
  value = ["${module.vpc.mariadB_private_subnet_ids}"]
}

output "elasticsearch_private_subnet_ids" {
  value = ["${module.vpc.elasticsearch_private_subnet_ids}"]
}

output "linux_default_security_group_id" {
  value = ["${module.vpc.linux_default_security_group_id}"]
}
output "ES_Endpoint" {
  value = module.elasticsearch_domain.ES_Endpoint
}
output "db_endpoint" {
  value = flatten(module.mariadB.db_endpoint)
}
output "elasticache_primary_endpoint_address" {
  value = flatten(module.elasticache.primary_endpoint_address)
}
output "redshift_endpoint" {
  value = flatten(module.redshift.endpoint)
}
output "S3Bucket_reportlite" {
  value = module.s3.S3Bucket_reportlite
}