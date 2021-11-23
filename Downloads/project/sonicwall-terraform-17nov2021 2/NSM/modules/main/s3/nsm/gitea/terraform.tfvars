# #-----------------------------------------------------------------#
# # Configure Terragrunt to automatically store tfstate files in S3 #
# #-----------------------------------------------------------------#
# terragrunt = {
#   remote_state {
#     backend = "s3"

#     config {
#       encrypt        = false
#       bucket         = "snwl-production-terraform-state"
#       key            = "gopi-production/Frankfurt/s3/nsm/gitea/terraform.tfstate"
#       region         = "us-west-1"
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
# region = "us-east-1"

# #######################################
# ## Variables for S3 bucket for gitea ##
# #######################################

# bucket_name          = "nsm-fra-gitea-production"
# acl                  = "private"
# lifecycle_name       = "Gitea_backup_archieve"
# storage_class        = "INTELLIGENT_TIERING"

