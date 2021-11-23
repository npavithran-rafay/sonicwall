variable "vpc_id" {

	   type = "string"
         description = "ID of the VPC to associate it with"

}

variable "sg_name" {
	description = "SecurityGroup  name"
}

variable "sg_bu" {
        description = "SecurityGroup BU"
        default     = "Terraform generated"
}

variable "sg_description" {


}

#variable "sg_mapping" {
#        type = "list"
#		description = "List of SecurityGroup to created in the VPC"
#		
#		default = [
#		
#                      	  {
#		   	   name = "default-tf-created-sg"
#		       	  description = "a security group"
#                 },
#			
#	]
#
#}

