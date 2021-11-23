# //Terragrunt Config
# # terragrunt = {
# #   remote_state {
# #     backend = "s3"

# #     config {
# #       encrypt        = false
# #       bucket         = "snwl-terraform-state"
# #       key            = "production/XXXXXXXXXXXXXX/elasticsearch/cscma/terraform.tfstate"
# #       region         = "us-west-2"
# #       dynamodb_table = "production-lock-table"
# #     }
# #   }
# # }

# //AWS Config
# //Set region for deployment
# # region = "eu-central-1"
# # aws_access_key = ""
# # aws_secret_key = ""

# //ES Config
# //Domain name for the ES cluster
# domain_name = "eu1aws-nsm-elasticsearch"

# //Set version of ES
# es_version = "7.1"

# //VPC Vars
# subnet_ids         = ["subnet-012e28f341285a86d" , "subnet-01c61495db36a80fd" , "subnet-0ba59750290c3acc6"]
# security_group_ids = ["sg-05ea932cc63eb6904"]

# //EBS Vars
# ebs_size = 250
# ebs_type = "gp2"
# ebs_iops = 0

# //AZ Awareness Vars
# zone_awareness = "true"
# az_count       = 3 //Takes 1,2,3

# //Instance Vars
# master_instance_type  = "m5.large.elasticsearch"
# master_instance_count = 4 //Takes 3 or 5

# data_instance_type  = "m5.xlarge.elasticsearch"
# data_instance_count = 6

# //Node to node encryption
# node_to_node_encryption = "false"

# //Logging
# log_publishing_index_enabled       = "false"
# log_publishing_search_enabled      = "false"
# log_publishing_application_enabled = "false"

# //Enable ES Service Linked Role Creation
# create_service_linked_role = "false"

# //Tags
# env     = "Production"
# BU      = "NSM"
# appname = "NSM"
