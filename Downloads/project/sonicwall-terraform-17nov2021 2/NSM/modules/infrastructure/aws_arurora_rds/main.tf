
resource "aws_rds_cluster" "this" {
  cluster_identifier              = "${var.name}"
  engine                          = "${var.engine}"
  engine_version                  = "${var.engine_version}"
  database_name                   = "${var.database_name}"
  master_username                 = "${var.master_username}"
  master_password                 = "${var.master_password}"
  final_snapshot_identifier       = "${var.final_snapshot_identifier_prefix}-${var.name}-${random_id.snapshot_identifier.hex}"
  skip_final_snapshot             = "${var.skip_final_snapshot}"
  deletion_protection             = "${var.deletion_protection}"
  backup_retention_period         = "${var.backup_retention_period}"
  preferred_backup_window         = "${var.preferred_backup_window}"
  preferred_maintenance_window    = "${var.preferred_maintenance_window}"
  port                            = "${var.port}"
  db_subnet_group_name            = "${var.db_subnet_group_name}"
  #db_subnet_group                 = ["${var.db_subnet_group}"]
  vpc_security_group_ids          = ["${var.vpc_security_group_ids}"]
  snapshot_identifier             = "${var.snapshot_identifier}"
  storage_encrypted               = "${var.storage_encrypted}"
  apply_immediately               = "${var.apply_immediately}"

  tags = "${var.tags}"
}

resource "aws_rds_cluster_instance" "this" {
  count = "${var.replica_scale_enabled ? var.replica_scale_min : var.replica_count}"

  identifier                      = "${var.name}-${count.index + 1}"
  cluster_identifier              = "${var.name}"
  engine                          = "${var.engine}"
  engine_version                  = "${var.engine_version}"
  instance_class                  = "${var.instance_type}"
  publicly_accessible             = "${var.publicly_accessible}"
  db_subnet_group_name            = "${var.db_subnet_group_name}"
  #db_subnet_group                 = ["${var.db_subnet_group}"]
  preferred_maintenance_window    = "${var.preferred_maintenance_window}"
  apply_immediately               = "${var.apply_immediately}"
  auto_minor_version_upgrade      = "${var.auto_minor_version_upgrade}"
  promotion_tier                  = "${count.index + 1}"

  tags = "${var.tags}"
}

resource "random_id" "snapshot_identifier" {
  keepers = {
    id = "${var.name}"
  }

  byte_length = 4
}

resource "aws_appautoscaling_target" "read_replica_count" {
  count = "${var.replica_scale_enabled ? 1 : 0}"

  max_capacity       = "${var.replica_scale_max}"
  min_capacity       = "${var.replica_scale_min}"
  resource_id        = "cluster:${aws_rds_cluster.this.cluster_identifier}"
  scalable_dimension = "rds:cluster:ReadReplicaCount"
  service_namespace  = "rds"
}

resource "aws_appautoscaling_policy" "autoscaling_read_replica_count" {
  count = "${var.replica_scale_enabled ? 1 : 0}"

  name               = "target-metric"
  policy_type        = "TargetTrackingScaling"
  resource_id        = "cluster:${aws_rds_cluster.this.cluster_identifier}"
  scalable_dimension = "rds:cluster:ReadReplicaCount"
  service_namespace  = "rds"

  target_tracking_scaling_policy_configuration {
    predefined_metric_specification {
      predefined_metric_type = "RDSReaderAverageCPUUtilization"
    }

    scale_in_cooldown  = "${var.replica_scale_in_cooldown}"
    scale_out_cooldown = "${var.replica_scale_out_cooldown}"
    target_value       = "${var.replica_scale_cpu}"
  }

  depends_on = ["aws_appautoscaling_target.read_replica_count"]
}
