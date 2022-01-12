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
  name       = var.subgrp_name_analyzer
  subnet_ids = flatten(var.subnet_ids)
  tags = {
  BU                         = var.BU
  Application                = var.Application
  Name                       = var.subgrp_name_analyzer
  Applicationtype            = var.Applicationtype
  Region                     = var.tag_region
  Environment                = var.tag_env
  }
}

resource "aws_redshift_parameter_group" "redshift_parameter_gname" {
  name   = var.parameter_gname_analyzer
  family = "redshift-1.0"
  parameter {
    name  = "wlm_json_configuration"
    value = file("${path.module}/wlm_config.json")
  }
  parameter {
             name  = var.paramname
             value = var.paramvalue
  }
}

module "redshift_cluster" {
  source  = "terraform-aws-modules/redshift/aws"
  version = "~> 3.0"
  cluster_identifier         = var.name
  cluster_database_name              = var.database_name_analyzer
  cluster_iam_roles            = var.cluster_iam_roles 
  cluster_master_password            = var.master_password_analyzer
  cluster_master_username            = var.master_username_analyzer
  cluster_node_type                  = var.node_type_analyzer
  cluster_number_of_nodes            = var.number_of_nodes
  publicly_accessible        = var.publicly_accessible
  vpc_security_group_ids            = flatten(var.securitygrp_ids)
  redshift_subnet_group_name   = aws_redshift_subnet_group.redshift_subgrp_name.name
  preferred_maintenance_window = var.preferred_maintenance_window
  parameter_group_name         = aws_redshift_parameter_group.redshift_parameter_gname.name
  subnets  = flatten(var.subnet_ids)
  skip_final_snapshot = true
  final_snapshot_identifier = true
  automated_snapshot_retention_period = 1
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

