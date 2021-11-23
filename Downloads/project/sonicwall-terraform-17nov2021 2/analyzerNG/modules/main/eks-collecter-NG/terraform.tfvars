/*#Region for the VPC
#region = "eu-central-1"
region  = "us-west-1" 
tcp_port     = 22
protocol     = "tcp"

#elb_num          = "1"
#internal_elb_num = "1"

subnet_tags      = "shared"

vpc_id           = "vpc-0fbd2XXXXXXXXXXXXX88"

## Change the CIDR to match the environments
cidr_blocks_all_worker_groups = ["10.84.0.0/16", "10.50.18.0/24", "10.11.0.0/16", "10.21.0.0/16", "10.100.0.0/16", "10.206.34.0/24", "10.203.15.0/24", "10.108.0.0/16", "10.202.0.0/16", "10.113.0.0/16", "10.114.0.0/16"]

cluster_endpoint_private_access_cidrs = ["10.84.0.0/16", "10.50.18.0/24", "10.11.0.0/16", "10.21.0.0/16", "10.100.0.0/16", "10.206.34.0/24", "10.113.0.0/16", "10.203.15.0/24", "10.108.0.0/16", "10.202.0.0/16", "10.114.0.0/16"]

## Private subnets of the NSM R&A NSV's (LAN)
vpc_private_subnets = ["subnet-012e28f341285a86d","subnet-01c61495db36a80fd"]

cluster_name        = "eu1aws-collectorNG-eks-cluster"
cluster_version     = "1.16"

log_types             = ["api", "audit", "scheduler"]
log_retention_in_days = 7

nodegroup_name                 = "eu1aws-nsm-collectorNG-node-group"
instance_type_group_one        = "m5.xlarge"
asg_desired_capacity_group_one = 7
asg_max_size_group_one         = 10
asg_min_size_group_one         = 1

#Tags
environment     = "Production"
tag_region      = "Frankfurt"
applicationtype = "Analyzer-NG"
bu              = "NSM"
application     = "NSM"

ssh_key                = "XXXXXXXXXX"

map_accounts           = ["940XXXX9"]

map_roles = [
  {
    rolearn  = "arn:aws:iam::940XXXX9:role/role1"
    username = "role1"
    groups   = ["system:masters"]
  },
]

map_users = [
    {
      userarn  = "arn:aws:iam::940XXXX9:user/btkubendran"
      username = "btkubendran"
      groups   = ["system:masters"]
    },
    ]
*/