variable "number_of_eip" {
    description = "desire count of public IPs to be allocated"
    default = "0"

}


variable "instance_id" {
    description = "(Optional) EC2 instance ID."
    default     = ""
#    type        = "list"
#    default     = []

}

variable "network_interface_id" {
    description = "(Optional) The ID of the network interface." 
    default = ""

}


variable "private_ip_address" {
    description = "(Optional) The primary or secondary private IP address to associate with the Elastic IP address" 
                  
   
    default = ""

}

variable "public_ip_pool" {
    description = "(Optional) The Elastic IP address. This is required for EC2-Classic."
    default = ""
}

variable "eip_tag_name" {
    description = "tag name for the eip"
    default     = "created by Terraform"

}
