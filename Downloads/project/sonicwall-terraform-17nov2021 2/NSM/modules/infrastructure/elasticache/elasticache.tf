resource "aws_elasticache_replication_group" "default" {
  count                         = "${var.replication_enabled ? 1 : 0}"
  replication_group_id          = "${var.repl_grp_id}"
  replication_group_description = "${var.description}"
  node_type                     = "${var.node_type}"
  number_cache_clusters         = "${var.num_cache_clusters}"
  port                          = "${var.port}"
  parameter_group_name          = "${var.parameter_gname}"
##### snapshot window is only for redis
#  snapshot_arns                 = "${var.snapshot_arns}"
  snapshot_name                 = "${var.snapshot_name}"
  notification_topic_arn        = "${var.notification_topic_arn}"
  snapshot_window               = "${var.snapshot_window}"
  snapshot_retention_limit      = "${var.snapshot_retention_limit}"
  automatic_failover_enabled    = "${var.automatic_failover_enabled}"
  availability_zones            = "${var.ec_az}"
  engine                        = "${var.engine_name}"
  engine_version                = "${var.engine_ver}"
  at_rest_encryption_enabled    = "${var.at_rest_encryption_enabled}"
##### kms_key_id can be specified only if at_rest_encryption_enabled is true
#  kms_key_id                    = "${var.kms_key_id}"
  transit_encryption_enabled    = "${var.transit_encryption_enabled}"
##### Auth token has to be specified only when transit_encryption_enabled is true
#  auth_token                    = "${var.auth_token}"
  subnet_group_name             = "${aws_elasticache_subnet_group.default.name}"
  security_group_ids            = ["${var.sg_ids}"]  
  apply_immediately             = "${var.apply_immediately}"
  auto_minor_version_upgrade    = "${var.auto_minor_version_upgrade}"

  tags = {
           Name            =  "${var.name_tag}"
           Environment     =  "${var.enviroment_tag}"
           BU              =  "${var.bu_tag}"
  }
}

resource "aws_elasticache_replication_group" "redis-cluster" {
  count                         = "${var.cluster_replication_enabled ? 1 : 0}"
  replication_group_id          = "${var.repl_grp_id}"
  replication_group_description = "${var.description}"
  node_type                     = "${var.node_type}"
  port                          = "${var.port}"
  parameter_group_name          = "${var.parameter_gname}"
##### snapshot window is only for redis
  snapshot_arns                 = "${var.snapshot_arns}"
  snapshot_name                 = "${var.snapshot_name}"
  notification_topic_arn        = "${var.notification_topic_arn}"
  snapshot_window               = "${var.snapshot_window}"
  snapshot_retention_limit      = "${var.snapshot_retention_limit}"
  automatic_failover_enabled    = "${var.automatic_failover_enabled}"
  availability_zones            = "${var.ec_az}"
  engine                        = "${var.engine_name}"
  engine_version                = "${var.engine_ver}"
  at_rest_encryption_enabled    = "${var.at_rest_encryption_enabled}"
##### kms_key_id can be specified only if at_rest_encryption_enabled is true
#  kms_key_id                    = "${var.kms_key_id}"
  transit_encryption_enabled    = "${var.transit_encryption_enabled}"
##### Auth token has to be specified only when transit_encryption_enabled is true
#  auth_token                    = "${var.auth_token}"
  subnet_group_name             = "${aws_elasticache_subnet_group.default.name}"
  security_group_ids            = ["${var.sg_ids}"]
  apply_immediately             = "${var.apply_immediately}"
  auto_minor_version_upgrade    = "${var.auto_minor_version_upgrade}"

#### Cluster_mode should be enabled and number_cache_clusters should be disabled if we need to spin up a redis in cluster-mode ON #####
  cluster_mode {
    replicas_per_node_group = "${var.replicas_per_node}"
    num_node_groups         = "${var.num_node_group}"
  }

  tags = {
           Name            =  "${var.name_tag}"
           Environment     =  "${var.enviroment_tag}"
           BU              =  "${var.bu_tag}"
  }
}

