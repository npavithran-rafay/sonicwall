
#-----------------------------------------------#
#save the state file to s3 bucket               #
#-----------------------------------------------#
# terraform {
#   # The configuration for this backend will be filled in by Terragrunt
#   backend "s3" {}
# }


############################################
## IAM role and Policy creation step      ##
############################################


resource "aws_iam_role" "iam_role_firehose" {
  name = "${var.iam_role_name}"
  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": "sts:AssumeRole",
      "Principal": {
        "Service": [
          "firehose.amazonaws.com",
          "redshift.amazonaws.com"
        ]
      },
      "Effect": "Allow",
      "Sid": ""
    }
  ]
}
EOF
}

# resource "aws_iam_role_policy" "firehose_role_policy" {
#    name = "${var.iam_role_policy_name}"
#    role = "${aws_iam_role.iam_role_firehose.id}"
#    policy = <<EOF
# {
#     "Version": "2012-10-17",
#     "Statement": [
#         {
#             "Sid": "",
#             "Effect": "Allow",
#             "Action": [
#                 "glue:GetTable",
#                 "glue:GetTableVersion",
#                 "glue:GetTableVersions"
#             ],
#             "Resource": "*"
#         },
#         {
#             "Sid": "",
#             "Effect": "Allow",
#             "Action": [
#                 "s3:AbortMultipartUpload",
#                 "s3:GetBucketLocation",
#                 "s3:GetObject",
#                 "s3:ListBucket",
#                 "s3:ListBucketMultipartUploads",
#                 "s3:PutObject"
#             ],
#             "Resource": [
#                 "${aws_s3_bucket.s3_bucket.arn}",
#                 "${aws_s3_bucket.s3_bucket.arn}/*",
#                 "arn:aws:s3:::%FIREHOSE_BUCKET_NAME%",
#                 "arn:aws:s3:::%FIREHOSE_BUCKET_NAME%/*"
#             ]
#         },
#         {
#             "Sid": "",
#             "Effect": "Allow",
#             "Action": [
#                 "lambda:InvokeFunction",
#                 "lambda:GetFunctionConfiguration"
#             ],
#             "Resource": "arn:aws:lambda:eu-central-1:94XXXXXXXXX59:function:%FIREHOSE_DEFAULT_FUNCTION%:%FIREHOSE_DEFAULT_VERSION%"
#         },
#         {
#             "Sid": "",
#             "Effect": "Allow",
#             "Action": [
#                 "logs:PutLogEvents"
#             ],
#             "Resource": [
#                 "arn:aws:logs:eu-central-1:94XXXXXXXXX59:log-group:/aws/kinesisfirehose/*:*"
#             ]
#         },
#         {
#             "Sid": "",
#             "Effect": "Allow",
#             "Action": [
#                 "kinesis:DescribeStream",
#                 "kinesis:GetShardIterator",
#                 "kinesis:GetRecords",
#                 "kinesis:ListShards"
#             ],
#             "Resource": "arn:aws:kinesis:eu-central-1:94XXXXXXXXX59:stream/%FIREHOSE_STREAM_NAME%"
#         },
#         {
#             "Effect": "Allow",
#             "Action": [
#                 "kms:Decrypt"
#             ],
#             "Resource": [
#                 "arn:aws:kms:eu-central-1:94XXXXXXXXX59:key/%SSE_KEY_ID%"
#             ],
#             "Condition": {
#                 "StringEquals": {
#                     "kms:ViaService": "kinesis.%REGION_NAME%.amazonaws.com"
#                 },
#                 "StringLike": {
#                     "kms:EncryptionContext:aws:kinesis:arn": "arn:aws:kinesis:%REGION_NAME%:94XXXXXXXXX59:stream/%FIREHOSE_STREAM_NAME%"
#                 }
#             }
#         }
#     ]
# }
# EOF
# }

#above is the original sonicwall policy, creating the same policy below with workaround for testing by rafay
resource "aws_iam_role_policy" "firehose_role_policy" {
   name = "${var.iam_role_policy_name}"
   role = "${aws_iam_role.iam_role_firehose.id}"
   policy = <<EOF
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Sid": "",
            "Effect": "Allow",
            "Action": [
                "glue:GetTable",
                "glue:GetTableVersion",
                "glue:GetTableVersions"
            ],
            "Resource": "*"
        },
        {
            "Sid": "",
            "Effect": "Allow",
            "Action": [
                "s3:AbortMultipartUpload",
                "s3:GetBucketLocation",
                "s3:GetObject",
                "s3:ListBucket",
                "s3:ListBucketMultipartUploads",
                "s3:PutObject"
            ],
            "Resource": [
                "${aws_s3_bucket.s3_bucket.arn}",
                "${aws_s3_bucket.s3_bucket.arn}/*",
                "arn:aws:s3:::${var.bucketname}",
                "arn:aws:s3:::${var.bucketname}/*"
            ]
        },
        {
            "Sid": "",
            "Effect": "Allow",
            "Action": [
                "lambda:InvokeFunction",
                "lambda:GetFunctionConfiguration"
            ],
            "Resource": "arn:aws:lambda:${var.region}:940810875359:function:*:*"
        },
        {
            "Sid": "",
            "Effect": "Allow",
            "Action": [
                "logs:PutLogEvents"
            ],
            "Resource": [
                "arn:aws:logs:${var.region}:940810875359:log-group:/aws/kinesisfirehose/*:*"
            ]
        },
        {
            "Sid": "",
            "Effect": "Allow",
            "Action": [
                "kinesis:DescribeStream",
                "kinesis:GetShardIterator",
                "kinesis:GetRecords",
                "kinesis:ListShards"
            ],
            "Resource": "arn:aws:kinesis:${var.region}:940810875359:stream/*"
        },
        {
            "Effect": "Allow",
            "Action": [
                "kms:Decrypt"
            ],
            "Resource": [
                "arn:aws:kms:${var.region}:940810875359:key/*"
            ],
            "Condition": {
                "StringEquals": {
                    "kms:ViaService": "kinesis.${var.region}.amazonaws.com"
                },
                "StringLike": {
                    "kms:EncryptionContext:aws:kinesis:arn": "arn:aws:kinesis:${var.region}:940810875359:stream/*"
                }
            }
        }
    ]
}
EOF
}




#############################################################
##Policy attachment to Eks-worker-role for firehose access ##
#############################################################

resource "aws_iam_policy" "ekspolicy" {
  name        = "Firehose_write_access_for_FRA_EKS_Node_IAM_role"
  description = "Firehose write access to NSM delivery streams for EKS Node IAM role"

  policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Sid": "VisualEditor0",
      "Effect": "Allow",
      "Action": [
          "firehose:DeleteDeliveryStream",
          "firehose:PutRecord",
          "firehose:StartDeliveryStreamEncryption",
          "firehose:CreateDeliveryStream",
          "firehose:PutRecordBatch",
          "firehose:StopDeliveryStreamEncryption",
          "firehose:TagDeliveryStream",
          "firehose:UpdateDestination",
         "firehose:UntagDeliveryStream"
      ],
      "Resource": "${var.arn_deliverystream}"
    }
  ]
}
EOF
}


resource "aws_iam_role_policy_attachment" "eksfirehose-attach" {
  role       = "fra-eks-workernode-role"
  policy_arn = "${aws_iam_policy.ekspolicy.arn}"
}

################################################################
##Policy attachment to Eks-worker-role for S3 readonly access ##
################################################################


data "aws_iam_policy" "AmazonS3ReadOnlyAccess" {
  arn = "arn:aws:iam::aws:policy/AmazonS3ReadOnlyAccess"
}


resource "aws_iam_role_policy_attachment" "AmazonS3-readonly-role-policy-attach" {
  role       = "fra-eks-workernode-role"
  policy_arn = "${data.aws_iam_policy.AmazonS3ReadOnlyAccess.arn}"
}


#####################################
## AWS S3 creation step            ##
#####################################


resource "aws_s3_bucket" "s3_bucket" {
  //
  bucket = "${var.bucketname}"
  //Access Connect List
  acl    = "${var.acl}"
  force_destroy = true
  lifecycle {
     prevent_destroy = false
  }
}


##########################################
##Modules for creating firehose streams ##
##########################################


module "gms-application" {
  source                  = "../../../modules/infrastructure/kinesis_firehose"
  iam_role_name           = "firehose_delivery_role"
  iam_role_policy_name    = "pipeline_test_role_policy"
  role_arn                = "${aws_iam_role.iam_role_firehose.arn}"
  log_grp_name            = "/aws/kinesisfirehose/gms-application"
  bucketname              = "${var.bucketname}"
  bucket_arn              = "${aws_s3_bucket.s3_bucket.arn}"
  acl                     = "${var.acl}"
  destination             = "${var.destination}"
  s3isenabled             = true
  isenabled               = true
  clusterjdbc             = "${var.clusterjdbc}"
  master_username         = "${var.master_username}"
  master_password         = "${var.master_password}"
  firehosename            = "${var.firehosename1}"
  data_table_name         = "${var.datatablename1}"
  copy_options            = "${var.copy_options}"
  bu                      = "${var.bu}"
  application             = "${var.application}"
  tag_environment         = "${var.tag_environment}"
  tag_region              = "${var.tag_region}"
}

module "gms-user_by_session" {
  source                  = "../../../modules/infrastructure/kinesis_firehose"
  iam_role_name           = "firehose_delivery_role"
  iam_role_policy_name    = "pipeline_test_role_policy"
  log_grp_name            = "/aws/kinesisfirehose/gms-user_by_session"
  bucketname              = "${var.bucketname}"
  acl                     = "${var.acl}"
  destination             = "${var.destination}"
  s3isenabled             = true
  isenabled               = true
  clusterjdbc             = "${var.clusterjdbc}"
  master_username         = "${var.master_username}"
  master_password         = "${var.master_password}"
  firehosename            = "${var.firehosename2}"
  data_table_name         = "${var.datatablename2}"
  copy_options            = "${var.copy_options}"
  role_arn                = "${aws_iam_role.iam_role_firehose.arn}"
  bucket_arn              = "${aws_s3_bucket.s3_bucket.arn}"
  bu                      = "${var.bu}"
  application             = "${var.application}"
  tag_environment         = "${var.tag_environment}"
  tag_region              = "${var.tag_region}"
}

module "gms-user_by_received" {
  source                  = "../../../modules/infrastructure/kinesis_firehose"
  iam_role_name           = "firehose_delivery_role"
  iam_role_policy_name    = "pipeline_test_role_policy"
  log_grp_name            = "/aws/kinesisfirehose/gms-user_by_received"
  role_arn                = "${aws_iam_role.iam_role_firehose.arn}"
  bucket_arn              = "${aws_s3_bucket.s3_bucket.arn}"
  bucketname              = "${var.bucketname}"
  acl                     = "${var.acl}"
  destination             = "${var.destination}"
  s3isenabled             = true
  isenabled               = true
  clusterjdbc             = "${var.clusterjdbc}"
  master_username         = "${var.master_username}"
  master_password         = "${var.master_password}"
  firehosename            = "${var.firehosename3}"
  data_table_name         = "${var.datatablename3}"
  copy_options            = "${var.copy_options}"
  bu                      = "${var.bu}"
  application             = "${var.application}"
  tag_environment         = "${var.tag_environment}"
  tag_region              = "${var.tag_region}"
}

module "gms-user_by_sent" {
  source                  = "../../../modules/infrastructure/kinesis_firehose"
  iam_role_name           = "firehose_delivery_role"
  iam_role_policy_name    = "pipeline_test_role_policy"
  role_arn                = "${aws_iam_role.iam_role_firehose.arn}"
  bucket_arn              = "${aws_s3_bucket.s3_bucket.arn}"
  log_grp_name            = "/aws/kinesisfirehose/gms-user_by_sent"
  bucketname              = "${var.bucketname}"
  acl                     = "${var.acl}"
  destination             = "${var.destination}"
  s3isenabled             = true
  isenabled               = true
  clusterjdbc             = "${var.clusterjdbc}"
  master_username         = "${var.master_username}"
  master_password         = "${var.master_password}"
  firehosename            = "${var.firehosename4}"
  data_table_name         = "${var.datatablename4}"
  copy_options            = "${var.copy_options}"
  bu                      = "${var.bu}"
  application             = "${var.application}"
  tag_environment         = "${var.tag_environment}"
  tag_region              = "${var.tag_region}"
}

module "gms-address_by_session" {
  source                  = "../../../modules/infrastructure/kinesis_firehose"
  iam_role_name           = "firehose_delivery_role"
  role_arn                = "${aws_iam_role.iam_role_firehose.arn}"
  # role_arn                = "${aws_iam_role.iam_role_firehose.arn}"
  bucket_arn              = "${aws_s3_bucket.s3_bucket.arn}"  
  iam_role_policy_name    = "pipeline_test_role_policy"
  log_grp_name            = "/aws/kinesisfirehose/gms-address_by_session"
  bucketname              = "${var.bucketname}"
  acl                     = "${var.acl}"
  destination             = "${var.destination}"
  s3isenabled             = true
  isenabled               = true
  clusterjdbc             = "${var.clusterjdbc}"
  master_username         = "${var.master_username}"
  master_password         = "${var.master_password}"
  firehosename            = "${var.firehosename5}"
  data_table_name         = "${var.datatablename5}"
  copy_options            = "${var.copy_options}"
  bu                      = "${var.bu}"
  application             = "${var.application}"
  tag_environment         = "${var.tag_environment}"
  tag_region              = "${var.tag_region}"
}

module "gms-address_by_received" {
  source                  = "../../../modules/infrastructure/kinesis_firehose"
  iam_role_name           = "firehose_delivery_role"
  iam_role_policy_name    = "pipeline_test_role_policy"
  log_grp_name            = "/aws/kinesisfirehose/gms-address_by_received"
  bucketname              = "${var.bucketname}"
  acl                     = "${var.acl}"
  destination             = "${var.destination}"
  role_arn                = "${aws_iam_role.iam_role_firehose.arn}"
  bucket_arn              = "${aws_s3_bucket.s3_bucket.arn}"
  s3isenabled             = true
  isenabled               = true
  clusterjdbc             = "${var.clusterjdbc}"
  master_username         = "${var.master_username}"
  master_password         = "${var.master_password}"
  firehosename            = "${var.firehosename6}"
  data_table_name         = "${var.datatablename6}"
  copy_options            = "${var.copy_options}"
  bu                      = "${var.bu}"
  application             = "${var.application}"
  tag_environment         = "${var.tag_environment}"
  tag_region              = "${var.tag_region}"
}

module "gms-address_by_sent" {
  source                  = "../../../modules/infrastructure/kinesis_firehose"
  iam_role_name           = "firehose_delivery_role"
  iam_role_policy_name    = "pipeline_test_role_policy"
  log_grp_name            = "/aws/kinesisfirehose/gms-address_by_sent"
  bucketname              = "${var.bucketname}"
  role_arn                = "${aws_iam_role.iam_role_firehose.arn}"
  bucket_arn              = "${aws_s3_bucket.s3_bucket.arn}"
  acl                     = "${var.acl}"
  destination             = "${var.destination}"
  s3isenabled             = true
  isenabled               = true
  clusterjdbc             = "${var.clusterjdbc}"
  master_username         = "${var.master_username}"
  master_password         = "${var.master_password}"
  firehosename            = "${var.firehosename7}"
  data_table_name         = "${var.datatablename7}"
  copy_options            = "${var.copy_options}"
  bu                      = "${var.bu}"
  application             = "${var.application}"
  tag_environment         = "${var.tag_environment}"
  tag_region              = "${var.tag_region}"
}

module "gms-location" {
  source                  = "../../../modules/infrastructure/kinesis_firehose"
  iam_role_name           = "firehose_delivery_role"
  iam_role_policy_name    = "pipeline_test_role_policy"
  log_grp_name            = "/aws/kinesisfirehose/gms-location"
  role_arn                = "${aws_iam_role.iam_role_firehose.arn}"
  bucket_arn              = "${aws_s3_bucket.s3_bucket.arn}"
  bucketname              = "${var.bucketname}"
  acl                     = "${var.acl}"
  destination             = "${var.destination}"
  s3isenabled             = true
  isenabled               = true
  clusterjdbc             = "${var.clusterjdbc}"
  master_username         = "${var.master_username}"
  master_password         = "${var.master_password}"
  firehosename            = "${var.firehosename8}"
  data_table_name         = "${var.datatablename8}"
  copy_options            = "${var.copy_options}"
  bu                      = "${var.bu}"
  application             = "${var.application}"
  tag_environment         = "${var.tag_environment}"
  tag_region              = "${var.tag_region}"
}

module "gms-domain" {
  source                  = "../../../modules/infrastructure/kinesis_firehose"
  iam_role_name           = "firehose_delivery_role"
  iam_role_policy_name    = "pipeline_test_role_policy"
  role_arn                = "${aws_iam_role.iam_role_firehose.arn}"
  bucket_arn              = "${aws_s3_bucket.s3_bucket.arn}"
  log_grp_name            = "/aws/kinesisfirehose/gms-domain"
  bucketname              = "${var.bucketname}"
  acl                     = "${var.acl}"
  destination             = "${var.destination}"
  s3isenabled             = true
  isenabled               = true
  clusterjdbc             = "${var.clusterjdbc}"
  master_username         = "${var.master_username}"
  master_password         = "${var.master_password}"
  firehosename            = "${var.firehosename9}"
  data_table_name         = "${var.datatablename9}"
  copy_options            = "${var.copy_options}"
  bu                      = "${var.bu}"
  application             = "${var.application}"
  tag_environment         = "${var.tag_environment}"
  tag_region              = "${var.tag_region}"
}

module "gms-virus" {
  source                  = "../../../modules/infrastructure/kinesis_firehose"
  iam_role_name           = "firehose_delivery_role"
  iam_role_policy_name    = "pipeline_test_role_policy"
  log_grp_name            = "/aws/kinesisfirehose/gms-virus"
  role_arn                = "${aws_iam_role.iam_role_firehose.arn}"
  bucket_arn              = "${aws_s3_bucket.s3_bucket.arn}"
  bucketname              = "${var.bucketname}"
  acl                     = "${var.acl}"
  destination             = "${var.destination}"
  s3isenabled             = true
  isenabled               = true
  clusterjdbc             = "${var.clusterjdbc}"
  master_username         = "${var.master_username}"
  master_password         = "${var.master_password}"
  firehosename            = "${var.firehosename10}"
  data_table_name         = "${var.datatablename10}"
  copy_options            = "${var.copy_options}"
  bu                      = "${var.bu}"
  application             = "${var.application}"
  tag_environment         = "${var.tag_environment}"
  tag_region              = "${var.tag_region}"
}

module "gms-intrusion" {
  source                  = "../../../modules/infrastructure/kinesis_firehose"
  iam_role_name           = "firehose_delivery_role"
  iam_role_policy_name    = "pipeline_test_role_policy"
  log_grp_name            = "/aws/kinesisfirehose/gms-intrusion"
  bucketname              = "${var.bucketname}"
  role_arn                = "${aws_iam_role.iam_role_firehose.arn}"
  bucket_arn              = "${aws_s3_bucket.s3_bucket.arn}"
  acl                     = "${var.acl}"
  destination             = "${var.destination}"
  s3isenabled             = true
  isenabled               = true
  clusterjdbc             = "${var.clusterjdbc}"
  master_username         = "${var.master_username}"
  master_password         = "${var.master_password}"
  firehosename            = "${var.firehosename11}"
  data_table_name         = "${var.datatablename11}"
  copy_options            = "${var.copy_options}"
  bu                      = "${var.bu}"
  application             = "${var.application}"
  tag_environment         = "${var.tag_environment}"
  tag_region              = "${var.tag_region}"
}

module "gms-spyware" {
  source                  = "../../../modules/infrastructure/kinesis_firehose"
  iam_role_name           = "firehose_delivery_role"
  iam_role_policy_name    = "pipeline_test_role_policy"
  log_grp_name            = "/aws/kinesisfirehose/gms-spyware"
  bucketname              = "${var.bucketname}"
  role_arn                = "${aws_iam_role.iam_role_firehose.arn}"
  bucket_arn              = "${aws_s3_bucket.s3_bucket.arn}"
  acl                     = "${var.acl}"
  destination             = "${var.destination}"
  s3isenabled             = true
  isenabled               = true
  clusterjdbc             = "${var.clusterjdbc}"
  master_username         = "${var.master_username}"
  master_password         = "${var.master_password}"
  firehosename            = "${var.firehosename12}"
  data_table_name         = "${var.datatablename12}"
  copy_options            = "${var.copy_options}"
  bu                      = "${var.bu}"
  application             = "${var.application}"
  tag_environment         = "${var.tag_environment}"
  tag_region              = "${var.tag_region}"
}

module "gms-fw_info" {
  source                  = "../../../modules/infrastructure/kinesis_firehose"
  iam_role_name           = "firehose_delivery_role"
  iam_role_policy_name    = "pipeline_test_role_policy"
  log_grp_name            = "/aws/kinesisfirehose/gms-fw_info"
  bucketname              = "${var.bucketname}"
  acl                     = "${var.acl}"
  destination             = "${var.destination}"
  role_arn                = "${aws_iam_role.iam_role_firehose.arn}"
  bucket_arn              = "${aws_s3_bucket.s3_bucket.arn}"
  s3isenabled             = true
  isenabled               = true
  clusterjdbc             = "${var.clusterjdbc}"
  master_username         = "${var.master_username}"
  master_password         = "${var.master_password}"
  firehosename            = "${var.firehosename13}"
  data_table_name         = "${var.datatablename13}"
  copy_options            = "${var.copy_options1}"
  bu                      = "${var.bu}"
  application             = "${var.application}"
  tag_environment         = "${var.tag_environment}"
  tag_region              = "${var.tag_region}"
}

module "gms-capture_atp_info" {
  source                  = "../../../modules/infrastructure/kinesis_firehose"
  iam_role_name           = "firehose_delivery_role"
  iam_role_policy_name    = "pipeline_test_role_policy"
  log_grp_name            = "/aws/kinesisfirehose/gms-capture_atp_info"
  bucketname              = "${var.bucketname}"
  acl                     = "${var.acl}"
  destination             = "${var.destination}"
  role_arn                = "${aws_iam_role.iam_role_firehose.arn}"
  bucket_arn              = "${aws_s3_bucket.s3_bucket.arn}"
  s3isenabled             = true
  isenabled               = true
  clusterjdbc             = "${var.clusterjdbc}"
  master_username         = "${var.master_username}"
  master_password         = "${var.master_password}"
  firehosename            = "${var.firehosename14}"
  data_table_name         = "${var.datatablename14}"
  copy_options            = "${var.copy_options1}"
  bu                      = "${var.bu}"
  application             = "${var.application}"
  tag_environment         = "${var.tag_environment}"
  tag_region              = "${var.tag_region}"
}

module "gms-dpi_ssl_info" {
  source                  = "../../../modules/infrastructure/kinesis_firehose"
  iam_role_name           = "firehose_delivery_role"
  iam_role_policy_name    = "pipeline_test_role_policy"
  log_grp_name            = "/aws/kinesisfirehose/gms-dpi_ssl_info"
  bucketname              = "${var.bucketname}"
  role_arn                = "${aws_iam_role.iam_role_firehose.arn}"
  bucket_arn              = "${aws_s3_bucket.s3_bucket.arn}"
  acl                     = "${var.acl}"
  destination             = "${var.destination}"
  s3isenabled             = true
  isenabled               = true
  clusterjdbc             = "${var.clusterjdbc}"
  master_username         = "${var.master_username}"
  master_password         = "${var.master_password}"
  firehosename            = "${var.firehosename15}"
  data_table_name         = "${var.datatablename15}"
  copy_options            = "${var.copy_options1}"
  bu                      = "${var.bu}"
  application             = "${var.application}"
  tag_environment         = "${var.tag_environment}"
  tag_region              = "${var.tag_region}"
}

module "gms-connection_info" {
  source                  = "../../../modules/infrastructure/kinesis_firehose"
  iam_role_name           = "firehose_delivery_role"
  iam_role_policy_name    = "pipeline_test_role_policy"
  log_grp_name            = "/aws/kinesisfirehose/gms-connection_info"
  bucketname              = "${var.bucketname}"
  role_arn                = "${aws_iam_role.iam_role_firehose.arn}"
  bucket_arn              = "${aws_s3_bucket.s3_bucket.arn}"
  acl                     = "${var.acl}"
  destination             = "${var.destination}"
  s3isenabled             = true
  isenabled               = true
  clusterjdbc             = "${var.clusterjdbc}"
  master_username         = "${var.master_username}"
  master_password         = "${var.master_password}"
  firehosename            = "${var.firehosename16}"
  data_table_name         = "${var.datatablename16}"
  copy_options            = "${var.copy_options1}"
  bu                      = "${var.bu}"
  application             = "${var.application}"
  tag_environment         = "${var.tag_environment}"
  tag_region              = "${var.tag_region}"
}

module "gms-bandwidth_info" {
  source                  = "../../../modules/infrastructure/kinesis_firehose"
  iam_role_name           = "firehose_delivery_role"
  iam_role_policy_name    = "pipeline_test_role_policy"
  log_grp_name            = "/aws/kinesisfirehose/gms-bandwidth_info"
  bucketname              = "${var.bucketname}"
  role_arn                = "${aws_iam_role.iam_role_firehose.arn}"
  bucket_arn              = "${aws_s3_bucket.s3_bucket.arn}"
  acl                     = "${var.acl}"
  destination             = "${var.destination}"
  s3isenabled             = true
  isenabled               = true
  clusterjdbc             = "${var.clusterjdbc}"
  master_username         = "${var.master_username}"
  master_password         = "${var.master_password}"
  firehosename            = "${var.firehosename17}"
  data_table_name         = "${var.datatablename17}"
  copy_options            = "${var.copy_options1}"
  bu                      = "${var.bu}"
  application             = "${var.application}"
  tag_environment         = "${var.tag_environment}"
  tag_region              = "${var.tag_region}"
}

module "gms-botnet" {
  source                  = "../../../modules/infrastructure/kinesis_firehose"
  iam_role_name           = "firehose_delivery_role"
  iam_role_policy_name    = "pipeline_test_role_policy"
  log_grp_name            = "/aws/kinesisfirehose/gms-botnet"
  bucketname              = "${var.bucketname}"
  acl                     = "${var.acl}"
  role_arn                = "${aws_iam_role.iam_role_firehose.arn}"
  bucket_arn              = "${aws_s3_bucket.s3_bucket.arn}"
  destination             = "${var.destination}"
  s3isenabled             = true
  isenabled               = true
  clusterjdbc             = "${var.clusterjdbc}"
  master_username         = "${var.master_username}"
  master_password         = "${var.master_password}"
  firehosename            = "${var.firehosename18}"
  data_table_name         = "${var.datatablename18}"
  copy_options            = "${var.copy_options1}"
  bu                      = "${var.bu}"
  application             = "${var.application}"
  tag_environment         = "${var.tag_environment}"
  tag_region              = "${var.tag_region}"
}

module "gms-rating" {
  source                  = "../../../modules/infrastructure/kinesis_firehose"
  iam_role_name           = "firehose_delivery_role"
  iam_role_policy_name    = "pipeline_test_role_policy"
  log_grp_name            = "/aws/kinesisfirehose/gms-rating"
  bucketname              = "${var.bucketname}"
  acl                     = "${var.acl}"
  destination             = "${var.destination}"
  s3isenabled             = true
  role_arn                = "${aws_iam_role.iam_role_firehose.arn}"
  bucket_arn              = "${aws_s3_bucket.s3_bucket.arn}"
  isenabled               = true
  clusterjdbc             = "${var.clusterjdbc}"
  master_username         = "${var.master_username}"
  master_password         = "${var.master_password}"
  firehosename            = "${var.firehosename19}"
  data_table_name         = "${var.datatablename19}"
  copy_options            = "${var.copy_options}"
  bu                      = "${var.bu}"
  application             = "${var.application}"
  tag_environment         = "${var.tag_environment}"
  tag_region              = "${var.tag_region}"
}

