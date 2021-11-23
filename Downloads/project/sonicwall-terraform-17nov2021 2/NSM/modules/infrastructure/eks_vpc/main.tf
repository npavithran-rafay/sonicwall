#############################
#create the VPC
#############################
resource "aws_vpc" "eks_vpc" {
  cidr_block           = "${var.vpc_cidr}"
  instance_tenancy     = "default"
  enable_dns_support   = true
  enable_dns_hostnames = true

  tags = "${
    map(
     "Name","${var.vpc_tag_name}",
     "kubernetes.io/cluster/${var.eks_cluster_name}","shared",
    )
  }"
}

##############################
#create the internet gateway
##############################
resource "aws_internet_gateway" "eks_vpc_ig_gw" {
  vpc_id = "${aws_vpc.eks_vpc.id}"

  tags = {
    Name = "${var.ig_gw_tag_name}"
  }
}

############################################################################
# Creates N public subnets according to the subnet mapping described in
# the `az-public-subnet-mapping` variable.
#
# The variable is a list of maps in the following form:
#
#
# For instance:
#
#   [ { name =  "sub1", az = "us-east-1a", cidr = "192.168.0.0/24"  } ]
##############################################################################
resource "aws_subnet" "production_public_subnets" {
  count = "${length(var.az-public-subnet-mapping)}"

  cidr_block        = "${lookup(var.az-public-subnet-mapping[count.index], "cidr")}"
  vpc_id            = "${aws_vpc.eks_vpc.id}"
  availability_zone = "${lookup(var.az-public-subnet-mapping[count.index], "az")}"
  map_public_ip_on_launch = true

  tags = "${
    map(

      "Name","${lookup(var.az-public-subnet-mapping[count.index], "name")}",
      "kubernetes.io/cluster/${var.eks_cluster_name}","shared",
      "kubernetes.io/role/elb","1",
    )
  }"
}

#############################################################################
# Creates N private subnets according to the subnet mapping described in
# the `az-private-subnet-mapping` variable.
#
# The variable is a list of maps in the following form:
#
#
# For instance:
#
#   [ { name =  "sub1", az = "us-east-1a", cidr = "192.168.0.0/24"  } ]
#############################################################################
resource "aws_subnet" "production_private_subnets" {
  count = "${length(var.az-private-subnet-mapping)}"

  cidr_block        = "${lookup(var.az-private-subnet-mapping[count.index], "cidr")}"
  vpc_id            = "${aws_vpc.eks_vpc.id}"
  availability_zone = "${lookup(var.az-private-subnet-mapping[count.index], "az")}"
  map_public_ip_on_launch = true

  tags = "${
    map(
      "Name","${lookup(var.az-private-subnet-mapping[count.index], "name")}",
      "kubernetes.io/cluster/${var.eks_cluster_name}","shared",
      "kubernetes.io/role/internal-elb","1",
    )
  }"
}

#############################
#create public IP for NAT GW
############################
resource "aws_eip" "nat_gw_eip" {
  vpc = true

  tags = {
    Name = "${var.nat_gw_eip_tag_name}"
  }
}

#################################
#create the NAT gateway
#################################
resource "aws_nat_gateway" "natgw" {
  allocation_id = "${aws_eip.nat_gw_eip.id}"
  subnet_id     = "${element(aws_subnet.production_public_subnets.*.id, 1)}"

  tags = {
    Name = "${var.nat_gw_tag_name}"
  }

  depends_on = ["aws_internet_gateway.eks_vpc_ig_gw"]
}

###################################
#create the public route table
###################################
resource "aws_route_table" "production_public_routetable" {
  vpc_id = "${aws_vpc.eks_vpc.id}"

  tags = {
    Name = "${var.public_route_table_tag_name}"
  }
}

###################################
#create the private route table
###################################
resource "aws_route_table" "production_private_routetable" {
  vpc_id = "${aws_vpc.eks_vpc.id}"

  tags = {
    Name = "${var.private_route_table_tag_name}"
  }
}

######################################
#create the default public route
#######################################

resource "aws_route" "production_public_default_route" {
  route_table_id         = "${aws_route_table.production_public_routetable.id}"
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = "${aws_internet_gateway.eks_vpc_ig_gw.id}"
}

#create the default private route

resource "aws_route" "production_private_default_route" {
  route_table_id         = "${aws_route_table.production_private_routetable.id}"
  destination_cidr_block = "0.0.0.0/0"
  nat_gateway_id         = "${aws_nat_gateway.natgw.id}"
}

#create public route table association
resource "aws_route_table_association" "production_public_routetable_association" {
  count          = "${length(var.az-public-subnet-mapping)}"
  subnet_id      = "${element(aws_subnet.production_public_subnets.*.id, count.index)}"
  route_table_id = "${aws_route_table.production_public_routetable.id}"
}

#create private route table association
resource "aws_route_table_association" "production_private_routetable_association" {
  count          = "${length(var.az-private-subnet-mapping)}"
  subnet_id      = "${element(aws_subnet.production_private_subnets.*.id, count.index)}"
  route_table_id = "${aws_route_table.production_private_routetable.id}"
}
