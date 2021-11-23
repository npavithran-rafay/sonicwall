# #-----------------------------------------------------------------#
# # Configure Terragrunt to automatically store tfstate files in S3 #
# #-----------------------------------------------------------------#
# # terragrunt = {
# #   remote_state {
# #     backend = "s3"

# #     config {
# #       encrypt        = false
# #       bucket         = "xxxxx-terraform-state"
# #       key            = "production/XXXXXX/eks/general/terraform.tfstate"
# #       region         = "us-west-2"
# #       dynamodb_table = "production-lock-table"
# #     }
# #   }
# # }

# #---------------------------------------------------------------#
# #aws provider info                                              #
# #---------------------------------------------------------------#
# # aws_access_key = ""

# # aws_secret_key = ""

# #Region for the VPC
# # region = "eu-central-1"

# #---------------------------------------------------------------#
# # VPC resources                                                 #
# #---------------------------------------------------------------#

# vpc_name = "EU1AWS-EKS-PRODUCTION-VPC"

# #VPC cidr block
# vpccidr = "10.113.0.0/16"

# #Internet Gateway Name
# ig_gw_name = "EU1AWS-EKS-PRODUCTION-INTERNET-GATEWAY"

# #NAT Gateway Name
# nat_gw_name = "EU1AWS-EKS-PRODUCTION-NAT-GATEWAY"

# #NAT Gateway public IP name
# nat_gw_eip_name = "EU1AWS-EKS-PRODUCTION-NAT-GATEWAY-IP"

# #Public route table name
# public_routetable_name = "EU1AWS-EKS-PRODUCTION-VPC-PUBLIC-RT"

# #Private route table name
# private_routetable_name = "EU1AWS-EKS-PRODUCTION-VPC-INTERNAL-RT"

# #"Private subnets mapping has to match your VPC CIDR Block or it will fail
# private_az_subnets_cidr = [
#   {
#     name = "EKS-PRODUCTION-10.113.0.0/19"
#     az   = "eu-central-1a"
#     cidr = "10.113.0.0/19"
#   },
#   {
#     name = "EKS-PRODUCTION-10.113.32.0/19"
#     az   = "eu-central-1b"
#     cidr = "10.113.32.0/19"
#   },
#   {
#     name = "EKS-PRODUCTION-10.113.64.0/19"
#     az   = "eu-central-1c"
#     cidr = "10.113.64.0/19"
#   },
# ]

# #Pubic subnets mapping has to match your VPC CIDR Block or it will fail

# public_az_subnets_cidr = [
#   {
#     name = "EKS-PUBLIC-10.113.128.0/19"
#     az   = "eu-central-1a"
#     cidr = "10.113.128.0/19"
#   },
#   {
#     name = "EKS-PUBLIC-10.113.160.0/19"
#     az   = "eu-central-1b"
#     cidr = "10.113.160.0/19"
#   },
#   {
#     name = "EKS-PUBLIC-10.113.192.0/19"
#     az   = "eu-central-1c"
#     cidr = "10.113.192.0/19"
#   },
# ]

# #-----------------------------------------------------#
# # EKS Master Security Group                           #
# #-----------------------------------------------------#

# eksmaster_sg_name = "EKS-SG"

# eksmaster_sg_description = "eks fra master sg group"

# #----------------------------------------------------#
# # EKS Master Security Group  TCP rule                #
# #----------------------------------------------------#

# #allow all ports control by the VPN firewall rule
# sg_eksmaster_tcp_inbound_ports = "443"

# sg_eksmaster_tcp_protocol = "tcp"

# sg_eksmaster_tcp_ingress_cidr = ["10.50.18.0/24"]

# sg_eksmaster_description = "allow internal access"

# #----------------------------------------------------#
# # EKS worker sg all  rules                             #
# #----------------------------------------------------#

# sg_eksmaster_all_inbound_ports = "0"

# sg_eksmaster_all_protocol = "-1"

# sg_eksmaster_all_ingress_cidr = ["10.50.18.0/24", "10.82.0.0/16"]

# sg_eksmaster_all_description = "Allow internal access"

# #-----------------------------------------------------#
# # EKS worker security group                            #
# #-----------------------------------------------------#

# eks_sg_name = "EKS-worker-SG"

# eks_sg_description = "eks fra worker security group"

# #----------------------------------------------------#
# # EKS worker sg   rules                             #
# #----------------------------------------------------#

# sg_eksworker_tcp_inbound_ports = "0"

# sg_eksworker_tcp_protocol = "-1"

# sg_eksworker_tcp_ingress_cidr = ["10.50.18.0/24"]

# sg_eksworker_description = "Allow node to communicate with each other and to masters"

# #------------------------------------------#
# # EKS cluster
# #------------------------------------------#

# eks_iam_role_name = "fra-eks-production-role"

# eks_cluster_name = "fra-eks-production-general-cluster"

# eks_cluster_version = "1.16"

# eks_cluster_log_types = ["api", "audit", "scheduler"]

# retention_days = "7"

# bu                         = "NSM"

# application                = "NSM"

# tag_environment            = "Production"

# tag_region                 = "Frankfurt"

# #------------------------------------------#
# # EKS worker auto scaling lauch config
# #------------------------------------------#

# eks_node_group_name = "fra-eks-production-general-woker-node-group"

# eks_node_group_iam_role = "fra-eks-workernode-role"

# ami_type = "AL2_x86_64"

# instance_type = ["m5.xlarge"]

# root_volume_size = "75"

# ec2_ssh_key = "fra-keys"

# #--------------------------------------#
# #EKS auto scaling group
# #--------------------------------------#

# desired_capacity = "6"

# max_size = "100"

# min_size = "3"

# #--------------------------------------#
# # EKS gitea node group
# #--------------------------------------#
# #eks_node_group_gitea_name = "fra-eks-eks-production-worker-node-gitea-group"
# #node_group_gitea_instance_type = ["m5.xlarge"]

# #desired_capacity_gitea = "2"

# #max_size_gitea = "2"

# #min_size_gitea = "1"

# #eks_gitea_subnet_ids = ["subnet-073c25c616640dd6f", "subnet-0860fd29c90a60acc"]

# #--------------------------------------#
# # EKS gitea node group-new
# #--------------------------------------#
# eks_node_group_gitea_new_name = "fra-eks-production-nsm-worker-nodegroup-gitea-new"
# node_group_gitea_new_instance_type = ["m5.xlarge"]

# desired_capacity_gitea_new = "2"

# max_size_gitea_new = "2"

# min_size_gitea_new = "1"

# eks_gitea_new_subnet_ids = ["subnet-0860fd29c90a60acc"]

