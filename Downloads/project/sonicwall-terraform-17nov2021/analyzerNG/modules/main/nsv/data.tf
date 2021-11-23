# Get the VPC related data from the remote state file
data "terraform_remote_state" "vpc-output" {
  backend = "s3"
  config = {
    bucket = var.network_state_bucket
    key    = var.network_state_key
    region = var.network_state_region
  }
}

