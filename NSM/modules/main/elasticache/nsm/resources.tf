#-----------------------------------------------#
#save the state file to s3 bucket               #
#-----------------------------------------------#
# terraform {
#   # The configuration for this backend will be filled in by Terragrunt
#   backend "s3" {}
# }


#----------------------------------------------------------------#
#Create a Elasticache redis with cluster mode off for CSC-MA 1.9 #
#----------------------------------------------------------------#

module "elasticache_redis_cluster" {
  source                      = "../../../../modules/infrastructure/elasticache"
  engine_name                 = "${var.eng_name}"
  num_cache_clusters          = "${var.numcache}"
  node_type                   = "${var.nodetype}"
  parameter_gname             = "${var.par_name}"
  parameter_gname_cluster_enabled = "${var.par_name_cluster_mode_enabled}" 
  replication_enabled         = "${var.replication_enabled}"
  repl_grp_id                 = "${var.repl_grp}"
  engine_ver                  = "${var.eng_ver}"
  port                        = "${var.port}"
  maintenance_window          = "${var.maintenance_win}"
  snapshot_window             = "${var.snap_win}"
  snapshot_retention_limit    = "${var.snap_reten_limit}"
  automatic_failover_enabled  = "${var.automatic_failover}"
  apply_immediately           = "${var.apply_immediately}"
  description                 = "${var.description}"
  subnet_group_name           = "${var.sn_grp_name}"
  sg_ids                      = ["${var.sg_ids}"]
  ec_az                       = [""]

## TAGS ##
  name_tag                    = "${var.name_tag}"
  enviroment_tag              = "${var.enviroment_tag}"
  bu_tag                      = "${var.bu_tag}"

## Subnet group ##
  sub_grp_name                = "${var.sn_grp_name}"
  subnet_ids                  = var.sn_ids
  sub_grp_description         = "${var.sn_grp_desc}"

  num_node_group          = "${var.num_node_group}"
  auth_token              = "${var.auth_token}"
  num_cache_nodes         = "${var.num_cache_nodes}"
  kms_key_id              = "${var.kms_key_id}"
  snapshot_arns           = "${var.snapshot_arns}"
  at_rest_encryption_enabled="${var.at_rest_encryption_enabled}"
  replicas_per_node       = "${var.replicas_per_node}"
  cluster_replication_enabled = "${var.cluster_replication_enabled}"
  auto_minor_version_upgrade="${var.auto_minor_version_upgrade}"
  notification_topic_arn  = "${var.notification_topic_arn}"
  transit_encryption_enabled="${var.transit_encryption_enabled}"
  snapshot_name           = "${var.snapshot_name}"

}
