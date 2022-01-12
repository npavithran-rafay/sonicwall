

#######################################################################################
##Policy attachment to Eks-worker-role for S3 bucket access for cscma reports bucket ##
#######################################################################################


resource "aws_iam_policy" "nsms3rptpolicy" {
  name        = "FRA-NSM-Production-S3-cscreport-Policy"
  description = "FRA-NSM-Production-S3-cscreport-Policy"
  tags = var.tags
  policy = <<EOF
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Sid": "VisualEditor0",
            "Effect": "Allow",
            "Action": [
                "s3:ListBucket"
            ],
            "Resource": "arn:aws:s3:::cscmafra-sch-rpt-bucket"
        },
        {
            "Sid": "VisualEditor1",
            "Effect": "Allow",
            "Action": [
                "s3:PutObject",
                "s3:GetObject",
                "s3:DeleteObject"
            ],
            "Resource": "arn:aws:s3:::cscmafra-sch-rpt-bucket/*"
        }
    ]
}
EOF
}

resource "aws_iam_role_policy_attachment" "nsm-s3policy-attach" {
  role       = var.role_name
  policy_arn = "${aws_iam_policy.nsms3rptpolicy.arn}"
}


