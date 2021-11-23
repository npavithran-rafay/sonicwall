
#-----------------------------------------------#
#save the state file to s3 bucket               #
#-----------------------------------------------#
/*terraform {
  # The configuration for this backend will be filled in by Terragrunt
  backend "s3" {}
}*/

########################################################
## Create the S3 bucket for storing EMR cluster1 logs ##
########################################################

resource "aws_s3_bucket" "s3_bucket_for_emr_logs" {
  bucket = "${var.prefix}-analyzerng-emr-logs"
  acl    = var.acl
  lifecycle_rule {
    enabled = true
    expiration {
      days= var.lifecycle_expiration_days
    }
  }
  force_destroy = true
  tags = {
    BU              = var.bu
    Name            = "${var.prefix}-analyzerng-emr-logs"
    Region          = var.tag_region
    Applicationtype = var.Applicationtype
    Deploymenttype  = "Terraform"
    Environment     = var.environment
  }
}

resource "aws_s3_bucket_public_access_block" "emr_s3" {
  depends_on = [
    aws_s3_bucket.s3_bucket_for_emr_logs,
  ]
  bucket                  = aws_s3_bucket.s3_bucket_for_emr_logs.id
  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}

resource "aws_s3_bucket_object" "create_folder" {
  depends_on = [
    aws_s3_bucket.s3_bucket_for_emr_logs,
  ]
  bucket      = aws_s3_bucket.s3_bucket_for_emr_logs.id
  acl         = var.acl
  key         = var.S3_key
}

########################################################
## Create the S3 bucket for storing EMR cluster2 logs ##
########################################################

resource "aws_s3_bucket" "s3_bucket_for_emr2_logs" {
  bucket = "${var.prefix}-analyzerng-emr-logparser-logs"
  acl    = var.acl
  lifecycle_rule {
    enabled = true
    expiration {
      days= var.lifecycle_expiration_days
    }
  }
  force_destroy = true
  tags = {
    BU              = var.bu
    Name            = "${var.prefix}-analyzerng-emr-logparser-logs"
    Region          = var.tag_region
    Application     = var.application
    Applicationtype = var.Applicationtype
    Deploymenttype  = "Terraform"
    Environment     = var.environment
  }
}

resource "aws_s3_bucket_public_access_block" "emr2_s3" {
  depends_on = [
    aws_s3_bucket.s3_bucket_for_emr2_logs,
  ]
  bucket                  = aws_s3_bucket.s3_bucket_for_emr2_logs.id
  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}

resource "aws_s3_bucket_object" "create_folder_emr2" {
  depends_on = [
    aws_s3_bucket.s3_bucket_for_emr2_logs,
  ]
  bucket      = aws_s3_bucket.s3_bucket_for_emr2_logs.id
  acl         = var.acl
  key         = var.S3_key
}



##########################
# EMR EC2 IAM resources ##
##########################

# IAM Role for EC2 Instance Profile
resource "aws_iam_role" "iam_emr_ec2_profile_role" {
  name = "${var.environment}-${var.name}-Jobflow_role"

  assume_role_policy = <<EOF
{
  "Version": "2008-10-17",
  "Statement": [
    {
      "Sid": "",
      "Effect": "Allow",
      "Principal": {
        "Service": "ec2.amazonaws.com"
      },
      "Action": "sts:AssumeRole"
    }
  ]
}
EOF
}

resource "aws_iam_role_policy" "iam_emr_profile_policy" {
  name = aws_iam_role.iam_emr_ec2_profile_role.name
  role = aws_iam_role.iam_emr_ec2_profile_role.id

  policy = <<EOF
{
    "Version": "2012-10-17",
    "Statement": [{
        "Effect": "Allow",
        "Resource": "*",
        "Action": [
            "cloudwatch:*",
            "dynamodb:*",
            "ec2:Describe*",
            "elasticmapreduce:Describe*",
            "elasticmapreduce:ListBootstrapActions",
            "elasticmapreduce:ListClusters",
            "elasticmapreduce:ListInstanceGroups",
            "elasticmapreduce:ListInstances",
            "elasticmapreduce:ListSteps",
            "kinesis:CreateStream",
            "kinesis:DeleteStream",
            "kinesis:DescribeStream",
            "kinesis:GetRecords",
            "kinesis:GetShardIterator",
            "kinesis:MergeShards",
            "kinesis:PutRecord",
            "kinesis:SplitShard",
            "rds:Describe*",
            "s3:*",
            "sdb:*",
            "sns:*",
            "sqs:*"
        ]
    }]
}
EOF
}

resource "aws_iam_instance_profile" "emr_profile" {
  name = aws_iam_role.iam_emr_ec2_profile_role.name
  role = aws_iam_role.iam_emr_ec2_profile_role.name
}

######################
# EMR IAM resources ##
######################

data "aws_iam_policy_document" "emr_assume_role" {
  statement {
    effect = "Allow"

    principals {
      type        = "Service"
      identifiers = ["elasticmapreduce.amazonaws.com"]
    }

    actions = ["sts:AssumeRole"]
  }
}

resource "aws_iam_role" "emr_service_role" {
  name               = "emr-${var.environment}-${var.name}-ServiceRole"
  assume_role_policy = data.aws_iam_policy_document.emr_assume_role.json
}

resource "aws_iam_role_policy_attachment" "emr_service_role" {
  role       = aws_iam_role.emr_service_role.name
  policy_arn = "arn:aws:iam::aws:policy/service-role/AmazonElasticMapReduceRole"
}

resource "aws_iam_role_policy_attachment" "ssm_service_role" {
  role       = aws_iam_role.emr_service_role.name
  policy_arn = "arn:aws:iam::aws:policy/service-role/AmazonEC2RoleforSSM"
}


#############################
# Security group resources ##
#############################

resource "aws_security_group" "emr_master" {
#  vpc_id                 = data.terraform_remote_state.vpc.outputs.vpc_id
  vpc_id                 = var.vpc_id
  revoke_rules_on_delete = true

  tags = {
    Name            = "sg-${var.name}-Master"
    BU              = var.bu
    Application     = var.application
    Environment     = var.environment
    Applicationtype = var.Applicationtype
    Deploymenttype  = "Terraform"
  }
}

resource "aws_security_group" "emr_slave" {
#  vpc_id                 = data.terraform_remote_state.vpc.outputs.vpc_id
  vpc_id                 = var.vpc_id
  revoke_rules_on_delete = true

  tags = {
    Name            = "sg-${var.name}-Slave"
    BU              = var.bu
    Application     = var.application
    Environment     = var.environment
    Applicationtype = var.Applicationtype
    Deploymenttype  = "Terraform"

  }
}


resource "aws_security_group_rule" "managed_master_egress" {
  description       = "Allow all egress traffic"
  type              = "egress"
  from_port         = 0
  to_port           = 0
  protocol          = "-1"
  cidr_blocks       = ["0.0.0.0/0"]
  ipv6_cidr_blocks  = ["::/0"]
  security_group_id = aws_security_group.emr_master.id
}


resource "aws_security_group_rule" "managed_slave_egress" {
  description       = "Allow all egress traffic"
  type              = "egress"
  from_port         = 0
  to_port           = 0
  protocol          = "-1"
  cidr_blocks       = ["0.0.0.0/0"]
  ipv6_cidr_blocks  = ["::/0"]
  security_group_id = aws_security_group.emr_slave.id
}

##############################
## EMR Cluster LogProcessor ##
##############################

resource "aws_emr_cluster" "default" {
  depends_on = [
    aws_s3_bucket.s3_bucket_for_emr_logs,
  ]
  name                              = var.name
  release_label                     = var.release_label
  applications                      = var.applications
  termination_protection            = var.termination_protection
  keep_job_flow_alive_when_no_steps = var.keep_job_flow_alive_when_no_steps
  ebs_root_volume_size              = var.ebs_root_volume_size
  visible_to_all_users              = var.visible_to_all_users
  service_role                      = aws_iam_role.emr_service_role.arn
  log_uri                           = "s3n://${aws_s3_bucket.s3_bucket_for_emr_logs.id}/${var.S3_key}"
  ec2_attributes {
    key_name                          = var.key_name
#    subnet_id                         = data.terraform_remote_state.vpc.outputs.vpc_public_subnets_ids[0]
    subnet_id                         = var.subnet_id
    emr_managed_master_security_group = aws_security_group.emr_master.id
    emr_managed_slave_security_group  = aws_security_group.emr_slave.id
    instance_profile                  = aws_iam_instance_profile.emr_profile.arn
  }
  master_instance_fleet {
    instance_type_configs {
      bid_price_as_percentage_of_on_demand_price = var.master_instance_bidprice_percentage_1 
      ebs_config {
        size                 = var.ebs_size
        type                 = var.ebs_type
        volumes_per_instance = var.volumes_per_instance
      }
      instance_type = var.master_instance_type
    }
    name                      = var.master_fleet_name
    target_on_demand_capacity = var.master_target_on_demand_capacity
    target_spot_capacity      = var.master_target_spot_capacity
  }

  core_instance_fleet {
    instance_type_configs {
      bid_price_as_percentage_of_on_demand_price = var.core_instance_bidprice_percentage_1
      ebs_config {
        size                 = var.ebs_size
        type                 = var.ebs_type
        volumes_per_instance = var.volumes_per_instance
      }
      instance_type     = var.core_instance_type_1
      weighted_capacity = var.core_instance_weighted_capacity_1
    }
    instance_type_configs {
      bid_price_as_percentage_of_on_demand_price = var.core_instance_bidprice_percentage_2
      ebs_config {
        size                 = var.ebs_size
        type                 = var.ebs_type
        volumes_per_instance = var.volumes_per_instance
      }
      instance_type     = var.core_instance_type_2
      weighted_capacity = var.core_instance_weighted_capacity_2
    }
    name                      = var.core_fleet_name
    target_on_demand_capacity = var.core_target_on_demand_capacity
    target_spot_capacity      = var.core_target_spot_capacity
  }
  configurations_json = <<EOF
  [
    {
      "Classification": "spark-log4j",
      "Properties": {
            "log4j.rootCategory": "WARN, console"
      }
    }
  ]
  EOF
  tags = {
    Name            = var.name
    BU              = var.bu
    Application     = var.application
    Environment     = var.environment
    region          = var.region
    Applicationtype = var.Applicationtype
    Deploymenttype  = "Terraform"

  }
}

#--------------------------------------#
# EMR Task Fleet for Logprocessor EMR  #
#--------------------------------------#

resource "aws_emr_instance_fleet" "task" {
  count            = var.create_task_instance_fleet ? 1 : 0
  depends_on = [
    aws_emr_cluster.default,
  ]
  cluster_id = aws_emr_cluster.default.id
  instance_type_configs {
    bid_price_as_percentage_of_on_demand_price = var.task_instance_bidprice_percentage_1
    ebs_config {
      size                 = var.ebs_size
      type                 = var.ebs_type
      volumes_per_instance = var.volumes_per_instance
    }
    instance_type     = var.task_instance_type_1
    weighted_capacity = var.task_instance_weighted_capacity_1
  }
  instance_type_configs {
    bid_price_as_percentage_of_on_demand_price = var.task_instance_bidprice_percentage_2
    ebs_config {
      size                 = var.ebs_size
      type                 = var.ebs_type
      volumes_per_instance = var.volumes_per_instance
    }
    instance_type     = var.task_instance_type_2
    weighted_capacity = var.task_instance_weighted_capacity_2
  }
  instance_type_configs {
    bid_price_as_percentage_of_on_demand_price = var.task_instance_bidprice_percentage_3
    ebs_config {
      size                 = var.ebs_size
      type                 = var.ebs_type
      volumes_per_instance = var.volumes_per_instance
    }
    instance_type     = var.task_instance_type_3
    weighted_capacity = var.task_instance_weighted_capacity_3
  }
  instance_type_configs {
    bid_price_as_percentage_of_on_demand_price = var.task_instance_bidprice_percentage_4
    ebs_config {
      size                 = var.ebs_size
      type                 = var.ebs_type
      volumes_per_instance = var.volumes_per_instance
    }
    instance_type     = var.task_instance_type_4
    weighted_capacity = var.task_instance_weighted_capacity_4
  }
  launch_specifications {
    spot_specification {
      allocation_strategy      = var.task_spot_allocation_strategy
      block_duration_minutes   = var.task_spot_block_duration_minutes
      timeout_action           = var.task_spot_timeout_action
      timeout_duration_minutes = var.task_spot_timeout_duration_minutes
    }
  }
  name                      = var.task_fleet_name
  target_on_demand_capacity = var.task_target_on_demand_capacity
  target_spot_capacity      = var.task_target_spot_capacity
}

resource "aws_emr_managed_scaling_policy" "policy1" {
  cluster_id = aws_emr_cluster.default.id
  compute_limits {
    unit_type                       = var.scaling_unit_type
    minimum_capacity_units          = var.scaling_minimum_capacity_units
    maximum_capacity_units          = var.scaling_maximum_capacity_units
    maximum_ondemand_capacity_units = var.scaling_maximum_ondemand_capacity_units
    maximum_core_capacity_units     = var.scaling_maximum_core_capacity_units
  }
}
###########################
## EMR Cluster LogParser ##
###########################


resource "aws_emr_cluster" "Logparser" {
  depends_on = [
    aws_s3_bucket.s3_bucket_for_emr2_logs,
  ]
  name                              = var.emr2_name
  release_label                     = var.release_label
  applications                      = var.applications
  termination_protection            = var.termination_protection
  keep_job_flow_alive_when_no_steps = var.keep_job_flow_alive_when_no_steps
  ebs_root_volume_size              = var.ebs_root_volume_size
  visible_to_all_users              = var.visible_to_all_users
  service_role                      = aws_iam_role.emr_service_role.arn
  log_uri                           = "s3n://${aws_s3_bucket.s3_bucket_for_emr2_logs.id}/${var.S3_key}"
  ec2_attributes {
    key_name                          = var.key_name
#    subnet_id                         = data.terraform_remote_state.vpc.outputs.vpc_public_subnets_ids[0]
    subnet_id                         = var.subnet_id
    emr_managed_master_security_group = aws_security_group.emr_master.id
    emr_managed_slave_security_group  = aws_security_group.emr_slave.id
    instance_profile                  = aws_iam_instance_profile.emr_profile.arn
  }
  master_instance_fleet {
    instance_type_configs {
      bid_price_as_percentage_of_on_demand_price = var.master_instance_bidprice_percentage_1
      ebs_config {
        size                 = var.ebs_size
        type                 = var.ebs_type
        volumes_per_instance = var.volumes_per_instance
      }
      instance_type = var.master_instance_type
    }
    name                      = var.master_fleet_name
    target_on_demand_capacity = var.master_target_on_demand_capacity
    target_spot_capacity      = var.master_target_spot_capacity
  }

  core_instance_fleet {
    instance_type_configs {
      bid_price_as_percentage_of_on_demand_price = var.core_instance_bidprice_percentage_1
      ebs_config {
        size                 = var.ebs_size
        type                 = var.ebs_type
        volumes_per_instance = var.volumes_per_instance
      }
      instance_type     = var.core_instance_type_1
      weighted_capacity = var.core_instance_weighted_capacity_1
    }
    instance_type_configs {
      bid_price_as_percentage_of_on_demand_price = var.core_instance_bidprice_percentage_2
      ebs_config {
        size                 = var.ebs_size
        type                 = var.ebs_type
        volumes_per_instance = var.volumes_per_instance
      }
      instance_type     = var.core_instance_type_2
      weighted_capacity = var.core_instance_weighted_capacity_2
    }

#    launch_specifications {
#      spot_specification {
#        allocation_strategy      = var.core_spot_allocation_strategy
#        block_duration_minutes   = var.core_spot_block_duration_minutes
#        timeout_action           = var.core_spot_timeout_action
#        timeout_duration_minutes = var.core_spot_timeout_duration_minutes
#      }
#    }
    name                      = var.core_fleet_name
    target_on_demand_capacity = var.core_target_on_demand_capacity
    target_spot_capacity      = var.core_target_spot_capacity
  }
  configurations_json = <<EOF
  [
    {
      "Classification": "spark-log4j",
      "Properties": {
            "log4j.rootCategory": "WARN, console"
      }
    }
  ]
  EOF
  tags = {
    Name            = var.emr2_name
    BU              = var.bu
    Application     = var.application
    Environment     = var.environment
    region          = var.region
    Applicationtype = var.Applicationtype
    Deploymenttype  = "Terraform"

  }
}

#-----------------------------------#
# EMR Task Fleet for Logparser EMR  #
#-----------------------------------#

resource "aws_emr_instance_fleet" "emr2_task" {
  count            = var.create_task_instance_fleet ? 1 : 0
  depends_on = [
    aws_emr_cluster.Logparser,
  ]
  cluster_id = aws_emr_cluster.Logparser.id
  instance_type_configs {
    bid_price_as_percentage_of_on_demand_price = var.task_instance_bidprice_percentage_1
    ebs_config {
      size                 = var.ebs_size
      type                 = var.ebs_type
      volumes_per_instance = var.volumes_per_instance
    }
    instance_type     = var.task_instance_type_1
    weighted_capacity = var.task_instance_weighted_capacity_1
  }
  instance_type_configs {
    bid_price_as_percentage_of_on_demand_price = var.task_instance_bidprice_percentage_2
    ebs_config {
      size                 = var.ebs_size
      type                 = var.ebs_type
      volumes_per_instance = var.volumes_per_instance
    }
    instance_type     = var.task_instance_type_2
    weighted_capacity = var.task_instance_weighted_capacity_2
  }
  instance_type_configs {
    bid_price_as_percentage_of_on_demand_price = var.task_instance_bidprice_percentage_3
    ebs_config {
      size                 = var.ebs_size
      type                 = var.ebs_type
      volumes_per_instance = var.volumes_per_instance
    }
    instance_type     = var.task_instance_type_3
    weighted_capacity = var.task_instance_weighted_capacity_3
  }
  instance_type_configs {
    bid_price_as_percentage_of_on_demand_price = var.task_instance_bidprice_percentage_4
    ebs_config {
      size                 = var.ebs_size
      type                 = var.ebs_type
      volumes_per_instance = var.volumes_per_instance
    }
    instance_type     = var.task_instance_type_4
    weighted_capacity = var.task_instance_weighted_capacity_4
  }
  launch_specifications {
    spot_specification {
      allocation_strategy      = var.task_spot_allocation_strategy
      block_duration_minutes   = var.task_spot_block_duration_minutes
      timeout_action           = var.task_spot_timeout_action
      timeout_duration_minutes = var.task_spot_timeout_duration_minutes
    }
  }
  name                      = var.task_fleet_name
  target_on_demand_capacity = var.task_target_on_demand_capacity
  target_spot_capacity      = var.task_target_spot_capacity
}


resource "aws_emr_managed_scaling_policy" "policy2" {
  cluster_id = aws_emr_cluster.Logparser.id
  compute_limits {
    unit_type                       = var.scaling_unit_type
    minimum_capacity_units          = var.scaling_minimum_capacity_units
    maximum_capacity_units          = var.scaling_maximum_capacity_units
    maximum_ondemand_capacity_units = var.scaling_maximum_ondemand_capacity_units
    maximum_core_capacity_units     = var.scaling_maximum_core_capacity_units
  }
}
