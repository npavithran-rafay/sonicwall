variable "aws_region" {
  description = "Region for the VPC"
  # default     = "us-east-1"
}

variable "vpc_tag_name" {
  description = "VPC tag name"
  # default     = "XX1AWS-PRODUCTION-VPC"
}

variable "ig_gw_tag_name" {
  description = "Internet Gateway tag name"
  # default     = "XX1AWS-PRODUCTION-INTERNET-GATEWAY"
}

variable "public_route_table_tag_name" {
  description = "Public Route table tag name"
  # default     = "XX1AWS-PRODUCTION-VPC-PUBLIC"
}

variable "private_route_table_tag_name" {
  description = "Private Route table tag name"
  # default     = "XX1AWS-PRODUCTION-VPC-PRIVATE"
}

variable "nat_gw_eip_tag_name" {
  description = "NAT Gateway eIP tag name"
  # default     = "XX1AWS-NAT-GATEWAY"
}

variable "nat_gw_tag_name" {
  description = "NAT Gateway tag name"
  # default     = "XX1AWS-PRODUCTION-NAT-GATEWAY"
}

variable "vpc_cidr" {
  description = "CIDR for VPC"
  # default     = "192.168.0.0/16"
}

variable "eks_cluster_name" {
  default = "terraform-eks-vpc"
}

variable "az-private-subnet-mapping" {
  type        = list(map(string))
  description = "Lists the private subnets to be created in their respective AZ."

  # default = [
  #   {
  #     name = "XX1AWS-SERVICENAME-192.168.100.X"
  #     az   = "us-east-1a"
  #     cidr = "192.168.100.0/24"
  #   },
  #   {
  #     name = "XX1BAWS-SERVICENAME-192.168.101.X"
  #     az   = "us-east-1b"
  #     cidr = "192.168.101.0/24"
  #   },
  # ]
}

variable "az-public-subnet-mapping" {
  type        = list(map(string))
  description = "Lists the public subnets to be created in their respective AZ."

  # default = [
  #   {
  #     name = "XX1AWS-PUBLIC-192.168.30.X"
  #     az   = "us-east-1a"
  #     cidr = "192.168.30.0/24"
  #   },
  #   {
  #     name = "XX1BAWS-PUBLIC-192.168.31.X"
  #     az   = "us-east-1b"
  #     cidr = "192.168.31.0/24"
  #   },
  # ]
}
variable "eks_gitea_private_az_subnets_cidr" {
  type        = list(map(string))
  description = "gitea Private subnets mapping"
}
variable "eks_neo4j_private_az_subnets_cidr" {
  type        = list(map(string))
  description = "neo4j Private subnets mapping"
}