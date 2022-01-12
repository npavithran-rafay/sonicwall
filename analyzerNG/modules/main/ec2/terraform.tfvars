/*#-------------------------------------------------------------------
#aws info
#------------------------------------------------------------------
aws_access_key = ""

aws_secret_key = ""

#Region for the VPC
#region = "eu-central-1"
 region = "us-west-1"
## State file location of VPC to pull values
network_state_bucket         = "snwl-production-terraform-state"
network_state_key            = "production/frankfurt/infrastructure/vpc/main/terraform.tfstate"
network_state_region         = "us-west-2"

## State file location of EMR to pull values
emr_network_state_key        = "production/Frankfurt/nsm-analyzerNG/emr/terraform.tfstate"

#--------------------------------------------------------------#
#***************************************************************
# Create AMI
# Please check the resource.tf
# EC2 are created in multiple AZs hence the count is only 1
# but there are two servers that get deployed one on each AZ(s)
#--------------------------------------------------------------#


#----------------------------------#
#Applies to all the production EC2 #
#----------------------------------#
key_name               = "fra-keys"

prefix_analyzer                 = "eu1aws"

#az_one_id              = "subnet-012e28f341285a86d"

security_group_ids     = ["sg-085e9c2c46863edfd"]

az_one_cidr            = "10.84.130.0/24"

enviroment_tag         = "production"

bu_tag                 = "NSM"

applicationName_tag    = "NSM"

region_tag             = "Frankfurt"

applicationtype_tag    = "Analyzer-NG"


#---------------------------------#
# production EMRClient1 variables #
#---------------------------------#

emr_client1_number = 1

emr_client1_ami = "ami-00a205cb8e06c3c4e"

emr_client1_ami_instance_type = "t2.xlarge"

emr_client1_volume_size = 100

number_of_ebs_emr_client1 = 1

ebs_volume_size_emr_client1 = 50


machineType_emr_client1       = "EMR Client"

#device name for EBS mapping see AWS Doc for full list
ebs_device_name_emr_client1 = ["/dev/sdf"]


#----------------------------------#
# production EMRClient2 variables  #
#----------------------------------#

emr_client2_number = 1

emr_client2_ami = "ami-00a205cb8e06c3c4e"

emr_client2_ami_instance_type = "t2.xlarge"

emr_client2_volume_size = 100

number_of_ebs_emr_client2 = 1

ebs_volume_size_emr_client2 = 100

machineType_emr_client2        = "EMR Client"

#device name for EBS mapping see AWS Doc for full list
ebs_device_name_emr_client2 = ["/dev/sdf"] 

delete_volume_on_termination = "true"
ami_monitoring               = "false"
ami_shutdown_behavior        = "stop"
ami_termination_protection   = "false"
associate_public_ip_address  = "false"
ebs_iops                     = 0
ebs_optimized                = "false"
ebs_volume_type              = "gp2"
sd_check                     = "true"
volume_iops                  = 0
volume_type                  = "gp2"
*/

