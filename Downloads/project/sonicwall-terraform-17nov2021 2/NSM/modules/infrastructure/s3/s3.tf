## Create S3 bucket

resource "aws_s3_bucket" "default" {
  bucket = "${var.bucketname}"
  acl    = "${var.acl}"
  region = "${var.region}"
  versioning {
    enabled = "${var.versioning}"
  }
  force_destroy = "${var.force_destroy}"
  lifecycle_rule {
     id      = "${var.lifecycle_name}"
     enabled = "${var.lifecycle_enabled}"
     expiration {
        days = "${var.lifecycle_expiration_days}"
     }
  }
  tags = {
    Name        = "${var.tagname}"
    Environment = "${var.tagenv}"
    Region      = "${var.tagregion}"
  }
}

resource "aws_s3_bucket_public_access_block" "public_access_block" {
  bucket                  = "${aws_s3_bucket.default.id}"
  block_public_acls       = "${var.block_public_acls}"
  ignore_public_acls      = "${var.ignore_public_acls}"
  block_public_policy     = "${var.block_public_policy}"
  restrict_public_buckets = "${var.restrict_public_buckets}"
}

resource "aws_s3_bucket_object" "create_folder" {
    count       = "${var.create_folder ? 1 : 0}"
    depends_on  = ["aws_s3_bucket.default"]
    bucket      = "${var.bucketname}"
    acl         = "${var.acl}"
    key         = "${var.S3_key}"
}

