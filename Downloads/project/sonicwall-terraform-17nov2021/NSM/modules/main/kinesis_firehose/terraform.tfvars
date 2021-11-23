# #-----------------------------------------------------------------#
# # Configure Terragrunt to automatically store tfstate files in S3 #
# #-----------------------------------------------------------------#
# # terragrunt = {
# #   remote_state {
# #     backend = "s3"

# #     config {
# #       encrypt        = false
# #       bucket         = "snwl-terraform-state"
# #       key            = "production/XXXXXX/kinesis/nsm/terraform.tfstate"
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


# ####################################
# ## Variables for redshift Cluster ##
# ####################################

# database_name              = "report"
# master_password            = "XXXXXXXXXXXXXXX"
# master_username            = "XXXXXXXXXXXXX"
# securitygrp_ids            = ["sg-XXXXXXXXeb6904"]

# ####################################
# ## Variables for S3 Bucket        ##
# ####################################

# bucketname                 = "nsm-fra-firehose"
# acl                        = "private"

# #################################################
# ## Variables for firehose policy attachement   ##
# #################################################

# arn_deliverystream         = "arn:aws:firehose:eu-central-1:940810875359:deliverystream/*"

# ####################################
# ## Variables for firehose stream  ##
# ####################################

# clusterjdbc                = "jdbc:redshift://redshift-cluster.c6jv1s93e0pt.eu-central-1.redshift.amazonaws.com:5439/report"
# copy_options               = "CSV TIMEFORMAT 'epochsecs' MAXERROR AS 1000"
# copy_options1              = "JSON 'auto' TIMEFORMAT 'epochsecs' MAXERROR AS 1000"
# destination                = "redshift"
# iam_role_name              = "firehose_delivery_role_fra"
# iam_role_policy_name       = "pipeline_test_role_policy_fra"
# bu                         = "NSM"
# application                = "NSM"
# tag_environment            = "Production"
# tag_region                 = "Frankfurt"

# ############################
# ## firehose stream  names ##
# ############################

# firehosename1              = "gms-application"
# firehosename2              = "gms-user_by_session"
# firehosename3              = "gms-user_by_received"
# firehosename4              = "gms-user_by_sent"
# firehosename5              = "gms-address_by_session"
# firehosename6              = "gms-address_by_received"
# firehosename7              = "gms-address_by_sent"
# firehosename8              = "gms-location"
# firehosename9              = "gms-domain"
# firehosename10             = "gms-virus"
# firehosename11             = "gms-intrusion"
# firehosename12             = "gms-spyware"
# firehosename13             = "gms-fw_info"
# firehosename14             = "gms-capture_atp_info"
# firehosename15             = "gms-dpi_ssl_info"
# firehosename16             = "gms-connection_info"
# firehosename17             = "gms-bandwidth_info"
# firehosename18             = "gms-botnet"
# firehosename19             = "gms-rating"

# ######################
# ## Data table names ##
# ######################

# datatablename1              = "application"
# datatablename2              = "user_by_session"
# datatablename3              = "user_by_received"
# datatablename4              = "user_by_sent"
# datatablename5              = "address_by_session"
# datatablename6              = "address_by_received"
# datatablename7              = "address_by_sent"
# datatablename8              = "location"
# datatablename9              = "domain"
# datatablename10             = "virus"
# datatablename11             = "intrusion"
# datatablename12             = "spyware"
# datatablename13             = "fw_info"
# datatablename14             = "capture_atp_info"
# datatablename15             = "dpi_ssl_info"
# datatablename16             = "connection_info"
# datatablename17             = "bandwidth_info"
# datatablename18             = "botnet"
# datatablename19             = "rating"

