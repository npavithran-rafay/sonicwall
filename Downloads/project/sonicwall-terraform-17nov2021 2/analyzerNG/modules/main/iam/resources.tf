
#-----------------------------------------------#
#save the state file to s3 bucket               #
#-----------------------------------------------#
/*terraform {
  # The configuration for this backend will be filled in by Terragrunt
  backend "s3" {}
}*/


#######################################################################################
##Policy attachment to Eks-worker-role for S3 bucket access for analyzer-ng          ##
#######################################################################################


resource "aws_iam_policy" "analyzerngpolicy" {
  name        = var.iam_name
  description = "NSM-Prodsim-Analyzer-NG-Policy"

  policy = <<EOF
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Sid": "VisualEditor0",
            "Effect": "Allow",
            "Action": [
                "redshift:DescribeHsmConfigurations",
                "redshift:ListDatabases",
                "redshift:DescribeClusterTracks",
                "redshift:DescribeEvents",
                "redshift:CreateSavedQuery",
                "dynamodb:*",
                "redshift:DescribeDefaultClusterParameters",
                "redshift:DeleteScheduledAction",
                "redshift:DescribeClusterSubnetGroups",
                "s3:GetObjectAcl",
                "redshift:DescribeQuery",
                "redshift:DescribeClusterVersions",
                "redshift:DescribeClusterSnapshots",
                "redshift:DescribeStorage",
                "redshift:DescribeClusterSecurityGroups",
                "redshift:DescribeEventSubscriptions",
                "redshift:DescribeOrderableClusterOptions",
                "redshift:ViewQueriesInConsole",
                "redshift:DescribeScheduledActions",
                "redshift:AcceptReservedNodeExchange",
                "redshift:DescribeClusterDbRevisions",
                "redshift:ViewQueriesFromConsole",
                "redshift:CreateScheduledAction",
                "redshift:CancelQuery",
                "s3:GetObject",
                "redshift:DescribeSnapshotCopyGrants",
                "redshift:ListSavedQueries",
                "redshift:CancelQuerySession",
                "redshift:GetReservedNodeExchangeOfferings",
                "redshift:PurchaseReservedNodeOffering",
                "redshift:ModifySavedQuery",
                "s3:ListBucket",
                "redshift:ModifyClusterMaintenance",
                "redshift:DescribeEventCategories",
                "redshift:DescribeReservedNodeOfferings",
                "redshift:DescribeSavedQueries",
                "redshift:DescribeTableRestoreStatus",
                "redshift:ModifyScheduledAction",
                "redshift:DescribeHsmClientCertificates",
                "redshift:DescribeAccountAttributes",
                "redshift:DescribeClusterParameterGroups",
                "redshift:FetchResults",
                "redshift:ListTables",
                "redshift:ListSchemas",
                "redshift:DescribeReservedNodes",
                "redshift:DescribeNodeConfigurationOptions",
                "redshift:DescribeClusters",
                "lambda:*",
                "redshift:ExecuteQuery",
                "redshift:DescribeTable",
                "redshift:DeleteSavedQueries"
            ],
            "Resource": "*"
        },
        {
            "Sid": "VisualEditor1",
            "Effect": "Allow",
            "Action": "redshift:*",
            "Resource": "arn:aws:redshift:${var.region}:*:cluster:*"
        }
    ]
}
EOF
}

resource "aws_iam_role_policy_attachment" "nsm-analyzerngpolicy-attach" {
  role       = var.nsm_eks_worker_iam
  policy_arn = aws_iam_policy.analyzerngpolicy.arn
}


