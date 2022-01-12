provider "aws" {
  region = "us-east-2"
}

resource "aws_s3_bucket" "remote_store" {
  bucket = "rafay-bucket"
  acl    = "private"

  tags = {
    Name        = "rafay-bucket"
    BU          = "Rafay_Created"
  }
}