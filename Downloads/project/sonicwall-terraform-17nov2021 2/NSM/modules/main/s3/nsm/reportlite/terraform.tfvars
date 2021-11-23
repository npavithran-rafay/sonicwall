# #-----------------------------------------------------------------#
# # Configure Terragrunt to automatically store tfstate files in S3 #
# #-----------------------------------------------------------------#
# terragrunt = {
#   remote_state {
#     backend = "s3"

#     config {
#       encrypt        = false
#       bucket         = "snwl-production-terraform-state"
#       key            = "production/Frankfurt/s3/nsm/reportlite/terraform.tfstate"
#       region         = "us-west-2"
#       dynamodb_table = "my-lock-table"

#       dynamodb_table_tags {
#         owner = "terragrunt integration"
#         name  = "Terraform lock table"
#       }

#     }
#   }
# }

# #---------------------------------------------------------------#
# #aws provider info                                              #
# #---------------------------------------------------------------#
# aws_access_key = ""

# aws_secret_key = ""

# #Region for the VPC
# region = "eu-central-1"

# ############################################
# ## Variables for S3 bucket for reportlite ##
# ############################################

# bucket_name          = "nsmfra-report-lite"
# acl                  = "private"

