#resource "aws_db_subnet_group" "dbsubnetgroup" {
#  name       = "kp-test-elastic"
#  description = "Database subnet group for ${var.identifier}"
#  subnet_ids  = ["${var.subnet_ids}"]
#}

resource "aws_db_instance" "awsdb" {

  identifier = "${var.identifier}"
  engine            = "${var.engine}"
  engine_version    = "${var.engine_version}"
  instance_class    = "${var.instance_class}"
  allocated_storage = "${var.allocated_storage}"
  storage_type      = "${var.storage_type}"
  name              = "${var.name}"
  username          = "${var.username}"
  password          = "${var.password}"
  port              = "${var.port}"
  iam_database_authentication_enabled = "${var.iam_database_authentication_enabled}"
  replicate_source_db = "${var.replicate_source_db}"
  snapshot_identifier = "${var.snapshot_identifier}"
  vpc_security_group_ids = flatten("${var.vpc_security_group_ids}")
  db_subnet_group_name   = "${var.db_subnet_group_name}"
  parameter_group_name   = "${var.parameter_group_name}"
  option_group_name      = "${var.option_group_name}"
  availability_zone   = "${var.availability_zone}"
  multi_az            = "${var.multi_az}"
  iops                = "${var.iops}"
  publicly_accessible = "${var.publicly_accessible}"
  apply_immediately           = "${var.apply_immediately}"
  allow_major_version_upgrade = "${var.allow_major_version_upgrade}"
  auto_minor_version_upgrade  = "${var.auto_minor_version_upgrade}"
  deletion_protection = "${var.deletion_protection}"
  tags = (
    "${merge(var.tags, tomap({"Name" = format("%s", var.identifier)}))}"
  )
  #monitoring_interval = "${var.monitoring_interval}"
  #monitoring_role_arn = "${coalesce(var.monitoring_role_arn, join("", aws_iam_role.enhanced_monitoring.*.arn))}"
  #maintenance_window          = "${var.maintenance_window}"
  skip_final_snapshot         = "${var.skip_final_snapshot}"
  #copy_tags_to_snapshot       = "${var.copy_tags_to_snapshot}"
  #final_snapshot_identifier   = "${var.final_snapshot_identifier}"
  backup_retention_period = "${var.backup_retention_period}"
  backup_window           = "${var.backup_window}"
  #character_set_name = "${var.character_set_name}"
  #enabled_cloudwatch_logs_exports = "${var.enabled_cloudwatch_logs_exports}"
  #timeouts = "${var.timeouts}"
}
