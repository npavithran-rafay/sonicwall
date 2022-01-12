variable "sg_id" {
	description = "security group id to apply the rule"

}


variable "sg_rule_type" {
	description = "rule type ingress | engress "

}

variable "ports" {
      description = "ports to open"

}

variable "cidr" {
	type = list
   	description = "subnets to allow"
}

variable "protocol" {
        
	description = "protocol type TCP | UDP"
}

variable "description" {

	description = "description of the rule"
}
