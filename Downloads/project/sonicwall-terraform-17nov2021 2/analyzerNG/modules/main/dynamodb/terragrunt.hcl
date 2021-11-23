#-----------------------------------------------------------------#
# Configure Terragrunt to automatically store tfstate files in S3 #
#-----------------------------------------------------------------#
/*remote_state {
    backend = "s3"

    config = {
      encrypt        = false
      bucket         = "snwl-production-terraform-state"
      key            = "production/Frankfurt/nsm-analyzerNG/dynamodb/terraform.tfstate"
      region         = "us-west-2"
      dynamodb_table = "my-lock-table"
    }
}*/

include {
  path = find_in_parent_folders()
}








