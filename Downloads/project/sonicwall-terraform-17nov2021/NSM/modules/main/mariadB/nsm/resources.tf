#create all the security group resources

#-----------------------------------------------#
#save the state file to s3 bucket               #
#-----------------------------------------------#
# terraform {
#   #The configuration for this backend will be filled in by Terragrunt
#   backend "s3" {}
# }

#-----------------------------------------------#
# Create the DB Subnet group to be used by mariaDB
#
# probably should be separated out as a module
#-----------------------------------------------#
resource "aws_db_subnet_group" "cscma_db_subnet_group" {
  name       = "${var.db_subnet_group_name}"
  subnet_ids = "${var.db_subnet_ids}"
}

#------------------------------------------------#
#Create RDS for cscma's mariaDB
#------------------------------------------------#

module "cscma_db" {
  source                      = "../../../../modules/infrastructure/rds"
  identifier                  = "${var.rds_identifier}"
  engine                      = "${var.engine}"
  engine_version              = "${var.engine_version}"
  instance_class              = "${var.instance_class}"
  allocated_storage           = "${var.allocated_storage}"
  storage_type                = "${var.storage_type}"
  name                        = "${var.db_name}"
  username                    = "${var.db_master_username}"
  password                    = "${var.db_master_password}"
  port                        = "${var.db_port}"
  vpc_security_group_ids      = "${var.db_vpc_security_group_ids}"
  db_subnet_group_name        = "${aws_db_subnet_group.cscma_db_subnet_group.id}"
  multi_az                    = "${var.multi_az}"
  publicly_accessible         = "${var.publicly_accessible}"
  apply_immediately           = "${var.apply_immediately}"
  allow_major_version_upgrade = "${var.allow_major_version_upgrade}"
  auto_minor_version_upgrade  = "${var.auto_minor_version_upgrade}"
  deletion_protection         = "${var.deletion_protection}"
  skip_final_snapshot         = "${var.skip_final_snapshot}"
  backup_retention_period     = "30"
  backup_window               = "00:15-01:15"
  tags                        = "${var.tags}"
}
