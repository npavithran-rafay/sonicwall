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
  subnet_ids                  = ["${var.sn_ids}"]
  sub_grp_description         = "${var.sn_grp_desc}"

}
