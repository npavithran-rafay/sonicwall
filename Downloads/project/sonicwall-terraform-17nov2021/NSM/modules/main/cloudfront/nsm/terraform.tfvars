# #-----------------------------------------------------------------#
# # Configure Terragrunt to automatically store tfstate files in S3 #
# #-----------------------------------------------------------------#
# # terragrunt = {
# #   remote_state {
# #     backend = "s3"

# #     config {
# #       encrypt        = false
# #       bucket         = "snwl-production-terraform-state"
# #       key            = "production/Frankfurt/cloudfront/nsm/terraform.tfstate"
# #       region         = "us-west-2"
# #       dynamodb_table = "my-lock-table"

# #       dynamodb_table_tags {
# #         owner = "terragrunt integration"
# #         name  = "Terraform lock table"
# #       }
# #     }
# #   }
# # }

# #---------------------------------------------------------------#
# #aws provider info                                              #
# #---------------------------------------------------------------#
# # aws_access_key = ""

# # aws_secret_key = ""

# # #Region for the VPC
# # region = "eu-central-1"

# ########################
# ## Cloudfront vales   ##
# ########################

#   comment                        = "FRA Production NSM CloudFront"
#   root_object                    = ""
#   domain_name                    = "a08f5eXXXXXXXXXXXXXXXXXXXXXX7753.elb.eu-central-1.amazonaws.com"
#   origin_id                      = "ELB-a08f5ee0fb4XXXXXXXXXXXXXXXXXXXXXXX6547753.elb.eu-central-1.amazonaws.com"
#   origin_protocol_policy         = "match-viewer"
#   ssl_protocols                  = ["TLSv1"]
#   bucket_domain_name             = "nsm-fra-cloudfront.s3.amazonaws.com"
#   bucket_name                    = "nsm-fra-cloudfront"
#   prefix                         = "cloudfront-logs/"
#   aliases                        = ["nsm-eucentral.sonicwall.com"]
#   cert_arn                       = "arn:aws:acm:us-east-1:940810875359:certificate/e3XXXXXXXXXXXXXXXXX570b"
#   ssl_support_method             = "sni-only"
#   min_protocol_version           = "TLSv1.2_2018"
#   default_cert                   = false
#   allowed_methods                = ["GET", "HEAD", "OPTIONS", "PUT", "POST", "PATCH", "DELETE"]
#   cached_methods                 = ["GET", "HEAD", "OPTIONS"]
#   target_origin_id               = "ELB-a08f5XXXXXXXXXXXXXXXXXXXXXX547753.elb.eu-central-1.amazonaws.com"
#   forward                        = "all"
#   env                            = "Production"
#   BU                             = "NSM"
#   restriction_type               = "none"
