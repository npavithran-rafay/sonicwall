# ElasticBeansTalk application infrasture and deployment of a big zip file

#provider "aws" {
#    access_key = "${var.aws_access_key}"
#    secret_key = "${var.aws_secret_key}"
#    region = "${var.aws_region}"
#}

#resource "aws_security_group" "default" {
#  name = "instanceresgitser-security-group"
#  description = "Allow inbound traffic"
#
#  vpc_id = "${var.vpcid}"
#
#  ingress  {
#                from_port       = 80
#                to_port         = 80
#                protocol        = "tcp"
#                cidr_blocks = ["0.0.0.0/0"]
#            }
#  ingress {
#                from_port       = 443
#                to_port         = 443
#                protocol        = "tcp"
#                cidr_blocks = ["0.0.0.0/0"]
#          }
#  egress {
#    from_port   = 0
#    to_port     = 0
#    protocol    = "-1"
#    cidr_blocks = ["0.0.0.0/0"]
#  }
#}


data "aws_iam_policy_document" "service" {
  statement {
    sid = ""

    actions = [
      "sts:AssumeRole",
    ]

    principals {
      type        = "Service"
      identifiers = ["elasticbeanstalk.amazonaws.com"]
    }

    effect = "Allow"
  }
}

resource "aws_iam_role" "service" {
  name               = "instanceregister-elasticbeanstalk-service-role"
  assume_role_policy = "${data.aws_iam_policy_document.service.json}"
}

resource "aws_iam_role_policy_attachment" "enhanced-health" {
  role       = "${aws_iam_role.service.name}"
  policy_arn = "arn:aws:iam::aws:policy/service-role/AWSElasticBeanstalkEnhancedHealth"
}

resource "aws_iam_role_policy_attachment" "service" {
  role       = "${aws_iam_role.service.name}"
  policy_arn = "arn:aws:iam::aws:policy/service-role/AWSElasticBeanstalkService"
}

resource "aws_iam_role_policy_attachment" "webservice" {
  role       = "${aws_iam_role.service.name}"
  policy_arn = "arn:aws:iam::aws:policy/AWSElasticBeanstalkWebTier"
}


######
## EC2
######

data "aws_iam_policy_document" "policy-ec2" {
  statement {
    sid = ""

    actions = [
      "sts:AssumeRole",
    ]

    principals {
      type        = "Service"
      identifiers = ["ec2.amazonaws.com"]
    }

    effect = "Allow"
  }
}

resource "aws_iam_role" "ec2" {
  name               = "instanceregister-elasticbeanstalk-ec2-role"
  assume_role_policy = "${data.aws_iam_policy_document.policy-ec2.json}"
}

resource "aws_iam_role_policy_attachment" "web-tier" {
  role       = "${aws_iam_role.ec2.name}"
  policy_arn = "arn:aws:iam::aws:policy/AWSElasticBeanstalkWebTier"
}

resource "aws_iam_role_policy_attachment" "worker-tier" {
  role       = "${aws_iam_role.ec2.name}"
  policy_arn = "arn:aws:iam::aws:policy/AWSElasticBeanstalkWorkerTier"
}

resource "aws_iam_role_policy_attachment" "multicontainer-docker" {
  role       = "${aws_iam_role.ec2.name}"
  policy_arn = "arn:aws:iam::aws:policy/AWSElasticBeanstalkMulticontainerDocker"
}

resource "aws_iam_role_policy_attachment" "enhance-health" {
  role       = "${aws_iam_role.ec2.name}"
  policy_arn = "arn:aws:iam::aws:policy/service-role/AWSElasticBeanstalkEnhancedHealth"
}

resource "aws_iam_policy" "log-policy" {
  name       = "InstanceRegisterCWLogsPolicy"
  description = "log-policy"
  policy     = <<EOF
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Effect": "Allow",
            "Action": [
                "logs:CreateLogGroup",
                "logs:CreateLogStream",
                "logs:DescribeLogGroups",
                "logs:DescribeLogStreams",
                "logs:PutLogEvents"
            ],
            "Resource": "arn:aws:logs:*:*:*"
        }
    ]
}
EOF
}

resource "aws_iam_role_policy_attachment" "log-policy-attach" {
  role       = "${aws_iam_role.ec2.name}"
  policy_arn = "${aws_iam_policy.log-policy.arn}"
}

resource "aws_iam_policy" "sns-policy" {
  name       = "InstanceRegisterSNSPolicy"
  description = "sns-policy"
  policy     = <<EOF
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Action": [
                "sns:CreateTopic",
                "sns:DeleteTopic",
                "sns:ListSubscriptionsByTopic",
                "sns:Publish",
                "sns:Subscribe"
            ],
            "Effect": "Allow",
            "Resource": "arn:aws:sns:*:*:*"
        }
    ]
}
EOF
}

resource "aws_iam_role_policy_attachment" "sns-policy-attach" {
  role       = "${aws_iam_role.ec2.name}"
  policy_arn = "${aws_iam_policy.sns-policy.arn}"
}

resource "aws_iam_instance_profile" "insreg_profile" {
  name = "instanceregister-elasticbeanstalk-ec2-role"
  role = "${aws_iam_role.ec2.name}"
}


# The elastic beanstalk application
resource "aws_elastic_beanstalk_application" "instance-register" {
  name = "instanceregistration"
  description = "Instance_Registration"
}

resource "aws_s3_bucket" "default" {
  bucket = "instance-register-bucket"
}

resource "aws_s3_bucket_object" "default" {
  bucket = "${aws_s3_bucket.default.id}"
  key    = "ins-reg-beanstalk-zipfile"
  source = "/home/kpunn/instanceregister-23.zip"
}

resource "aws_elastic_beanstalk_application_version" "default" {
  #name        = "latest"
  name        = "instanceregister-02"
  application = "${aws_elastic_beanstalk_application.instance-register.name}"
  description = "application version created by terraform for instance register"
  bucket      = "${aws_s3_bucket.default.id}"
  key         = "${aws_s3_bucket_object.default.id}"
}

# The test environment
resource "aws_elastic_beanstalk_environment" "instance-register-env" {
  name                  = "Instance-Register-Env"
  application           = "${aws_elastic_beanstalk_application.instance-register.name}"
  version_label         = "${aws_elastic_beanstalk_application_version.default.name}"
  solution_stack_name   = "64bit Amazon Linux 2018.03 v2.11.0 running Go 1.12.1"
  tier                  = "WebServer"
  tags {
       name = "Instance-Register"
  }

  # This is the VPC that the instances will use.
  setting {
    namespace = "aws:ec2:vpc"
    name      = "VPCId"
    value     = "${var.vpcid}"
  }
   setting {
    namespace = "aws:ec2:vpc"
    name      = "Subnets"
    #value     = "${var.subnetsid}"
    value     = "${join(",", var.subnetsid)}"
  }
   setting {
    namespace = "aws:ec2:vpc"
    name      = "ELBSubnets"
    #value     = "${var.subnetsid}"
    value     = "${join(",", var.subnetsid)}"
  }
   setting {
    namespace = "aws:ec2:vpc"
    name      = "AssociatePublicIpAddress"
    value     = "true"
  }



  setting {
    namespace = "aws:elasticbeanstalk:environment"
    name      = "servicerole"
    value     = "${aws_iam_role.service.name}"
  }

   setting {
    namespace = "aws:elasticbeanstalk:environment"
    name      = "EnvironmentType"
    value     = "LoadBalanced"
  }
  setting {
    namespace = "aws:autoscaling:launchconfiguration"
    name      = "IamInstanceProfile"
    value     = "${aws_iam_instance_profile.insreg_profile.name}"
  }
  setting {
    namespace = "aws:autoscaling:launchconfiguration"
    name      = "InstanceType"
    value     = "t2.micro"
  }
  setting {
    namespace = "aws:autoscaling:launchconfiguration"
    name      = "ImageId"
    value     = "ami-02d1625a9af32f584"
  }
  setting {
    namespace = "aws:elb:loadbalancer"
    name      = "CrossZone"
    value     = "true"
  }
  setting {
    namespace = "aws:autoscaling:asg"
    name      = "Availability Zones"
    value     = "Any 2"
  }

  setting {
    namespace = "aws:autoscaling:asg"
    name      = "MinSize"
    value     = "2"
  }
  setting {
    namespace = "aws:autoscaling:asg"
    name      = "MaxSize"
    value     = "4"
  }
  setting {
    namespace = "aws:elasticbeanstalk:application"
    name      = "Application Healthcheck URL"
    value     = "/register/api/healthcheck"
  }
  setting {
    namespace = "aws:elasticbeanstalk:cloudwatch:logs"
    name      = "RetentionInDays"
    value     = "30"
  }
  setting {
    namespace = "aws:elasticbeanstalk:cloudwatch:logs"
    name      = "DeleteOnTerminate"
    value     = "false"
  }
  setting {
    namespace = "aws:elasticbeanstalk:application:environment"
    name      = "ALERT_EMAIL_SUBSCRIBERS"
    value     = "instancereg@sonicwall.com,webmaster@sonicwall.com"
  }
  setting {
    namespace = "aws:elasticbeanstalk:application:environment"
    name      = "ALERT_SMS_SUBSCRIBERS"
    value     = "4412345678,+01987654321"
  }
  #setting {
  #  namespace = "aws:elb:loadbalancer"
  #  name      = "SecurityGroups"
  #  value     = "${join(",", var.loadbalancer_security_groups)}"
  #}
  #setting {
  #  namespace = "aws:elb:loadbalancer"
  #  name      = "ManagedSecurityGroup"
  #  value     = "${var.loadbalancer_managed_security_group}"
  #}
}
