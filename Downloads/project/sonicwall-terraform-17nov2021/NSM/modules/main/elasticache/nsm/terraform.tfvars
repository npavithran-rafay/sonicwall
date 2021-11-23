# #-----------------------------------------------------------------
# # Configure Terragrunt to automatically store tfstate files in S3
# #-----------------------------------------------------------------
# # terragrunt = {
# #   remote_state {
# #     backend = "s3"

# #     config {
# #       encrypt        = false
# #       bucket         = "snwl-production-terraform-state"
# #       key            = "production/Frankfurt/elasticache/cgms/terraform.tfstate"
# #       region         = "us-west-2"
# #       dynamodb_table = "production-lock-table"
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

# #--------------------------------------------------------------#
# # Redis related Information                                    #
# #--------------------------------------------------------------#

# eng_name               = "redis" 
# numcache               = "2"
# nodetype               = "cache.m5.large"
# par_name               = "default.redis5.0"
# repl_grp               = "eu1aws-nsm-redis"
# eng_ver                = "5.0.6"
# port                   = 6379
# maintaince_win         = "sun:10:40-sun:11:40"
# snap_win               = "09:10-10:10"
# snap_reten_limit       = 1
# automatic_failover     = true
# at_rest                = false
# transit_encry          = false
# apply_immediately      = true
# description            = "Redis cluster for NSM-FRA Production"

# sg_ids                 = ["sg-05ea932cc63eb6904"]
# name_tag               = "eu1aws-nsm-redis-prod"
# enviroment_tag         = "Production"
# bu_tag                 = "NSM"
# sn_grp_name            = "nsm-redis-subnetgroup"
# sn_ids                 = ["subnet-012e28f341285a86d" , "subnet-01c61495db36a80fd" , "subnet-0ba59750290c3acc6"]
# sn_grp_desc            = "subnet group for nsm redis cluster"

