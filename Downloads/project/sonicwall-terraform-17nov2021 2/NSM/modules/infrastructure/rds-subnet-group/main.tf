#-------------------------------------------#
# Create the DB Subnet group to be used by DB
#-------------------------------------------#


resource "aws_db_subnet_group" "db_subnet_group" {
  name         = "${var.db_subnet_group_name}"
  description  = "${var.db_sg_description}"
  subnet_ids   = ["${var.db_subnet_group_ids}"]

  tags = {
     name = "${var.tag_name}"
  }
}


