#create public IP for NAT GW
resource "aws_eip" "nat_gw_eip" {
    vpc = true
	tags = {
	  Name = "${var.nat_gw_eip_tag_name}"
	}
}

#create the NAT gateway
resource "aws_nat_gateway" "natgw" {
     allocation_id = "${aws_eip.nat_gw_eip.id}"
	 subnet_id = "${element(aws_subnet.production_public_subnets.*.id, 1)}"
	 tags = {
	   Name = "${var.nat_gw_tag_name}"
	 }
	
	 depends_on = ["aws_internet_gateway.production_vpc_ig_gw"]
}
