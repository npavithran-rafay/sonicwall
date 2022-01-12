#----------------------------------#
#Store the state file in S3 Bucket #
#----------------------------------#
# terraform {
#   # The configuration for this backend will be filled in by Terragrunt
#   backend "s3" {}
# }

#---------------------------------------------------------#
# Create a custome IAM role to attach with lamda function #
#---------------------------------------------------------#

data "aws_caller_identity" "current" { }

resource "aws_iam_role" "iam_for_lambda" {
  name                  = "iam_for_${var.function_name}"
  force_detach_policies = true
  assume_role_policy    = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
      {
      "Action": "sts:AssumeRole",
      "Principal": {
        "Service": "lambda.amazonaws.com"
      },
      "Effect": "Allow",
      "Sid": ""
    }
  ]
}
EOF
}

resource "aws_iam_role_policy" "lambda_cloudwatch_policy" {
  name = "IAM-policy-${var.function_name}-cloudwatch"
  role = aws_iam_role.iam_for_lambda.name

  policy = <<-EOF
  {
    "Version": "2012-10-17",
    "Statement": [
        {
            "Sid": "VisualEditor0",
            "Effect": "Allow",
            "Action": [
                "logs:CreateLogStream",
                "logs:CreateLogGroup",
                "logs:PutLogEvents"
            ],
            "Resource": "arn:aws:logs:*:*:*"
        },
        {
            "Sid": "VisualEditor1",
            "Effect": "Allow",
            "Action": [
                "cloudwatch:PutDashboard",
                "cloudwatch:PutMetricData",
                "secretsmanager:DescribeSecret",
                "cloudwatch:DeleteAlarms",
                "cloudwatch:DeleteInsightRules",
                "ses:GetEmailIdentity",
                "secretsmanager:GetRandomPassword",
                "cloudwatch:DescribeAlarmsForMetric",
                "cloudwatch:ListDashboards",
                "cloudwatch:ListTagsForResource",
                "cloudwatch:PutAnomalyDetector",
                "events:*",
                "ses:ListDeliverabilityTestReports",
                "ses:GetDedicatedIps",
                "cloudwatch:DescribeInsightRules",
                "cloudwatch:GetDashboard",
                "cloudwatch:GetInsightRuleReport",
                "cloudwatch:DisableInsightRules",
                "cloudwatch:GetMetricStatistics",
                "ses:GetConfigurationSetEventDestinations",
                "ses:GetAccount",
                "ses:GetBlacklistReports",
                "cloudwatch:DescribeAlarms",
                "ses:GetDeliverabilityTestReport",
                "secretsmanager:ListSecrets",
                "ses:GetDeliverabilityDashboardOptions",
                "cloudwatch:GetMetricData",
                "ses:ListTagsForResource",
                "cloudwatch:ListMetrics",
                "cloudwatch:DeleteAnomalyDetector",
                "ses:ListDedicatedIpPools",
                "secretsmanager:ListSecretVersionIds",
                "ses:ListEmailIdentities",
                "cloudwatch:DescribeAnomalyDetectors",
                "ses:ListConfigurationSets",
                "cloudwatch:DeleteDashboards",
                "cloudwatch:DescribeAlarmHistory",
                "secretsmanager:GetSecretValue",
                "ses:*",
                "cloudwatch:DisableAlarmActions",
                "ses:GetConfigurationSet",
                "cloudwatch:SetAlarmState",
                "cloudwatch:GetMetricWidgetImage",
                "cloudwatch:EnableInsightRules",
                "cloudwatch:PutCompositeAlarm",
                "cloudwatch:PutInsightRule",
                "cloudwatch:PutMetricAlarm",
                "secretsmanager:GetResourcePolicy",
                "cloudwatch:EnableAlarmActions",
                "ses:GetDedicatedIp",
                "ses:GetDomainStatisticsReport",
                "redshift-data:GetStatementResult",
                "redshift-data:ExecuteStatement",
                "redshift:GetClusterCredentials",
                "redshift:ExecuteQuery"
            ],
            "Resource": "*"
        }
    ]
  }
  EOF
}

resource "aws_iam_policy" "pipeline_policy" {
  name        = "DYNAMODB-DATAPIPELINE-${var.function_name}-POLICY"
  description = "Policy to replace some obselete IAM policies"

  policy = <<EOT
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Sid": "VisualEditor0",
            "Effect": "Allow",
            "Action": "iam:PassRole",
            "Resource": "*",
            "Condition": {
                "StringLike": {
                    "iam:PassedToService": [
                        "application-autoscaling.amazonaws.com",
                        "application-autoscaling.amazonaws.com.cn",
                        "dax.amazonaws.com"
                    ]
                }
            }
        },
        {
            "Sid": "VisualEditor1",
            "Effect": "Allow",
            "Action": "iam:CreateServiceLinkedRole",
            "Resource": "*",
            "Condition": {
                "StringEquals": {
                    "iam:AWSServiceName": [
                        "replication.dynamodb.amazonaws.com",
                        "dax.amazonaws.com",
                        "dynamodb.application-autoscaling.amazonaws.com",
                        "contributorinsights.dynamodb.amazonaws.com",
                        "kinesisreplication.dynamodb.amazonaws.com"
                    ]
                }
            }
        },
        {
            "Sid": "VisualEditor2",
            "Effect": "Allow",
            "Action": [
                "iam:PassRole",
                "cloudwatch:GetInsightRuleReport"
            ],
            "Resource": [
                "arn:aws:cloudwatch:*:*:insight-rule/DynamoDBContributorInsights*",
                "arn:aws:iam::*:role/DataPipelineDefaultResourceRole",
                "arn:aws:iam::*:role/DataPipelineDefaultRole"
            ]
        },
        {
            "Sid": "VisualEditor3",
            "Effect": "Allow",
            "Action": [
                "lambda:CreateFunction",
                "ec2:DescribeInstances",
                "cloudwatch:DeleteAlarms",
                "logs:StartQuery",
                "s3:Get*",
                "lambda:GetFunctionConfiguration",
                "s3:List*",
                "datapipeline:CreatePipeline",
                "sns:ListEndpointsByPlatformApplication",
                "kinesis:ListStreams",
                "ec2:StartInstances",
                "kinesis:DescribeStreamSummary",
                "sns:DeletePlatformApplication",
                "lambda:DeleteFunction",
                "sns:Subscribe",
                "sns:ConfirmSubscription",
                "logs:FilterLogEvents",
                "s3:DeleteObject",
                "iam:GetRole",
                "redshift:DescribeClusterSecurityGroups",
                "datapipeline:ListPipelines",
                "sns:ListSubscriptionsByTopic",
                "lambda:ListFunctions",
                "ec2:CreateTags",
                "sns:CreateTopic",
                "ec2:RunInstances",
                "application-autoscaling:DeleteScalingPolicy",
                "cloudwatch:GetMetricStatistics",
                "ec2:StopInstances",
                "resource-groups:CreateGroup",
                "dynamodb:GetShardIterator",
                "application-autoscaling:DescribeScalingPolicies",
                "cloudwatch:DescribeAlarms",
                "resource-groups:ListGroupResources",
                "datapipeline:ActivatePipeline",
                "ec2:DescribeSubnets",
                "lambda:DeleteEventSourceMapping",
                "iam:GetRolePolicy",
                "datapipeline:*",
                "sns:GetSMSAttributes",
                "tag:GetResources",
                "sns:ListTopics",
                "sns:CreatePlatformEndpoint",
                "datapipeline:DescribePipelines",
                "cloudwatch:ListMetrics",
                "iam:PassRole",
                "cloudwatch:DescribeAlarmHistory",
                "rds:DescribeDBInstances",
                "sns:GetTopicAttributes",
                "datapipeline:QueryObjects",
                "sns:CreatePlatformApplication",
                "sns:SetSMSAttributes",
                "iam:ListRoles",
                "dynamodb:DescribeStream",
                "logs:TestMetricFilter",
                "kinesis:DescribeStream",
                "sns:ListSubscriptions",
                "dynamodb:ListStreams",
                "ec2:DescribeSecurityGroups",
                "resource-groups:DeleteGroup",
                "ec2:DescribeVpcs",
                "kms:ListAliases",
                "logs:GetLogGroupFields",
                "sns:ListPlatformApplications",
                "logs:GetLogRecord",
                "dynamodb:*",
                "sns:Unsubscribe",
                "sns:OptInPhoneNumber",
                "sns:CheckIfPhoneNumberIsOptedOut",
                "sns:SetEndpointAttributes",
                "logs:CreateLogStream",
                "resource-groups:GetGroup",
                "dynamodb:DescribeTable",
                "cloudwatch:DescribeAlarmsForMetric",
                "logs:GetLogEvents",
                "sns:SetPlatformApplicationAttributes",
                "sns:ListTagsForResource",
                "application-autoscaling:RegisterScalableTarget",
                "dax:*",
                "sns:GetPlatformApplicationAttributes",
                "logs:StopQuery",
                "rds:DescribeDBSecurityGroups",
                "sns:GetSubscriptionAttributes",
                "logs:CreateLogGroup",
                "sns:DeleteEndpoint",
                "sns:ListPhoneNumbersOptedOut",
                "sns:GetEndpointAttributes",
                "logs:GetQueryResults",
                "application-autoscaling:PutScalingPolicy",
                "lambda:ListEventSourceMappings",
                "dynamodb:GetRecords",
                "resource-groups:GetGroupQuery",
                "cloudwatch:GetMetricData",
                "sns:DeleteTopic",
                "sns:SetTopicAttributes",
                "lambda:CreateEventSourceMapping",
                "logs:GetLogDelivery",
                "sns:Publish",
                "application-autoscaling:DescribeScalingActivities",
                "kms:DescribeKey",
                "datapipeline:PutPipelineDefinition",
                "ec2:TerminateInstances",
                "iam:GetInstanceProfile",
                "application-autoscaling:DescribeScalableTargets",
                "datapipeline:DescribeObjects",
                "resource-groups:ListGroups",
                "datapipeline:GetPipelineDefinition",
                "iam:ListInstanceProfiles",
                "logs:PutLogEvents",
                "cloudwatch:PutMetricAlarm",
                "sns:SetSubscriptionAttributes",
                "redshift:DescribeClusters",
                "lambda:*",
                "datapipeline:DeletePipeline",
                "elasticmapreduce:*",
                "application-autoscaling:DeregisterScalableTarget",
                "s3:Put*"
            ],
            "Resource": "*"
        }
    ]
}
EOT
}

resource "aws_iam_policy_attachment" "pipelinepolicy-attach" {
  name       = "pipeline-policy-attachment"
  roles      = [aws_iam_role.iam_for_lambda.name]
  policy_arn = aws_iam_policy.pipeline_policy.arn
}

resource "aws_iam_role_policy_attachment" "lambda_0" {
  role       = aws_iam_role.iam_for_lambda.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonS3FullAccess"
}

resource "aws_iam_role_policy_attachment" "lambda_1" {
  role       = aws_iam_role.iam_for_lambda.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonAthenaFullAccess"
}
resource "aws_iam_role_policy_attachment" "lambda_2" {
  role       = aws_iam_role.iam_for_lambda.name
  policy_arn = "arn:aws:iam::aws:policy/service-role/AmazonElasticMapReduceEditorsRole"
}

resource "aws_iam_role_policy_attachment" "lambda_3" {
  role       = aws_iam_role.iam_for_lambda.name
  policy_arn = "arn:aws:iam::aws:policy/service-role/AmazonElasticMapReduceRole"
}

resource "aws_iam_role_policy_attachment" "lambda_4" {
  role       = aws_iam_role.iam_for_lambda.name
  policy_arn = "arn:aws:iam::aws:policy/service-role/AmazonElasticMapReduceforEC2Role"
}

resource "aws_iam_role_policy_attachment" "lambda_8" {
  role       = aws_iam_role.iam_for_lambda.name
  policy_arn = "arn:aws:iam::aws:policy/AWSLambdaInvocation-DynamoDB"
}

resource "aws_iam_role_policy_attachment" "lambda_9" {
  role       = aws_iam_role.iam_for_lambda.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonElasticMapReduceFullAccess"
}

resource "aws_iam_role_policy_attachment" "lambda_10" {
  role       = aws_iam_role.iam_for_lambda.name
  policy_arn = "arn:aws:iam::aws:policy/service-role/AmazonElasticMapReduceforAutoScalingRole"
}
#------------------------#
# Create lambda function #
#------------------------#

module "lambda" {
  source             = "../../../modules/infrastructure/lambda_tf13"
  function_name      = var.function_name
  description        = var.description_analyzer
  handler            = var.handler
  runtime            = var.runtime
  memory_size        = var.memory_size
  concurrency        = var.concurrency
  lambda_timeout     = var.lambda_timeout
  layers             = [""]
  log_retention      = var.log_retention
  filename           = var.filename
  source_code_hash   = filebase64sha256("${path.module}/${var.filename}")
  role_arn           = aws_iam_role.iam_for_lambda.arn
  environment = {
     ATHENA_DATABASE        = var.ath_Athena_database
     ATHENA_OUTPUT_LOCATION = "s3://${var.ath_S3bucketname}/athena-query-results/"
     REDSHIFT_ENDPOINT      = var.rs_redshift_cluster_endpoint
     REDSHIFT_DATABASE      = var.rs_redshift_cluster_database_name
     REDSHIFT_PASSWD        = var.rs_redshift_password
     REDSHIFT_USER          = var.rs_redshift_username 
     REDSHIFT_PORT          = var.rs_redshift_cluster_port
  }
  tags = {
    Name            = var.function_name
    Application     = var.application
    Environment     = var.tag_environment
    BU              = var.bu
    Region          = var.tag_region
    Applicationtype = var.Applicationtype
  }
}

/*
module "lambda_schedulejobs" {
  source             = "../../../../modules/infrastructure/lambda_tf13"
  function_name      = "${var.prefix_analyzer}-analyzerng-schedulejobs-lambda"
  description        = var.description
  handler            = var.handler
  runtime            = var.runtime
  memory_size        = var.memory_size
  concurrency        = var.concurrency
  lambda_timeout     = var.lambda_timeout
  layers             = [""]
  log_retention      = var.log_retention
  filename           = var.schedulejobs_filename
  source_code_hash   = filebase64sha256("${path.module}/${var.schedulejobs_filename}")
  role_arn           = aws_iam_role.iam_for_lambda.arn
  environment = {
     bucket_name         = data.terraform_remote_state.s3.outputs.bucketname_jar
     config_filename     = "config/config.json"
     region              = var.region
  }
  tags = {
    Name            = "${var.prefix_analyzer}-analyzerng-schedulejobs-lambda"
    Application     = var.application
    Environment     = var.tag_environment
    BU              = var.bu
    Region          = var.tag_region
    Applicationtype = var.Applicationtype
  }
}

module "lambda_logparser" {
  source             = "../../../../modules/infrastructure/lambda_tf13"
  function_name      = "${var.prefix_analyzer}-analyzerng-logparser-lambda"
  description        = var.logparser_description
  handler            = var.handler
  runtime            = var.logparser_runtime
  memory_size        = var.memory_size
  concurrency        = var.concurrency
  lambda_timeout     = var.lambda_timeout
  layers             = [""]
  log_retention      = var.log_retention
  filename           = var.logparser_filename
  source_code_hash   = filebase64sha256("${path.module}/${var.logparser_filename}")
  role_arn           = aws_iam_role.iam_for_lambda.arn
  environment = {
     bucket_name         = data.terraform_remote_state.s3.outputs.bucketname_jar
     config_filename     = "config/config.json"
     lambda_name         = "${var.prefix_analyzer}-analyzerng-logparser-lambda"
     region              = var.region
     restart_lambda_name = "${var.prefix}-analyzerng-event-delete-dynamodb-tables-lambda"
  }
  tags = {
    Name            = "${var.prefix_analyzer}-analyzerng-logparser-lambda"
    Application     = var.application
    Environment     = var.tag_environment
    BU              = var.bu
    Region          = var.tag_region
    Applicationtype = var.Applicationtype
  }
}

module "lambda_logprocessor" {
  source             = "../../../../modules/infrastructure/lambda_tf13"
  function_name      = "${var.prefix_analyzer}-analyzerng-logprocessor-lambda"
  description        = var.logprocessor_description
  handler            = var.handler
  runtime            = var.logparser_runtime
  memory_size        = var.memory_size
  concurrency        = var.concurrency
  lambda_timeout     = var.lambda_timeout
  layers             = [""]
  log_retention      = var.log_retention
  filename           = var.logprocessor_filename
  source_code_hash   = filebase64sha256("${path.module}/${var.logprocessor_filename}")
  role_arn           = aws_iam_role.iam_for_lambda.arn
  environment = {
     bucket_name         = data.terraform_remote_state.s3.outputs.bucketname_jar
     config_filename     = "config/config.json"
     lambda_name         = "${var.prefix_analyzer}-analyzerng-logprocessor-lambda"
     region              = var.region
     restart_lambda_name = "${var.prefix_analyzer}-analyzerng-event-delete-dynamodb-tables-lambda"
  }
  tags = {
    Name            = "${var.prefix_analyzer}-analyzerng-logprocessor-lambda"
    Application     = var.application
    Environment     = var.tag_environment
    BU              = var.bu
    Region          = var.tag_region
    Applicationtype = var.Applicationtype
  }
}

module "lambda_realtimereport" {
  source             = "../../../../modules/infrastructure/lambda_tf13"
  function_name      = "${var.prefix_analyzer}-analyzerng-realtimereport-lambda"
  description        = var.realtimereport_description
  handler            = var.handler
  runtime            = var.logparser_runtime
  memory_size        = var.memory_size
  concurrency        = var.concurrency
  lambda_timeout     = var.lambda_timeout
  layers             = [""]
  log_retention      = var.log_retention
  filename           = var.realtimereport_filename
  source_code_hash   = filebase64sha256("${path.module}/${var.realtimereport_filename}")
  role_arn           = aws_iam_role.iam_for_lambda.arn
  environment = {
     bucket_name         = data.terraform_remote_state.s3.outputs.bucketname_jar
     config_filename     = "config/config.json"
     region              = var.region
  }
  tags = {
    Name            = "${var.prefix_analyzer}-analyzerng-realtimereport-lambda"
    Application     = var.application
    Environment     = var.tag_environment
    BU              = var.bu
    Region          = var.tag_region
    Applicationtype = var.Applicationtype
  }
}


module "lambda_bucketmonitor" {
  source             = "../../../../modules/infrastructure/lambda_tf13"
  function_name      = "${var.prefix_analyzer}-analyzerng-s3bucketmonitor-lambda"
  description        = var.s3bucketmonitor_description
  handler            = var.handler
  runtime            = var.logparser_runtime
  memory_size        = var.memory_size
  concurrency        = var.concurrency
  lambda_timeout     = var.lambda_timeout
  layers             = [""]
  log_retention      = var.log_retention
  filename           = var.s3bucketmonitor_filename
  source_code_hash   = filebase64sha256("${path.module}/${var.s3bucketmonitor_filename}")
  role_arn           = aws_iam_role.iam_for_lambda.arn
  environment = {
     bucket_name         = data.terraform_remote_state.s3.outputs.bucketname
     lambda_name         = "${var.prefix_analyzer}-analyzerng-s3bucketmonitor-lambda"
     region              = var.region
  }
  tags = {
    Name            = "${var.prefix_analyzer}-analyzerng-s3bucketmonitor-lambda"
    Application     = var.application
    Environment     = var.tag_environment
    BU              = var.bu
    Region          = var.tag_region
    Applicationtype = var.Applicationtype
  }
}

module "lambda_terminaterestartemr" {
  source             = "../../../../modules/infrastructure/lambda_tf13"
  function_name      = "${var.prefix_analyzer}-analyzerng-terminaterestartemr-lambda"
  description        = var.terminaterestartemr_description
  handler            = var.handler
  runtime            = var.logparser_runtime
  memory_size        = var.memory_size
  concurrency        = var.concurrency
  lambda_timeout     = var.lambda_timeout
  layers             = [""]
  log_retention      = var.log_retention
  filename           = var.terminaterestartemr_filename
  source_code_hash   = filebase64sha256("${path.module}/${var.terminaterestartemr_filename}")
  role_arn           = aws_iam_role.iam_for_lambda.arn
  environment = {
     recreate_freq_hours = "240"
     region              = var.region
  }
  tags = {
    Name            = "${var.prefix_analyzer}-analyzerng-terminaterestartemr-lambda"
    Application     = var.application
    Environment     = var.tag_environment
    BU              = var.bu
    Region          = var.tag_region
    Applicationtype = var.Applicationtype
  }
}

module "lambda_deleteDynamodbemr" {
  source             = "../../../../modules/infrastructure/lambda_tf13"
  function_name      = "${var.prefix_analyzer}-analyzerng-event-delete-dynamodb-tables-lambda"
  description        = var.deleteDynamodb_description
  handler            = var.handler
  runtime            = var.logparser_runtime
  memory_size        = var.memory_size
  concurrency        = var.concurrency
  lambda_timeout     = var.lambda_timeout
  log_retention      = var.log_retention
  filename           = var.deleteDynamodb_filename
  source_code_hash   = filebase64sha256("${path.module}/${var.deleteDynamodb_filename}")
  role_arn           = aws_iam_role.iam_for_lambda.arn
  environment = {
     bucket_name                       = data.terraform_remote_state.s3.outputs.bucketname_jar
     cloudwatch_rule_name_logparser    = "logparser-terminateEmrDeleteDynamodbTables"
     cloudwatch_rule_name_logprocessor = "logprocessor-terminateEmrDeleteDynamodbTables"
     lambda_execute_name               = "${var.prefix_analyzer}-analyzerng-terminateEMR-deleteDynamodbTables-lambda"
     lambda_name                       = "${var.prefix_analyzer}-analyzerng-event-delete-dynamodb-tables-lambda"
     region                            = var.region
  }
  tags = {
    Name            = "${var.prefix_analyzer}-analyzerng-event-delete-dynamodb-tables-lambda"
    Application     = var.application
    Environment     = var.tag_environment
    BU              = var.bu
    Region          = var.tag_region
    Applicationtype = var.Applicationtype
    new_cluster_id_logprocessor = "j-1234"
    cluster_id_logparser  = "j-1234"
    dynamo_tables_logprocessor = "${var.region}-analyzerng-flowdata-checkpoint=${var.region}-analyzerng-url-checkpoint=${var.region}-analyzerng-urlrating-checkpoint"
    cluster_id_logprocessor = "j-1234"
    new_cluster_id_logparser = "j-1234"
    dynamo_tables_logparser  = "${var.region}-analyzerng-rt-parser-checkpoint=${var.region}-analyzerng-flow-parser-checkpoint"
    email    = "itopscore@sonicwall.com"
  }
}

module "lambda_terminatemrdynamodb" {
  source             = "../../../../modules/infrastructure/lambda_tf13"
  function_name      = "${var.prefix_analyzer}-analyzerng-terminateEMR-deleteDynamodbTables-lambda"
  description        = var.terminatemrdynamodb_description
  handler            = var.handler
  runtime            = var.logparser_runtime
  memory_size        = var.memory_size
  concurrency        = var.concurrency
  lambda_timeout     = var.lambda_timeout
  log_retention      = var.log_retention
  filename           = var.terminatemrdynamodb_filename
  source_code_hash   = filebase64sha256("${path.module}/${var.terminatemrdynamodb_filename}")
  role_arn           = aws_iam_role.iam_for_lambda.arn
  environment = {
     region              = var.region
  }
  tags = {
    Name            = "${var.prefix_analyzer}-analyzerng-terminateEMR-deleteDynamodbTables-lambda"
    Application     = var.application
    Environment     = var.tag_environment
    BU              = var.bu
    Region          = var.tag_region
    Applicationtype = var.Applicationtype
  }
}

module "lambda_stepFunctionemr" {
  source             = "../../../../modules/infrastructure/lambda_tf13"
  function_name      = "${var.prefix_analyzer}-analyzerng-eventBridge-stepFunction-cease-lambda"
  description        = var.stepFunction_description
  handler            = var.handler
  runtime            = var.logparser_runtime
  memory_size        = var.memory_size
  concurrency        = var.concurrency
  lambda_timeout     = var.lambda_timeout
  log_retention      = var.log_retention
  filename           = var.stepFunction_filename
  source_code_hash   = filebase64sha256("${path.module}/${var.stepFunction_filename}")
  role_arn           = aws_iam_role.iam_for_lambda.arn
  environment = {
     arn                               = "arn:aws:lambda:${var.region}:${data.aws_caller_identity.current.account_id}:function:${var.prefix_analyzer}-analyzerng-eventBridge-stepFunction-cease-lambda"
     lambda_name                       = "${var.prefix_analyzer}-analyzerng-eventBridge-stepFunction-cease-lambda"
     rule_name_logprocessorweb         = "logprocessor-web-restart-stepFailure"
     rule_name_logprocessor            = "logprocessor-restart-stepFailure"
     region                            = var.region
#     destination_emails                = "itopscore@sonicwall.com"
#     sender                            = "nsm-ang-prodsim@sonicwall.com"
#     subject                           = "'URGENT: EMR Crashed Multiple Times'"
  }
  tags = {
    Name            = "${var.prefix_analyzer}-analyzerng-eventBridge-stepFunction-cease-lambda"
    Application     = var.application
    Environment     = var.tag_environment
    BU              = var.bu
    Region          = var.tag_region
    Applicationtype = var.Applicationtype
    count_stepFail_logprocessor = "0"
    count_stepFail_logparser    = "0"
  }
}

module "logprocessor" {
  source             = "../../../../modules/infrastructure/lambda_tf13"
  function_name      = "logProcessor"
  description        = "An AWS Serverless Specification template describing your function."
  handler            = var.handler
  runtime            = var.logparser_runtime
  memory_size        = var.memory_size
  concurrency        = var.concurrency
  lambda_timeout     = var.lambda_timeout
  log_retention      = var.log_retention
  filename           = var.logProcessor_new_filename
  source_code_hash   = filebase64sha256("${path.module}/${var.logProcessor_new_filename}")
  role_arn           = aws_iam_role.iam_for_lambda.arn
  environment = {
     bucket_name                      = data.terraform_remote_state.s3.outputs.bucketname_jar
     cloudwatch_rule_name_add_step    = "Adding-logProcessorWebStep"
     cloudWatch_ruleName_logProcessor = "logProcessor-terminateEMR-resetDDB"
     config_filename                  = "config/config.json"
     DynamoDBPrimaryKey               = "leaseKey"
     lambda_name                      = "logProcessor"
     recreate_freq_hours              = "240"
     region                           = var.region
  }
  tags = {
    Name            = "logProcessor"
    Application     = var.application
    Environment     = var.tag_environment
    BU              = var.bu
    Region          = var.tag_region
    Applicationtype = var.Applicationtype
  }
}


module "logprocessor-web" {
  source             = "../../../../modules/infrastructure/lambda_tf13"
  function_name      = "logProcessorWeb"
  description        = "An AWS Serverless Specification template describing your function."
  handler            = var.handler
  runtime            = var.logparser_runtime
  memory_size        = var.memory_size
  concurrency        = var.concurrency
  lambda_timeout     = var.lambda_timeout
  log_retention      = var.log_retention
  filename           = var.logProcessorWeb_filename
  source_code_hash   = filebase64sha256("${path.module}/${var.logProcessorWeb_filename}")
  role_arn           = aws_iam_role.iam_for_lambda.arn
  environment = {
     bucket_name                      = data.terraform_remote_state.s3.outputs.bucketname_jar
     cloudWatch_ruleName_logProcessor = "logProcessorWeb-terminateEMR-resetDDB"
     config_filename                  = "config/config.json"
     DynamoDBPrimaryKey               = "leaseKey"
     lambda_name                      = "logProcessorWeb"
     recreate_freq_hours              = "240"
     region                           = var.region
  }
  tags = {
    Name            = "logProcessorWeb"
    Application     = var.application
    Environment     = var.tag_environment
    BU              = var.bu
    Region          = var.tag_region
    Applicationtype = var.Applicationtype
  }
}
*/

module "setup" {
  source             = "../../../modules/infrastructure/lambda_tf13"
  function_name      = "ANG-Setup"
  description        = "An AWS Serverless Specification for setting up all other lambdas and EventBridge rules."
  handler            = var.handler
  runtime            = var.logparser_runtime
  memory_size        = var.memory_size
  concurrency        = var.concurrency
  lambda_timeout     = var.lambda_timeout
  log_retention      = var.log_retention
  filename           = var.ANG-Setup_filename
  source_code_hash   = filebase64sha256("${path.module}/${var.ANG-Setup_filename}")
  role_arn           = aws_iam_role.iam_for_lambda.arn
  environment = {
     Secret_Names        = var.secret_names
     config_filename     = "config/setup_lambda.json"
     region              = var.region
  }
  tags = {
    Name            = "ANG-Setup"
    Application     = var.application
    Environment     = var.tag_environment
    BU              = var.bu
    Region          = var.tag_region
    Applicationtype = var.Applicationtype
  }
}

module "ang-operations" {
  source             = "../../../modules/infrastructure/lambda_tf13"
  function_name      = "ANG-Operations"
  description        = "An AWS Serverless Specification for ANG Operations."
  handler            = var.handler
  runtime            = var.logparser_runtime
  memory_size        = var.memory_size
  concurrency        = var.concurrency
  lambda_timeout     = var.lambda_timeout
  log_retention      = var.log_retention
  filename           = var.ANG-ops_filename
  source_code_hash   = filebase64sha256("${path.module}/${var.ANG-ops_filename}")
  role_arn           = aws_iam_role.iam_for_lambda.arn
  environment = {
     DDBStreamName       = "KStreamState"
     region              = var.region
  }
  tags = {
    Name            = "ANG-Operations"
    Application     = var.application
    Environment     = var.tag_environment
    BU              = var.bu
    Region          = var.tag_region
    Applicationtype = var.Applicationtype
  }
}

/*
module "lambda_update" {
  source             = "../../../../modules/infrastructure/lambda_tf13"
  function_name      = "ANG-lambda_update"
  description        = "This Function is for updating other Lambda."
  handler            = var.handler
  runtime            = var.logparser_runtime
  memory_size        = var.memory_size
  concurrency        = var.concurrency
  lambda_timeout     = var.lambda_timeout
  log_retention      = var.log_retention
  filename           = var.ANG-lambda_update_filename
  source_code_hash   = filebase64sha256("${path.module}/${var.ANG-lambda_update_filename}")
  role_arn           = aws_iam_role.iam_for_lambda.arn
  environment = {
     region             = var.region
     bucket_name        = "eu1aws-analyzerng-jar-bucket"
  }
  tags = {
    Name            = "ANG-lambda_update"
    Application     = var.application
    Environment     = var.tag_environment
    BU              = var.bu
    Region          = var.tag_region
    Applicationtype = var.Applicationtype
  }
}
*/
module "partition_projection" {
  source             = "../../../modules/infrastructure/lambda_tf13"
  function_name      = "ANG-partition_projection"
  description        = "This Function is for updating Athena tables."
  handler            = var.handler
  runtime            = var.logparser_runtime
  memory_size        = var.memory_size
  concurrency        = var.concurrency
  lambda_timeout     = var.lambda_timeout
  log_retention      = var.log_retention
  filename           = var.ANG-lambda_partitionprojection_filename
  source_code_hash   = filebase64sha256("${path.module}/${var.ANG-lambda_partitionprojection_filename}")
  role_arn           = aws_iam_role.iam_for_lambda.arn
  environment = {
      WorkGroup_Name     = "primary"
      region             = var.region
      dbname             = "productionnsmfraflowlogs"
}

  tags = {
    Name            = "ANG-partition_projection"
    Application     = var.application
    Environment     = var.tag_environment
    BU              = var.bu
    Region          = var.tag_region
    Applicationtype = var.Applicationtype
  }
}


module "WeeklyRedShiftCommands" {
  source             = "../../../modules/infrastructure/lambda_tf13"
  function_name      = "ANG-WeeklyRedShiftCommands"
  description        = "This Function is for updating Athena tables."
  handler            = var.handler
  runtime            = var.logparser_runtime
  memory_size        = var.memory_size
  concurrency        = var.concurrency
  lambda_timeout     = var.lambda_timeout
  log_retention      = var.log_retention
  filename           = var.ANG-lambda_WeeklyRedShiftCommands_filename
  source_code_hash   = filebase64sha256("${path.module}/${var.ANG-lambda_WeeklyRedShiftCommands_filename}")
  role_arn           = aws_iam_role.iam_for_lambda.arn
  environment = {
      Redshift_Admin_User     = "redshiftangfraadmin"
      region                  = var.region
      Secret_Names            = var.secret_names
      topicARN                = "arn:aws:sns:eu-central-1:940810875359:AnalyzerNG-Alert-Reset_EMR-FRA"
}

  tags = {
    Name            = "ANG-WeeklyRedShiftCommands"
    Application     = var.application
    Environment     = var.tag_environment
    BU              = var.bu
    Region          = var.tag_region
    Applicationtype = var.Applicationtype
  }
}

module "MonitorDataEmail" {
  source             = "../../../modules/infrastructure/lambda_tf13"
  function_name      = "ANG-MonitorDataEmail"
  description        = "This Function is for updating Athena tables."
  handler            = var.handler
  runtime            = var.logparser_runtime
  memory_size        = var.memory_size
  concurrency        = var.concurrency
  lambda_timeout     = var.lambda_timeout
  log_retention      = var.log_retention
  filename           = var.ANG-lambda_MonitorDataEmail_filename
  source_code_hash   = filebase64sha256("${path.module}/${var.ANG-lambda_MonitorDataEmail_filename}")
  role_arn           = aws_iam_role.iam_for_lambda.arn
  environment = {
      region                  = var.region
      topicARN                = "arn:aws:sns:eu-central-1:940810875359:AnalyzerNG-Alert-Reset_EMR-FRA"
      DDBtablename_Kinesis    = "MonitorData_Kinesis_ANG"
      DDBtablename_RedShift   = "MonitorData_RedShift_ANG"
}

  tags = {
    Name            = "ANG-MonitorDataEmail"
    Application     = var.application
    Environment     = var.tag_environment
    BU              = var.bu
    Region          = var.tag_region
    Applicationtype = var.Applicationtype
  }
}

module "ReadKinesisDataStream" {
  source             = "../../../modules/infrastructure/lambda_tf13"
  function_name      = "ANG-ReadKinesisDataStream"
  description        = "This Function is for updating Athena tables."
  handler            = var.handler
  runtime            = var.logparser_runtime
  memory_size        = var.memory_size
  concurrency        = var.concurrency
  lambda_timeout     = var.lambda_timeout
  log_retention      = var.log_retention
  filename           = var.ANG-lambda_ReadKinesisDataStream_filename
  source_code_hash   = filebase64sha256("${path.module}/${var.ANG-lambda_ReadKinesisDataStream_filename}")
  role_arn           = aws_iam_role.iam_for_lambda.arn
  environment = {
      region                  = var.region
      Secret_Names            = var.secret_names
      DDBtablename            = "MonitorData_Kinesis_ANG"
      kinesis_stream          = "eu1aws-analyzer-ng-stream"
}

  tags = {
    Name            = "ANG-ReadKinesisDataStream"
    Application     = var.application
    Environment     = var.tag_environment
    BU              = var.bu
    Region          = var.tag_region
    Applicationtype = var.Applicationtype
  }
}

module "ReadRedShiftData" {
  source             = "../../../modules/infrastructure/lambda_tf13"
  function_name      = "ANG-ReadRedShiftData"
  description        = "This Function is for updating Athena tables."
  handler            = var.handler
  runtime            = var.logparser_runtime
  memory_size        = var.memory_size
  concurrency        = var.concurrency
  lambda_timeout     = var.lambda_timeout
  log_retention      = var.log_retention
  filename           = var.ANG-lambda_ReadRedShiftData_filename
  source_code_hash   = filebase64sha256("${path.module}/${var.ANG-lambda_ReadRedShiftData_filename}")
  role_arn           = aws_iam_role.iam_for_lambda.arn
  environment = {
      region                  = var.region
      Secret_Names            = var.secret_names
      DDBtablename            = "MonitorData_RedShift_ANG"
      redshift_cluster        = "redshift-analyzerng-cluster"
}

  tags = {
    Name            = "ANG-ReadRedShiftData"
    Application     = var.application
    Environment     = var.tag_environment
    BU              = var.bu
    Region          = var.tag_region
    Applicationtype = var.Applicationtype
  }
}


/*
## LogParser restart EventBridge

resource "aws_cloudwatch_event_target" "logparser_restart" {
  arn  = module.lambda_terminaterestartemr.function_arn
  rule = aws_cloudwatch_event_rule.logparser.id

  input = <<EOF
{
    "emr_cluster_restart_name":"${var.emr_logparser}",
    "lambda_function_name":"${var.prefix_analyzer}-analyzerng-logparser-lambda"
}
EOF
}

resource "aws_cloudwatch_event_rule" "logparser" {
  name        = "logparser-restart-daily"
  description = "To check Logparser EMR and restart if it is not running"

  schedule_expression = "rate(2 hours)"
}

## LogProcessor restart EventBridge

resource "aws_cloudwatch_event_target" "logprocessor_restart" {
  arn  = module.lambda_terminaterestartemr.function_arn
  rule = aws_cloudwatch_event_rule.logprocessor.id

  input = <<EOF
{
    "emr_cluster_restart_name":"${var.emr_logprocessor}",
    "lambda_function_name":"${var.prefix_analyzer}-analyzerng-logprocessor-lambda"
}
EOF
}

resource "aws_cloudwatch_event_rule" "logprocessor" {
  name        = "logprocessor-restart-daily"
  description = "To check Logprocessor EMR and restart if it is not running"

  schedule_expression = "rate(2 hours)"
}

## realtimereport restart EventBridge

resource "aws_cloudwatch_event_target" "realtimereport_restart" {
  arn  = module.lambda_realtimereport.function_arn
  rule = aws_cloudwatch_event_rule.realtimereport.id

}

resource "aws_cloudwatch_event_rule" "realtimereport" {
  name        = "realtimereport-restart-daily"
  description = "To check realtimereport EMR and restart if it is not running"

  schedule_expression = "rate(6 hours)"
}


## LogParser Step Failure Restart

resource "aws_cloudwatch_event_rule" "logparser_restart-stepFailure" {
  name        = "logparser-restart-stepFailure"
  description = "LogParser- Step Failure Restart"

  event_pattern = <<EOF
{
 "source": [
  "aws.emr"
 ],
 "detail-type": [
  "EMR Cluster State Change"
 ],
 "detail": {
  "state": [
   "TERMINATED_WITH_ERRORS"
  ],
  "name": [
   "${var.emr_logparser}"
  ]
 }
}
EOF
}

resource "aws_cloudwatch_event_target" "logparser_restart-step" {
  arn  = module.lambda_terminaterestartemr.function_arn
  rule = aws_cloudwatch_event_rule.logparser_restart-stepFailure.id

  input = <<EOF
{
    "emr_cluster_restart_name":"${var.emr_logparser}",
    "lambda_function_name":"${var.prefix_analyzer}-analyzerng-logparser-lambda"
}
EOF
}

resource "aws_cloudwatch_event_target" "logparser_cease" {
  arn  = module.lambda_stepFunctionemr.function_arn
  rule = aws_cloudwatch_event_rule.logparser_restart-stepFailure.id

  input = <<EOF
{
    "emr_name": "logparser"
}
EOF
}

## LogParser Delete DynamoDB tables

resource "aws_cloudwatch_event_rule" "logparser_delete_dynamodbtables" {
  name        = "logparser-terminateEmrDeleteDynamodbTables"
  description = "LogParser- delete dynamoDB tables while terminating EMR"

  event_pattern = <<EOF
{
  "source": [
    "aws.emr"
  ],
  "detail-type": [
    "EMR Cluster State Change"
  ],
  "detail": {
    "state": [
      "RUNNING"
    ],
    "clusterId": [
      "j-1234"
    ]
  }
}
EOF
}

resource "aws_cloudwatch_event_target" "logparser_delete-dynamo" {
  arn  = module.lambda_terminatemrdynamodb.function_arn
  rule = aws_cloudwatch_event_rule.logparser_delete_dynamodbtables.id

  input = <<EOF
{
    "emr_cluster_id":"j-1234",
    "dynamo_tables":"${var.region}-analyzerng-rt-parser-checkpoint=${var.region}-analyzerng-flow-parser-checkpoint",
    "cloudwatch_rule_name":"logparser-terminateEmrDeleteDynamodbTables"
}
EOF
}

## LogProcessor Step Failure Restart

resource "aws_cloudwatch_event_rule" "logprocessor_restart-stepFailure" {
  name        = "logrocessor-restart-stepFailure"
  description = "LogProcessor- Step Failure Restart"

  event_pattern = <<EOF
{
 "source": [
  "aws.emr"
 ],
 "detail-type": [
  "EMR Cluster State Change"
 ],
 "detail": {
  "state": [
   "TERMINATED_WITH_ERRORS"
  ],
  "name": [
   "${var.emr_logprocessor}"
  ]
 }
}
EOF
}

resource "aws_cloudwatch_event_target" "logprocessor_restart-step" {
  arn  = module.lambda_terminaterestartemr.function_arn
  rule = aws_cloudwatch_event_rule.logprocessor_restart-stepFailure.id

  input = <<EOF
{
    "emr_cluster_restart_name":"${var.emr_logprocessor}",
    "lambda_function_name":"${var.prefix_analyzer}-analyzerng-logprocessor-lambda"
}
EOF
}

resource "aws_cloudwatch_event_target" "logprocessor_cease" {
  arn  = module.lambda_stepFunctionemr.function_arn
  rule = aws_cloudwatch_event_rule.logprocessor_restart-stepFailure.id

  input = <<EOF
{
    "emr_name": "logprocessor"
}
EOF
}

## LogProcessor Delete DynamoDB tables

resource "aws_cloudwatch_event_rule" "logprocessor_delete_dynamodbtables" {
  name        = "logprocessor-terminateEmrDeleteDynamodbTables"
  description = "LogProcessor- delete dynamoDB tables while terminating EMR"

  event_pattern = <<EOF
{
  "source": [
    "aws.emr"
  ],
  "detail-type": [
    "EMR Cluster State Change"
  ],
  "detail": {
    "state": [
      "RUNNING"
    ],
    "clusterId": [
      "j-1234"
    ]
  }
}
EOF
}

resource "aws_cloudwatch_event_target" "logprocessor_delete-dynamo" {
  arn  = module.lambda_terminatemrdynamodb.function_arn
  rule = aws_cloudwatch_event_rule.logprocessor_delete_dynamodbtables.id

  input = <<EOF
{
    "emr_cluster_id":"j-1234",
    "dynamo_tables":"${var.region}-analyzerng-flowdata-checkpoint=${var.region}-analyzerng-url-checkpoint=${var.region}-analyzerng-urlrating-checkpoint",
    "cloudwatch_rule_name":"logprocessor-terminateEmrDeleteDynamodbTables"
}
EOF
}
*/
