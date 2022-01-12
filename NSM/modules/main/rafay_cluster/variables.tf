variable "region" {}
variable "rest_endpoint" {}
variable "ops_endpoint" {}
variable "api_key" {}
variable "api_secret" {}
variable "project_name" {}
variable "cluster_name" {}
variable "blueprint" {}
variable "blueprintversion" {}
variable "NSM_ES_Endpoint" {
    type = any
}
variable "NSM_db_endpoint" {
    type = any
}
variable "NSM_elasticache_primary_endpoint_address" {
    type = any
}
variable "NSM_redshift_endpoint" {
    type = any
}
variable "NSM_S3Bucket_reportlite" {
    type = any
}
variable "analyzerNG_rs_redshift_cluster_endpoint" {
    type = any
}