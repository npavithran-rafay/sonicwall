output "vpc_id" {
  value = module.NSM.vpc_id
}
output "emr_bucketid" {
   value = module.analyzerNG.emr_bucketid
}

output "s3_bucketname" {
  value = module.analyzerNG.s3_bucketname
}

output "emr2_emr2bucketid" {
 value = module.analyzerNG.emr2_emr2bucketid
}

output "ath_Athena_database" {
 value = module.analyzerNG.ath_Athena_database
  
}

output "ath_S3bucketname" {
  value = module.analyzerNG.ath_S3bucketname
}


output "rs_redshift_cluster_endpoint" {
   value = module.analyzerNG.rs_redshift_cluster_endpoint
}

output "rs_redshift_cluster_database_name" {
 value = module.analyzerNG.rs_redshift_cluster_database_name
}

output "rs_redshift_cluster_port" {
 value = module.analyzerNG.rs_redshift_cluster_port   
}

output "rs_redshift_username" {
  value = module.analyzerNG.NG_redshift_username
}
output "rs_redshift_password" {
  value = module.analyzerNG.NG_redshift_password
}


