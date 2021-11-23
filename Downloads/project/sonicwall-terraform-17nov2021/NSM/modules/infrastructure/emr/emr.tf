##########################
# EMR EC2 IAM resources ##
##########################

# IAM Role for EC2 Instance Profile
resource "aws_iam_role" "iam_emr_ec2_profile_role" {
  name = "${var.environment}JobflowInstanceProfile_role"

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
  name = "${aws_iam_role.iam_emr_ec2_profile_role.name}"
  role = "${aws_iam_role.iam_emr_ec2_profile_role.id}"

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
  name = "${aws_iam_role.iam_emr_ec2_profile_role.name}"
  role = "${aws_iam_role.iam_emr_ec2_profile_role.name}"
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
  name               = "emr${var.environment}ServiceRole"
  assume_role_policy = "${data.aws_iam_policy_document.emr_assume_role.json}"
}

resource "aws_iam_role_policy_attachment" "emr_service_role" {
  role       = "${aws_iam_role.emr_service_role.name}"
  policy_arn = "arn:aws:iam::aws:policy/service-role/AmazonElasticMapReduceRole"
}

resource "aws_iam_role_policy_attachment" "ssm_service_role" {
  role       = "${aws_iam_role.emr_service_role.name}"
  policy_arn = "arn:aws:iam::aws:policy/service-role/AmazonEC2RoleforSSM"
}


#############################
# Security group resources ##
#############################

resource "aws_security_group" "emr_master" {
  vpc_id                 = "${var.vpc_id}"
  revoke_rules_on_delete = true

  tags {
    Name        = "sg${var.name}Master"
    BU          = "${var.bu}"
    Application = "${var.application}"
    Environment = "${var.environment}"
  }	
}

resource "aws_security_group" "emr_slave" {
  vpc_id                 = "${var.vpc_id}"
  revoke_rules_on_delete = true

  tags {
    Name        = "sg${var.name}Slave"
    BU          = "${var.bu}"
    Application = "${var.application}"
    Environment = "${var.environment}"
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
  security_group_id = "${aws_security_group.emr_master.id}"
}


resource "aws_security_group_rule" "managed_slave_egress" {
  description       = "Allow all egress traffic"
  type              = "egress"
  from_port         = 0
  to_port           = 0
  protocol          = "-1"
  cidr_blocks       = ["0.0.0.0/0"]
  ipv6_cidr_blocks  = ["::/0"]
  security_group_id = "${aws_security_group.emr_slave.id}"
}

#################
## EMR Cluster ##
#################

resource "aws_emr_cluster" "default" {
  name                              = "${var.name}"
  release_label                     = "${var.release_label}"
  applications                      = "${var.applications}"
  termination_protection            = "${var.termination_protection}"
  keep_job_flow_alive_when_no_steps = "${var.keep_job_flow_alive_when_no_steps}"
  ebs_root_volume_size              = "${var.ebs_root_volume_size}"
  visible_to_all_users              = "${var.visible_to_all_users}"
  service_role                      = "${aws_iam_role.emr_service_role.arn}"
  log_uri                           = "${var.log_uri}"
  ec2_attributes {
    key_name                          = "${var.key_name}"
    subnet_id                         = "${var.subnet_id}"
    emr_managed_master_security_group = "${aws_security_group.emr_master.id}"
    emr_managed_slave_security_group  = "${aws_security_group.emr_slave.id}"
    instance_profile                  = "${aws_iam_instance_profile.emr_profile.arn}"
  }
  core_instance_group {
    name           = "${var.core_instance_name}"
    instance_type  = "${var.core_instance_group_instance_type}"
    instance_count = "${var.core_instance_group_instance_count}"
    ebs_config {
      size                 = "${var.core_instance_group_ebs_size}"
      type                 = "${var.core_instance_group_ebs_type}"
#      iops                 = "${var.core_instance_group_ebs_iops}"
      volumes_per_instance = "${var.core_instance_group_ebs_volumes_per_instance}"
    }
#    bid_price          = "${var.core_instance_group_bid_price}"
    autoscaling_policy  = "${var.core_instance_group_autoscaling_policy}"
  }
  master_instance_group {
    name           = "${var.master_instance_name}"
    instance_type  = "${var.master_instance_group_instance_type}"
    instance_count = "${var.master_instance_group_instance_count}"
#    bid_price      = "${var.master_instance_group_bid_price}"
    ebs_config {
      size                 = "${var.master_instance_group_ebs_size}"
      type                 = "${var.master_instance_group_ebs_type}"
#      iops                 = "${var.master_instance_group_ebs_iops}"
      volumes_per_instance = "${var.master_instance_group_ebs_volumes_per_instance}"
    }
  }
  tags {
    Name        = "${var.name}"
    BU          = "${var.bu}"
    Application = "${var.application}"
    Environment = "${var.environment}"
    region      = "${var.region}"
  }
}

resource "aws_emr_instance_group" "task" {
  count            = "${var.create_task_instance_group ? 1 : 0}"
  name             = "${var.task_instance_name}"
  cluster_id       = "${aws_emr_cluster.default.id}"
  instance_type    = "${var.task_instance_group_instance_type}"
  instance_count   = "${var.task_instance_group_instance_count}"
  ebs_config {
    size                 = "${var.task_instance_group_ebs_size}"
    type                 = "${var.task_instance_group_ebs_type}"
#    iops                 = "${var.task_instance_group_ebs_iops}"
    volumes_per_instance = "${var.task_instance_group_ebs_volumes_per_instance}"
  }
#  bid_price          = "${var.task_instance_group_bid_price}"
  ebs_optimized      = "${var.task_instance_group_ebs_optimized}"
  autoscaling_policy = "${var.task_instance_group_autoscaling_policy}"
}
