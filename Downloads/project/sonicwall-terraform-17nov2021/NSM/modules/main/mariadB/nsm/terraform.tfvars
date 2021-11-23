# #-----------------------------------------------------------------
# # Configure Terragrunt to automatically store tfstate files in S3
# #-----------------------------------------------------------------
# # terragrunt = {
# #   remote_state {
# #     backend = "s3"

# #     config {
# #       encrypt        = false
# #       bucket         = "snwl-terraform-state"
# #       key            = "production/XXXXXXXXX/mariadb/nsm/terraform.tfstate"
# #       region         = "us-west-2"
# #       dynamodb_table = "production-lock-table"

# #       dynamodb_table_tags {
# #         owner = "terragrunt integration"
# #         name  = "Terraform lock table"
# #       }
# #     }
# #   }
# # }

# #-------------------------------------------------------------------
# #aws info
# #------------------------------------------------------------------
# aws_access_key = ""

# aws_secret_key = ""

# #Region for the VPC
# region = "eu-central-1"

# #--------------------------------------------------------------#

# #-----------------------------#
# #Applies to RDS
# #-----------------------------#

# security_group_ids = ["sg-05ea932cc63eb6904"]

# db_subnet_group = ["subnet-07f8ceb2c859b3e68", "subnet-05502f7982f4f6b2a" ,"subnet-0010a3d141948e0fa"]

# db_subnet_group_name = "eu1aws-nsm-mariadb"

# #-------------------------------#
# # RDS variables
# #-------------------------------#

# rds_identifier = "prod-nsm-mariadb"

# engine = "mariadb"

# engine_version = "10.3"

# # m5.2xlarge: 8 CPU, 32GB Mem
# instance_class = "db.m5.2xlarge"

# allocated_storage = "500"

# storage_type = "gp2"

# db_name = "gitea"

# master_username = "XXXXXXXXXXXXXXXX"

# db_port = "3306"

# multi_az = true

# publicly_accessible = false

# allow_major_version_upgrade = false

# auto_minor_version_upgrade = true

# apply_immediately = true

# deletion_protection = false

# skip_final_snapshot = true

# tags = {
#   BU = "NSM"
# }
