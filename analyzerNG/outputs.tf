output "emr_bucketid" {
   value = module.emr.bucketid
}
output "s3_bucketname" {
  value = module.s3.bucketname 
}
output "emr2_emr2bucketid" {
 value = module.emr.emr2bucketid 
}
output "ath_Athena_database" {
  value = module.athena.Athena_database
}
output "ath_S3bucketname" {
  value = module.athena.S3bucketname 
}
output "rs_redshift_cluster_endpoint" {
  value = module.redshift.redshift_cluster_endpoint
}
output "rs_redshift_cluster_database_name" {
 value = module.redshift.redshift_cluster_database_name
}
output "rs_redshift_cluster_port" {
 value = module.redshift.redshift_cluster_port
}
output "NG_redshift_username" {
  value = module.redshift.redshift_username
}
output "NG_redshift_password" {
  value = module.redshift.redshift_password   
}
output "NG_eks_cluster_endpoint" {
  value = module.eks-collector-NG.eks_cluster_endpoint
}
output "NG_certificate_authority" {
  value = module.eks-collector-NG.certificate_authority
}
#output "NG_token" {
 # value = module.eks-collector-NG.token
#}