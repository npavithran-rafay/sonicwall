#create the public route table
resource "aws_route_table" "production_public_routetable"{
	
	vpc_id = "${aws_vpc.production_vpc.id}"
	    
	tags = {
		Name = "${var.public_route_table_tag_name}"
	}
}

#create the private route table
resource "aws_route_table" "production_private_routetable"{
	
	vpc_id = "${aws_vpc.production_vpc.id}"

	tags = {
		Name = "${var.private_route_table_tag_name}"
	}
}



#create the default public route

resource "aws_route" "production_public_default_route"{

	 route_table_id = "${aws_route_table.production_public_routetable.id}"
	 destination_cidr_block = "0.0.0.0/0"
	 gateway_id = "${aws_internet_gateway.production_vpc_ig_gw.id}"
}


#create the default private route

resource "aws_route" "production_private_default_route"{
	
	  route_table_id = "${aws_route_table.production_private_routetable.id}"
	  destination_cidr_block = "0.0.0.0/0"
	  nat_gateway_id = "${aws_nat_gateway.natgw.id}"
}

#create public route table association
resource "aws_route_table_association" "production_public_routetable_association" {

      count = "${length(var.az-public-subnet-mapping)}" 
      subnet_id = "${element(aws_subnet.production_public_subnets.*.id, count.index)}"	  
	  route_table_id = "${aws_route_table.production_public_routetable.id}"

}



#create private route table association
resource "aws_route_table_association" "production_private_routetable_association" {

      count = "${length(var.az-private-subnet-mapping)}"
   	  subnet_id = "${element(aws_subnet.production_private_subnets.*.id, count.index)}"
	  route_table_id = "${aws_route_table.production_private_routetable.id}"

}
