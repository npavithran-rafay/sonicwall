
#-----------------------------------------------#
#save the state file to s3 bucket               #
#-----------------------------------------------#
/*terraform {
  # The configuration for this backend will be filled in by Terragrunt
  backend "s3" {}
}*/

#---------------------------------------------------------#
# Create a custome IAM role to attach with glue crawler   #
#---------------------------------------------------------#

resource "aws_iam_role" "iam_for_glue" {
  name                  = "iam_for_${var.crawler_name}"
  force_detach_policies = true
  assume_role_policy    = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
      {
      "Action": "sts:AssumeRole",
      "Principal": {
        "Service": "glue.amazonaws.com"
      },
      "Effect": "Allow",
      "Sid": ""
    }
  ]
}
EOF
}

resource "aws_iam_role_policy_attachment" "cloudwatch-access-attach" {
  role      = aws_iam_role.iam_for_glue.name
  policy_arn = "arn:aws:iam::aws:policy/service-role/AWSGlueServiceRole"
}

resource "aws_iam_role_policy" "glue_crawler_policy" {
  name = "IAM-policy-${var.crawler_name}-cloudwatch"
  role = aws_iam_role.iam_for_glue.name

  policy = <<-EOF
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Effect": "Allow",
            "Action": [
                        "s3:GetBucketLocation",
                        "s3:ListAllMyBuckets"
                      ],
            "Resource": "arn:aws:s3:::*"
        },
        {
            "Effect": "Allow",
            "Action": [
                "s3:*"
            ],
            "Resource": [
                "arn:aws:s3:::${data.terraform_remote_state.s3.outputs.bucketname}",
                "arn:aws:s3:::${data.terraform_remote_state.emr_s3.outputs.bucketid}",
                "arn:aws:s3:::${data.terraform_remote_state.emr_s3.outputs.emr2bucketid}",
                "arn:aws:s3:::${data.terraform_remote_state.s3.outputs.bucketname}/*",
                "arn:aws:s3:::${data.terraform_remote_state.emr_s3.outputs.bucketid}/*",
                "arn:aws:s3:::${data.terraform_remote_state.emr_s3.outputs.emr2bucketid}/*"

           ]
        }
    ]
}
  EOF
}


resource "aws_glue_crawler" "analyzer-ng" {
  database_name = data.terraform_remote_state.athena.outputs.Athena_database
  name          = var.crawler_name
  role          = aws_iam_role.iam_for_glue.arn
  schedule      = "cron(/15 * * * ? *)"
  s3_target {
    path = "s3://${data.terraform_remote_state.s3.outputs.bucketname}/flowdata"
  }
  recrawl_policy {
    recrawl_behavior = var.crawl_behaviour
  }
  schema_change_policy {
    delete_behavior = "LOG"
    update_behavior = "LOG"
  } 

}


resource "aws_glue_crawler" "analyzer-ng-url" {
  database_name = data.terraform_remote_state.athena.outputs.Athena_database
  name          = var.crawler_name_url
  role          = aws_iam_role.iam_for_glue.arn
  schedule      = "cron(/15 * * * ? *)"
  recrawl_policy {
    recrawl_behavior = var.crawl_behaviour
  }
  s3_target {
    path = "s3://${data.terraform_remote_state.s3.outputs.bucketname}/flowurl"
  }
  schema_change_policy {
    delete_behavior = "LOG"
    update_behavior = "LOG"
  }
}

resource "aws_glue_crawler" "analyzer-ng-appsdata" {
  database_name = data.terraform_remote_state.athena.outputs.Athena_database
  name          = var.crawler_name_appsdata
  role          = aws_iam_role.iam_for_glue.arn
  schedule      = "cron(0 0 * * ? *)"
  recrawl_policy {
    recrawl_behavior = var.crawl_behaviour
  }
  s3_target {
    path = "s3://${data.terraform_remote_state.s3.outputs.bucketname}/rtrdata/appsdata/"
  }
  schema_change_policy {
    delete_behavior = "LOG"
    update_behavior = "LOG"
  }
}

resource "aws_glue_crawler" "analyzer-ng-coredata" {
  database_name = data.terraform_remote_state.athena.outputs.Athena_database
  name          = var.crawler_name_coredata
  role          = aws_iam_role.iam_for_glue.arn
  schedule      = "cron(0 0 * * ? *)"
  recrawl_policy {
    recrawl_behavior = var.crawl_behaviour
  }
  s3_target {
    path = "s3://${data.terraform_remote_state.s3.outputs.bucketname}/rtrdata/coredata/"
  }
  schema_change_policy {
    delete_behavior = "LOG"
    update_behavior = "LOG"
  }
}

resource "aws_glue_crawler" "analyzer-ng-ifacedata" {
  database_name = data.terraform_remote_state.athena.outputs.Athena_database
  name          = var.crawler_name_ifacedata
  role          = aws_iam_role.iam_for_glue.arn
  schedule      = "cron(0 0 * * ? *)"
  recrawl_policy {
    recrawl_behavior = var.crawl_behaviour
  }
  s3_target {
    path = "s3://${data.terraform_remote_state.s3.outputs.bucketname}/rtrdata/ifacedata/"
  }
  schema_change_policy {
    delete_behavior = "LOG"
    update_behavior = "LOG"
  }
}

resource "aws_glue_crawler" "analyzer-ng-memdata" {
  database_name = data.terraform_remote_state.athena.outputs.Athena_database
  name          = var.crawler_name_memdata
  role          = aws_iam_role.iam_for_glue.arn
  schedule      = "cron(0 0 * * ? *)"
  recrawl_policy {
    recrawl_behavior = var.crawl_behaviour
  }
  s3_target {
    path = "s3://${data.terraform_remote_state.s3.outputs.bucketname}/rtrdata/memdata/"
  }
  schema_change_policy {
    delete_behavior = "LOG"
    update_behavior = "LOG"
  }
}

resource "aws_glue_crawler" "analyzer-ng-reportdata" {
  database_name = data.terraform_remote_state.athena.outputs.Athena_database
  name          = var.crawler_name_reportdata
  role          = aws_iam_role.iam_for_glue.arn
  schedule      = "cron(/15 * * * ? *)"
  recrawl_policy {
    recrawl_behavior = var.crawl_behaviour
  }
  s3_target {
    path = "s3://${data.terraform_remote_state.s3.outputs.bucketname}/reportdata"
  }
  schema_change_policy {
    delete_behavior = "LOG"
    update_behavior = "LOG"
  }
}

resource "aws_glue_crawler" "analyzer-ng-flowblocked" {
  database_name = data.terraform_remote_state.athena.outputs.Athena_database
  name          = var.crawler_name_flowblocked
  role          = aws_iam_role.iam_for_glue.arn
  schedule      = "cron(/15 * * * ? *)"
  recrawl_policy {
    recrawl_behavior = var.crawl_behaviour
  }
  s3_target {
    path = "s3://${data.terraform_remote_state.s3.outputs.bucketname}/flowblocked"
  }
  schema_change_policy {
    delete_behavior = "LOG"
    update_behavior = "LOG"
  }
}

resource "aws_glue_crawler" "analyzer-ng-flowthreat" {
  database_name = data.terraform_remote_state.athena.outputs.Athena_database
  name          = var.crawler_name_flowthreat
  role          = aws_iam_role.iam_for_glue.arn
  schedule      = "cron(/15 * * * ? *)"
  recrawl_policy {
    recrawl_behavior = var.crawl_behaviour
  }
  s3_target {
    path = "s3://${data.terraform_remote_state.s3.outputs.bucketname}/flowthreat"
  }
  schema_change_policy {
    delete_behavior = "LOG"
    update_behavior = "LOG"
  }
}
