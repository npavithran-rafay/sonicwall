#-----------------------------------------------#
#save the state file to s3 bucket               #
#-----------------------------------------------#
# terraform {
#   # The configuration for this backend will be filled in by Terragrunt
#   backend "s3" {}
# }

################################################
## Redshift cluster specific modules          ##
################################################

module "redshift_cluster" {
  source                     = "../../../modules/infrastructure/redshift"
  subnet_grp_enabled         = "${var.subnet_grp_enabled}"
  subgrp_name                = "${var.subgrp_name}"
  subnet_ids                 = ["${var.subnet_ids}"]
  parameter_gname_enabled    = "${var.parameter_gname_enabled}"
  parameter_gname            = "${var.parameter_gname}"
  name                       = "${var.name}"
  database_name              = "${var.database_name}"
  isencrypted                = "${var.isencrypted}"
  # role_arns                  = [" "]
  skip_final_snapshot        = "${var.skip_final_snapshot}"
  master_password            = "${var.master_password}"
  master_username            = "${var.master_username}"
  node_type                  = "${var.node_type}"
  number_of_nodes            = "${var.number_of_nodes}"
  enhancedvpc                = "${var.enhancedvpc}"
  publicly_accessible        = "${var.publicly_accessible}"
  BU                         = "${var.BU}"
  securitygrp_ids            = ["${var.securitygrp_ids}"]
}


