#--------------------------------------------#
#Read Route Table ID from the Private subnet
#in the Production VPC in the Frankfurt Region
#to associate the new routes that were created
#-------------------------------------------#
data "aws_route_table" "selected_rt" {
  vpc_id = "${var.production_vpc_id}"

  # tags = {
  #   Name = "EU1AWS-PRODUCTION-VPC-INTERNAL"
  # }
}
