# The module for creating RDS cluster in AWS

resource "aws_db_subnet_group" "dbsubnetgroup" {
  name       = "${var.subnet_group_name}"
  description = "Database subnet group for replica"
  subnet_ids = ["${var.subnet_ids}"]
}

resource "aws_security_group" "default" {
  name        = "${var.rds_cluster_sg}"
  description = "Allow inbound traffic from Security Groups and CIDRs"
  vpc_id      = "${var.vpc_id}"
  ingress {
    from_port       = "${var.port}"
    to_port         = "${var.port}"
    protocol        = "tcp"
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_rds_cluster" "default" {
  cluster_identifier      = "${var.cluster_identifier}"
  engine                   = "${var.engine}"
  engine_version           = "${var.engine_version}"
  availability_zones      = "${var.azs}"
  database_name           = "${var.database_name}"
  master_username         = "${var.master_username}"
  master_password         = "${var.master_password}"
  backup_retention_period = "${var.backup_retention_period}"
  db_subnet_group_name   = "${aws_db_subnet_group.dbsubnetgroup.name}"
  skip_final_snapshot = "${var.skip_final_snapshot}"
  apply_immediately   = "${var.apply_immediately}"
  port                = "${var.port}"
  engine_mode         = "${var.engine_mode}"
  deletion_protection = "${var.deletion_protection}"
  vpc_security_group_ids = ["${aws_security_group.default.id}"]
}

resource "aws_rds_cluster_instance" "default" {
  count              = 2
  identifier         = "${var.identifier_string}-${count.index}"
  cluster_identifier = "${aws_rds_cluster.default.id}"
  instance_class     = "${var.instance_class}"
  db_subnet_group_name   = "${aws_db_subnet_group.dbsubnetgroup.name}"
  publicly_accessible = "${var.publicly_accessible}"
}
