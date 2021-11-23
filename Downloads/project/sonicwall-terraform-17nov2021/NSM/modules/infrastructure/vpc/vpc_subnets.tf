# Creates N public subnets according to the subnet mapping described in
# the `az-public-subnet-mapping` variable.
#
# The variable is a list of maps in the following form:
#
#
# For instance:
#
#   [ { name =  "sub1", az = "us-east-1a", cidr = "192.168.0.0/24"  } ]
#
resource "aws_subnet" "production_public_subnets" {
  count = "${length(var.az-public-subnet-mapping)}"

  cidr_block              = "${lookup(var.az-public-subnet-mapping[count.index], "cidr")}"
  vpc_id                  = "${aws_vpc.production_vpc.id}"
  availability_zone       = "${lookup(var.az-public-subnet-mapping[count.index], "az")}"
  map_public_ip_on_launch = "true"

  tags = {
    Name = "${lookup(var.az-public-subnet-mapping[count.index], "name")}"
  }
}


# Creates N private subnets according to the subnet mapping described in
# the `az-private-subnet-mapping` variable.
#
# The variable is a list of maps in the following form:
#
#
# For instance:
#
#   [ { name =  "sub1", az = "us-east-1a", cidr = "192.168.0.0/24"  } ]
#
resource "aws_subnet" "production_private_subnets" {
  count = "${length(var.az-private-subnet-mapping)}"

  cidr_block              = "${lookup(var.az-private-subnet-mapping[count.index], "cidr")}"
  vpc_id                  = "${aws_vpc.production_vpc.id}"
  availability_zone       = "${lookup(var.az-private-subnet-mapping[count.index], "az")}"

  tags = {
    Name = "${lookup(var.az-private-subnet-mapping[count.index], "name")}"
  }
}
