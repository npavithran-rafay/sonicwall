#data "aws_vpc" "selected" {
#  id = "${var.vpc_id}"
#}

resource "aws_elasticache_subnet_group" "default" {
  name        = "${var.sub_grp_name}"
  subnet_ids  = ["${var.subnet_ids}"]
  description = "${var.sub_grp_description}"
}
