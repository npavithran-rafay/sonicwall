/*#---------------------------------------------------------------#
#aws provider info                                              #
#---------------------------------------------------------------#
aws_access_key = ""

aws_secret_key = ""


network_state_bucket = "snwl-production-terraform-state"
network_state_key    = "production/XXXXXXXXXXXXXX/nsm-analyzerNG/s3/terraform.tfstate"
network_state_region = "us-west-2"

## State file location of EMR in Analyzer-NG
emr_network_state_key= "production/XXXXXXXXXXXXXX/nsm-analyzerNG/emr/terraform.tfstate"

## State file location of Athena in Analyzer-NG
athena_network_state_key= "production/XXXXXXXXXXXXXX/nsm-analyzerNG/athena/terraform.tfstate"

#Region for the VPC
#region = "eu-central-1"
region  = "us-west-1"

crawler_name           = "eu1aws-analyzer-ng-crawler"

crawler_name_url       = "eu1aws-analyzer-ng-crawler-url"

crawler_name_appsdata  = "eu1aws-analyzer-ng-crawler-appsdata"

crawler_name_coredata  = "eu1aws-analyzer-ng-crawler-coredata"

crawler_name_ifacedata = "eu1aws-analyzer-ng-crawler-ifacedata"

crawler_name_memdata   = "eu1aws-analyzer-ng-crawler-memdata"

crawler_name_reportdata   = "eu1aws-analyzer-ng-crawler-reportdata"

crawler_name_flowblocked   = "eu1aws-analyzer-ng-crawler-flowblocked"

crawler_name_flowthreat   = "eu1aws-analyzer-ng-crawler-flowthreat"

crawl_behaviour = "CRAWL_NEW_FOLDERS_ONLY"*/
