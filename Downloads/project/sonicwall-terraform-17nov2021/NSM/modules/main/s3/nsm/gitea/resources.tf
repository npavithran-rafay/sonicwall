
# #-----------------------------------------------#
# #save the state file to s3 bucket               #
# #-----------------------------------------------#
# terraform {
#   # The configuration for this backend will be filled in by Terragrunt
#   backend "s3" {}
# }


#####################################
## AWS S3 bucket for gitea backup  ##
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
  lifecycle_rule {
     id      = "${var.lifecycle_name}"
     enabled = true
     transition {
      days          = 20
      storage_class = "${var.storage_class}"
     }
     expiration {
        days = 30
     }
  }
}

resource "aws_s3_bucket_public_access_block" "public_access_block" {
  bucket                  = "${aws_s3_bucket.s3_bucket.id}"
  block_public_acls       = true
  ignore_public_acls      = true
  block_public_policy     = true
  restrict_public_buckets = true
}

#####################################
## AWS S3 folder creation step     ##
#####################################

resource "aws_s3_bucket_object" "gitea-backup" {
    depends_on  = ["aws_s3_bucket.s3_bucket"]
    bucket      = "${var.bucket_name}"
    acl         = "${var.acl}"
    key         = "gitea-backup/"
}

########################################################################
##Policy attachment to Eks-worker-role for S3 bucket access for gitea ##
########################################################################


resource "aws_iam_policy" "nsms3backuppolicy" {
  name        = "NSM-FRA-Production-S3-Backup-Policy"
  description = "NSM-FRA-Production-S3-Backup-Policy"

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
            "Resource": "arn:aws:s3:::nsm-fra-gitea-production"
        },
        {
            "Sid": "VisualEditor1",
            "Effect": "Allow",
            "Action": [
                "s3:PutObject",
                "s3:GetObject"
            ],
            "Resource": "arn:aws:s3:::nsm-fra-gitea-production/*"
        }
    ]
}
EOF
}

resource "aws_iam_role_policy_attachment" "nsm-s3policy-attach" {
  role       = "fra-eks-workernode-role"
  policy_arn = "${aws_iam_policy.nsms3backuppolicy.arn}"
}


