variable "region" {
}
variable "network_state_bucket" {}

variable "network_state_key" {}

variable "network_state_region" {}

variable "emr_network_state_key" {}
#-----------------------------#
#Applies to all the EC2
#-----------------------------#
variable "key_name" {
  description = "the key file"
}

variable "prefix_analyzer" {
  type        = string
  #default     = "terraform created"
  description = "Prefix for the resources"
}


#variable "az_one_id" {
#  description = "az one id"
#  #default     = ""
#}

#variable "az_two_id" {
#  description = "az two id"
#  #default     = ""
#}

variable "az_one_cidr" {
  description = "az one cidr block"
}

#variable "az_two_cidr" {
#  description = "az two cidr block"
#}

variable "security_group_ids" {
  description = "security group ids"
  type        = list
}

variable "enviroment_tag" {
  description = "enviroment_tag"
}

variable "bu_tag" {
  description = "bu_tag"
}

variable "applicationName_tag" {
  description = "Bussiness Unit"
}

variable "region_tag" {
  description = "Region of ec2"
}

variable "applicationtype_tag" {
  description = "Application Type"
}

variable "deploymenttype_tag" {
  description = "Type of deployment"
  default     = "Terraform"
}


variable "iam_instance_profile" {
   description = "iam role for the EC2"
   default =  ""
}

variable "sd_check" {
  description = "Controls if traffic is routed to the instance when the destination address does not match the instance. Used for NAT or VPNs. defaults true"
  #default = true
}


#-------------------------------#
# EMR Client1 variables
#-------------------------------#

variable "emr_client1_number" {
  description = "number of ec2 to deploy"
  #default     = 1
}

variable "emr_client1_ami" {
  description = "AMI to use"
}

variable "emr_client1_ami_instance_type" {
  description = "the type of instance i.e t2.nano t2.micro etc"
  #default     = "t2.nano"
}

variable "emr_client1_volume_size" {
  description = "the size of the volume"
  #default     = 100
}

variable "number_of_ebs_emr_client1" {
  description = "number of EBS to attach"
  #default     = 1
}

variable "ebs_volume_size_emr_client1" {
  description = "the size of the 2nd volume"
  #default     = 50
}

variable "ebs_device_name_emr_client1" {
  description = "device name for EBS mapping see AWS Doc for full list"
  type        = list(string)
  #default     = ["/dev/sdf"]
}


variable "machineType_emr_client1" {
  description = "machine type"
}

#-------------------------------#
# EMR Client 2 variables
#-------------------------------#


variable "emr_client2_number" {
  description = "number of ec2 to deploy"
  #default     = 1
}

variable "emr_client2_ami" {
  description = "AMI to use"
}

variable "emr_client2_ami_instance_type" {
  description = "the type of instance i.e t2.nano t2.micro etc"
  #default     = "t2.nano"
}

variable "emr_client2_volume_size" {
  description = "the size of the volume"
  #default     = 100
}

variable "number_of_ebs_emr_client2" {
  description = "number of EBS to attach"
  #default     = 1
}

variable "ebs_volume_size_emr_client2" {
  description = "the size of the 2nd volume"
  #default     = 50
}

variable "ebs_device_name_emr_client2" {
  description = "device name for EBS mapping see AWS Doc for full list"
  type        = list(string)
  #default     = ["/dev/sdf"]
}

variable "machineType_emr_client2" {
  description = "machine type"
}


variable "delete_volume_on_termination"{

 description = "Whether the volume should be destroyed on instance termination"
 #default = true

}

variable "ebs_iops" {
  description = "IOPS provision. This must be set for volume type io1"
 # default = 0

}
variable "volume_type"{

 description = "The type of volume Can be standard gp2 io1 sc1 or st1"
 #default = "gp2"
}
variable "ami_monitoring" {
  description = "if true, the launched EC2 instance will have detailed monitoring enabled"
  #default = false
}
variable "ami_termination_protection" {
  description = "if true, enables EC2 instance termination protection"
  #default = false

}
variable "associate_public_ip_address" {
  description = "Associate a public IP address "
  #default = false
}

variable "volume_iops"{

 description = "The amount of provisioned IOPS. This is only valid for volume_type of io1, and must be specified if using that type"
 #default = 0
}

variable "ebs_optimized"{
   description = "If true, the launched EC2 instance will be EBS-optimized."
   #default = false
}
variable "ebs_volume_type" {
  description = "the type of EBS volume. standard, gp or io1"
  #default     = "gp2"

}

variable "ami_shutdown_behavior" {
  description = "Shutdown behavior for the EC2 instance"
    #default = "stop"
}


variable "subnet_id" { 
}