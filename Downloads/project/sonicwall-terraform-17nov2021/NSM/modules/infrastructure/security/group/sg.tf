#Security Group


resource "aws_security_group" "default" {
     vpc_id      =  "${var.vpc_id}"
     name        =  "${var.sg_name}"
     description =  "${var.sg_description}"

      tags {

              Name = "${var.sg_name}"
              BU   = "${var.sg_bu}"
         }

}



# Creates N number of security Group according to the security mapping described in
# the `sg_mapping` variable.
#
# The variable is a list of maps in the following form:
#
#
# For instance:
#
#   [ { name =  "mysgname", description = "a security group" } ]
#

#resource "aws_security_group" "default"{
#      count = "${length(var.sg_mapping)}"
#     
#      vpc_id      =  "${var.vpc_id}"
#      name        =  "${lookup(var.sg_mapping[count.index],"name")}"
#	  description =  "${lookup(var.sg_mapping[count.index],"description")}"
#
#      tags {
#	  
#	       Name = "${lookup(var.sg_mapping[count.index],"name")}"
#	  
#	  }
#
#}
