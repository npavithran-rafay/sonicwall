
# #-----------------------------------------------#
# #save the state file to s3 bucket               #
# #-----------------------------------------------#
# terraform {
#   # The configuration for this backend will be filled in by Terragrunt
#   backend "s3" {}
# }


#####################################
## AWS S3 bucket for reportlite  ##
#####################################


resource "aws_s3_bucket" "s3_bucket" {
  //
  bucket = "${var.bucket_name}"
  //Access Connect List
  acl    = "${var.acl}"
  force_destroy = true
  lifecycle {
     prevent_destroy = false
  }
  tags                  = var.tags
}

resource "aws_s3_bucket_policy" "s3_bucket_policy" {
  bucket = "${aws_s3_bucket.s3_bucket.id}"
  policy = <<POLICY
{
    "Version": "2012-10-17",
    "Id": "Policy1577969774605",
    "Statement": [
        {
            "Sid": "Stmt1577969766331",
            "Effect": "Allow",
            "Principal": "*",
            "Action": [
                "s3:PutObject",
                "s3:PutObjectAcl"
            ],
            "Resource": "${aws_s3_bucket.s3_bucket.arn}/*"
        },
        {
            "Sid": "Stmt1577969766330",
            "Effect": "Deny",
            "NotPrincipal": {
                "AWS": "arn:aws:iam::940810875359:user/nsm-s3-svc"
            },
            "Action": "s3:GetObject",
            "Resource": "${aws_s3_bucket.s3_bucket.arn}/*"
        }
    ]
}
POLICY
}

