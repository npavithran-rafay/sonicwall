#create the internet gateway
resource "aws_internet_gateway" "production_vpc_ig_gw"{
      vpc_id = "${aws_vpc.production_vpc.id}"

	  tags = {
	    Name = "${var.ig_gw_tag_name}"
	  }
}