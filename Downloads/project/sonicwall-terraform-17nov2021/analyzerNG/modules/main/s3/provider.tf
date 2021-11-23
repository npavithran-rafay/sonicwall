# Configure the AWS Provider
provider "aws" {
  #version    = ">= 2.28.1"
  version = "3.31.0 "
  access_key = var.aws_access_key
  secret_key = var.aws_secret_key
  region     = var.region
}
