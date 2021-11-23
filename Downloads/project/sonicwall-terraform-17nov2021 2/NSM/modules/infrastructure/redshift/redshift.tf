resource "aws_redshift_subnet_group" "redshift_sub_grp" {
  count                               = "${var.subnet_grp_enabled ? 1 : 0}"
  name                                = "${var.subgrp_name}"
  subnet_ids                          = ["${var.subnet_ids}"]
}

resource "aws_redshift_parameter_group" "redshift_par_grp" {
  count                               = "${var.parameter_gname_enabled ? 1 : 0}"
  family                              = "redshift-1.0"
  name                                = "${var.parameter_gname}"
}

resource "aws_redshift_cluster" "redshift" {
  depends_on                          = ["aws_redshift_subnet_group.redshift_sub_grp", "aws_redshift_parameter_group.redshift_par_grp"]
  automated_snapshot_retention_period = 30
  cluster_identifier                  = "${var.name}"
  cluster_parameter_group_name        = "${var.parameter_gname}"
  cluster_subnet_group_name           = "${var.subgrp_name}"
  database_name                       = "${var.database_name}"
  encrypted                           = "${var.isencrypted}"

##Uncomment below line if we need to add an IAM role to the redshift cluster##
#  iam_roles                           = ["${var.role_arns}"]
  
  logging {
    enable      = false
  }
  master_password                     = "${var.master_password}"
  master_username                     = "${var.master_username}"
  node_type                           = "${var.node_type}"
  number_of_nodes                     = "${var.number_of_nodes}"
  enhanced_vpc_routing                = "${var.enhancedvpc}"
  publicly_accessible                 = "${var.publicly_accessible}"
  tags = {
    Name       = "${var.name}"
    BU         = "${var.BU}"
  }
  vpc_security_group_ids              = ["${var.securitygrp_ids}"]
  skip_final_snapshot                 = "${var.skip_final_snapshot}"
}

#data "aws_redshift_cluster" "redshift_ip" {
#  cluster_identifier                  = "${var.name}"
#}
