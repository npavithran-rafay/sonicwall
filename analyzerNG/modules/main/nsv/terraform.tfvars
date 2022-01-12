/*#-------------------------------------------------------------------
#aws info
#------------------------------------------------------------------
aws_access_key = ""

aws_secret_key = ""

#Region for the VPC
#region = "eu-central-1"
region  = "us-west-1"

## State file location of VPC
network_state_bucket         = "snwl-production-terraform-state"
network_state_key            = "production/frankfurt/infrastructure/vpc/main/terraform.tfstate"
#network_state_region         = "us-west-2"
network_state_region         = "us-west-1"

#--------------------------------------------------------------#

#----------------------------------#
# Production nsv variables         #
#----------------------------------#

nsv_number = "1"

nsv_ami = "ami-0c2bf11bd07dfa9b2"

nsv_ami_instance_type = "c5.2xlarge"

nsv_volume_size = "60"

key_name = "XXXXXX"

security_group_lb_ids = ["sg-02f417ad65729328d"]

az_one_public_id = "subnet-0bcff0bc99c3fb55d"

az_one_public_cidr = "10.84.30.0/24"

ami_termination_protection  = "false"
ebs_optimized               = "false"
ebs_volume_type             = "gp2"
ebs_device_name             = ["/dev/xvdb", "/dev/xvdc", "/dev/xvdd", "/dev/xvde", "/dev/xvdf", "/dev/xvdg", "/dev/xvdh", "/dev/xvdi", "/dev/xvdj", "/dev/xvdk", "/dev/xvdl", "/dev/xvdm", "/dev/xvdn", "/dev/xvdo", "/dev/xvdp", "/dev/xvdq", "/dev/xvdr", "/dev/xvds", "/dev/xvdt", "/dev/xvdu", "/dev/xvdv", "/dev/xvdw", "/dev/xvdx", "/dev/xvdy", "/dev/xvdz"]
ami_monitoring              = "false"
ami_shutdown_behavior       = "stop"
associate_public_ip_address = "false"
volume_type                 = "gp2"
ebs_volume_number           = 1
volume_iops                 = 0
delete_volume_on_termination= "true"
ebs_volume_size             = 10
ebs_iops                    = 0




#---------------------------------------------------------------#
#NSv LAN Nic variable for the attach Nic on the 1st Production NSv #
#---------------------------------------------------------------#
nsv1_lan_ip = ["10.84.130.210"]


prefix_analyzer                 = "eu1aws"

enviroment_tag         = "Production"
 
bu_tag                 = "NSM"

applicationName_tag    = "NSM"

region_tag             = "Frankfurt"

machineType_tag        = "NSv"

applicationtype_tag    = "Analyzer-NG"*/