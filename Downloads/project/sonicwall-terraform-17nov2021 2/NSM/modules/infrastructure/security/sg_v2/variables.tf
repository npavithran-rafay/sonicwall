variable "vpc_id" {

	   type = "string"
       description = "ID of the VPC to associate it with"

}

#variable "sg_tag_name" {
#	description = "SecurityGroup Tag name"
#}

variable "sg_mapping" {
        type = "list"
		description = "List of SecurityGroup to created in the VPC"
		
		default = [
		
    	  {
		     name = "default-tf-created-sg"
			 description = "a security group"
		      
		  
		  },
		
		
				
	]

}

