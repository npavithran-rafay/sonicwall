#-----------------------------------------------#
#save the state file to s3 bucket               #
#-----------------------------------------------#
/*terraform {
  # The configuration for this backend will be filled in by Terragrunt
  backend "s3" {}
}*/

################################################
## Redshift cluster specific modules          ##
################################################

resource "aws_redshift_subnet_group" "redshift_subgrp_name" {
  name       = var.subgrp_name
  subnet_ids = var.subnet_ids
  tags = {
  BU                         = var.BU
  Application                = var.Application
  Name                       = var.subgrp_name
  Applicationtype            = var.Applicationtype
  Region                     = var.tag_region
  Environment                = var.tag_env
  }
}

resource "aws_redshift_parameter_group" "redshift_parameter_gname" {
  name   = var.parameter_gname
  family = "redshift-1.0"
  parameter {
    name  = "wlm_json_configuration"
    value = file("${path.module}/wlm_cofig.json")
  }
  parameter {
             name  = var.paramname
             value = var.paramvalue
  }
}

module "redshift_cluster" {
  source  = "terraform-aws-modules/redshift/aws"
  version = "2.6.0"
  cluster_identifier         = var.name
  cluster_database_name              = var.database_name
  cluster_iam_roles            = var.cluster_iam_roles 
  cluster_master_password            = var.master_password
  cluster_master_username            = var.master_username
  cluster_node_type                  = var.node_type
  cluster_number_of_nodes            = var.number_of_nodes
  publicly_accessible        = var.publicly_accessible
  vpc_security_group_ids            = var.securitygrp_ids
  redshift_subnet_group_name   = aws_redshift_subnet_group.redshift_subgrp_name.name
  preferred_maintenance_window = var.preferred_maintenance_window
  parameter_group_name         = aws_redshift_parameter_group.redshift_parameter_gname.name
  subnets  = var.subnet_ids
  skip_final_snapshot = true
  final_snapshot_identifier = true
  encrypted                = var.isencrypted
  tags = {
  BU                         = var.BU
  Application                = var.Application
  Name                       = var.name
  Applicationtype            = var.Applicationtype
  Region                     = var.tag_region
  Environment                = var.tag_env
  }

}

