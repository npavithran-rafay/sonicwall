#Security Group Rules
# 
#
#Create Security Rule 
# 
#
#
# 
#


resource "aws_security_group_rule" "default"{

      count = "${length(split(",",var.ports))}"
       
      security_group_id  =  "${var.sg_id}"
      type           =  "${var.sg_rule_type}"
	  from_port      =  "${element(split("," , var.ports), count.index)}"
	  to_port        =  "${element(split("," , var.ports), count.index)}"
	  protocol       =  "${var.protocol}"
	  cidr_blocks    =  "${var.cidr}"
	  description    =  "${var.description}"

}
