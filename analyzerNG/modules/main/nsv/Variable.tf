variable "region" {
}

variable "network_state_bucket" {
  description = "Name of the remote state bucket to pull the values"
}


variable "network_state_key" {
  description = "Key of the remote state bucket"
}


variable "network_state_region" {
  description = "Region of the remote state bucket"
}

#-------------------------------#
#Nsv variables
#-------------------------------#

variable "prefix_analyzer" {
  #default = "Terraform Created"
}

variable "nsv_number" {
  description = "number of ec2 to deploy"
  #default     = 1
}

variable "nsv_ami" {
  description = "AMI to use"
}

variable "nsv_ami_instance_type" {
  description = "the type of instance i.e t2.nano t2.micro etc"
  #default     = "t2.nano"
}

variable "nsv_volume_size" {
  description = "the size of the volume"
  #default     = 100
}

variable "key_name" {
  description = "the key file"
}

#variable "az_one_id" {
#  description = "az one id"
#  default     = ""
#}

variable "az_one_public_id" {
  description = "az one id of public"
  #default     = ""
}

variable "az_one_public_cidr" {
  description = "az one public cidr block"
}

variable "private_security_group_ids" {
  description = "private security group ids of LBs"
  type        = list
}

variable "ami_private_subnet_id" {}

variable "security_group_lb_ids" {
  description = "security group ids of LBs"
  type        = list
}


#------------------------------------------------------#
#NSv LAN Nic variable for the attach Nic on the 1st NSv
#------------------------------------------------------#
variable "nsv1_lan_ip" {
  description = "the LAN ip for the Nsv Firewall, has to match the az where its being deployed"
  type        = list(string)
}

variable "enviroment_tag" {}

variable "bu_tag" {}

variable "applicationName_tag" {}

variable "region_tag" {}

variable "machineType_tag" {}

variable "applicationtype_tag" {}

variable "ami_termination_protection" {
  description = "if true, enables EC2 instance termination protection"
  #default = false
}

variable "ebs_optimized"{
   description = "If true, the launched EC2 instance will be EBS-optimized."
   #default = false
}
variable "ebs_volume_type" {
  description = "the type of EBS volume. standard, gp or io1"
  #default     = "gp2"

}
variable "ebs_device_name" {

  description = "Ebs mount point"
  type        = list(string)
  #default     = ["/dev/xvdb", "/dev/xvdc", "/dev/xvdd", "/dev/xvde", "/dev/xvdf", "/dev/xvdg", "/dev/xvdh", "/dev/xvdi", "/dev/xvdj", "/dev/xvdk", "/dev/xvdl", "/dev/xvdm", "/dev/xvdn", "/dev/xvdo", "/dev/xvdp", "/dev/xvdq", "/dev/xvdr", "/dev/xvds", "/dev/xvdt", "/dev/xvdu", "/dev/xvdv", "/dev/xvdw", "/dev/xvdx", "/dev/xvdy", "/dev/xvdz"]

}
variable "ami_monitoring" {
  description = "if true, the launched EC2 instance will have detailed monitoring enabled"
  #default = false
}
variable "ami_shutdown_behavior" {
  description = "Shutdown behavior for the EC2 instance"
  #default = "stop"

}
variable "associate_public_ip_address" {
  description = "Associate a public IP address "
  #default = false

}
variable "volume_type"{

 description = "The type of volume Can be standard gp2 io1 sc1 or st1"
 #default = "gp2"

}
variable "ebs_volume_number" {
 description = "number of extra volumes"
 #default = 1

}
variable "volume_iops"{

 description = "The amount of provisioned IOPS. This is only valid for volume_type of io1, and must be specified if using that type"
 #default = 0

}
variable "delete_volume_on_termination"{

 description = "Whether the volume should be destroyed on instance termination"
 #default = true

}
variable "ebs_volume_size"{
 description = "ebs size"
 #default = 10
}
variable "ebs_iops" {
  description = "IOPS provision. This must be set for volume type io1"
  #default = 0
}

variable "subnet_ids" {
}
