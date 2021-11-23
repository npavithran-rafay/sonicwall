variable  "number_of_ami" {
   
  description = "Number of EC2 instance to create"
  default = 1
      

}


variable "ami"  {
  
   description = "the AMI to use for to create the ec2 instance"
   
}

variable "ami_instance_type" {

   description = "instance type of the EC2"
   default =  "t2.nano"

}

variable "key_pair_name"  {
   
   description = "name of the key to use for the ec2"

}

variable "ebs_optimized"{
   description = "If true, the launched EC2 instance will be EBS-optimized."
   default = false

}

variable "ami_termination_protection" { 
  description = "if true, enables EC2 instance termination protection"
  default = false

}

variable "ami_shutdown_behavior" {
  description = "Shutdown behavior for the EC2 instance"
  default = "stop"

}

variable "sd_check" {
  description = "Controls if traffic is routed to the instance when the destination address does not match the instance. Used for NAT or VPNs. Defaults true"
  default = true
}

variable "ami_monitoring" {
  description = "if true, the launched EC2 instance will have detailed monitoring enabled"
  default = false

}

variable "vpc_security_group_ids" {
  type = "list"
  description = "list of security group IDs to associate with. "

}

variable "ami_az"{
  description ="the AZ to put the EC2 instance"
  default = ""


}

variable "ami_subnet_id" {
  description = "the subnet the EC2 will be launch in"
  default = ""
  
}
  
variable "associate_public_ip_address" {
  description = "Associate a public IP address "
  default = false

}

variable "private_subnet_cidr" {
 description = "subnet cidr where the EC2 instance will be launch. use to create the ip with cidrhost() function"
 default = ""

}

//The last octect that serves as the start of the IP addresses for the ec2 instance. 
//i.e 200, if the network address is 10.0.0.0/24, 
//the three EC2 will be assigned addresses 10.0.0.200, 10.0.0.201, and 10.0.0.202."

variable "ami_ip_address_start" {

 description = "The last octect that serves as the start of the IP addresses for the ec2 instance"

  default = ""
}

variable "volume_type"{

 description = "The type of volume Can be standard gp2 io1 sc1 or st1"
 default = "gp2"

}

variable "volume_size"{

 description = "The size of the volume in gibibytes (GiB)." 
 default = "10"

}

variable "volume_iops"{

 description = "The amount of provisioned IOPS. This is only valid for volume_type of io1, and must be specified if using that type"
 default = "0"

}

variable "delete_volume_on_termination"{

 description = "Whether the volume should be destroyed on instance termination"
 default = true 

}


variable "ebs_volume_number" {
 description = "number of extra volumes"
 default = "0"

}

variable "ebs_volume_size"{

 description = "ebs size"
 default = "10"


}

variable "ebs_volume_type" {
  description = "the type of EBS volume. standard, gp or io1"
  default     = "gp2"
 
}

variable "ebs_iops" {
  description = "IOPS provision. This must be set for volume type io1"
  default = "0"

}

#mount point for full list see AWS site
#https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/device_naming.html
variable "ebs_device_name" {

  description = "Ebs mount point"
  type        = "list"
  default     = ["/dev/xvdb", "/dev/xvdc", "/dev/xvdd", "/dev/xvde", "/dev/xvdf", "/dev/xvdg", "/dev/xvdh", "/dev/xvdi", "/dev/xvdj", "/dev/xvdk", "/dev/xvdl", "/dev/xvdm", "/dev/xvdn", "/dev/xvdo", "/dev/xvdp", "/dev/xvdq", "/dev/xvdr", "/dev/xvds", "/dev/xvdt", "/dev/xvdu", "/dev/xvdv", "/dev/xvdw", "/dev/xvdx", "/dev/xvdy", "/dev/xvdz"]

}


variable "name_tag" {
  description = "the tag name for the EC2"
  default = "Terraform0"

}

variable "enviroment_tag" {
  description = "the enviroment QA/Prodsim/Production"
  default  = "testing"

}

variable "bu_tag" {

  description = "the BU it belongs to"
  default = "Engineering"

}

variable "applicationName_tag" {
  description = "the name of the application"
  default = "test_app"

}

variable "region_tag" {
 description = "the region the EC2 belongs to"
 default = "N.Virginia"

}

variable "machineType_tag" {
  description = "the role of the EC2"
  default = "testMachine"

}
