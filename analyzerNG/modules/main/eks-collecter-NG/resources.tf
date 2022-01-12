#----------------------------------#
#Store the state file in S3 Bucket #
#----------------------------------#
/*terraform {
  # The configuration for this backend will be filled in by Terragrunt
  backend "s3" {}
}*/

#Retrieve information about an EKS Cluster.
data "aws_eks_cluster" "cluster" {
  # depends_on = [
  #   module.eks
  # ]
  name = module.eks.cluster_id
}

#Get an authentication token to communicate with an EKS cluster.
data "aws_eks_cluster_auth" "cluster" {
  # depends_on = [
  #   module.eks
  # ]
  name = module.eks.cluster_id
}

#The Availability Zones data source allows access to the list of AWS Availability Zones which can be accessed by an AWS account within the region configured in the provider.
data "aws_availability_zones" "available" {
}

#Provides a security group resource for all nodes group
resource "aws_security_group" "all_worker_mgmt" {
  name_prefix = "all_worker_management"
  vpc_id      = var.vpc_id

  ingress {
    from_port = var.tcp_port
    to_port   = var.tcp_port
    protocol  = var.protocol

    cidr_blocks = var.cidr_blocks_all_worker_groups
  }
  # egress {
  #   from_port        = 0
  #   to_port          = 0
  #   protocol         = "-1"
  #   cidr_blocks      = ["0.0.0.0/0"]
  # }
}

resource "aws_security_group" "all_worker_mgmt_one" {
  name_prefix = "all_worker_management_one"
  vpc_id      = var.vpc_id

  ingress {
    from_port = 0
    to_port   = 0
    protocol  = -1

    cidr_blocks = var.cidr_blocks_all_worker_groups
  }
  # egress {
  #   from_port        = 0
  #   to_port          = 0
  #   protocol         = "-1"
  #   cidr_blocks      = ["0.0.0.0/0"]
  # }
}


module "eks" {
  depends_on = [
    aws_security_group.all_worker_mgmt,
    aws_security_group.all_worker_mgmt_one
  ]
  source                          = "terraform-aws-modules/eks/aws"
  version                         = "17.24.0"
  cluster_name                    = var.cluster_name
  cluster_version                 = var.cluster_version
  subnets                         = flatten(var.vpc_private_subnets)
  #Enable access to EKS API server using kubectl.
  cluster_endpoint_public_access  = true
  #Enable private access to the Kubernetes API server so that all communication between your nodes and the API server stays within your VPC. 
  cluster_endpoint_private_access = true
  cluster_create_endpoint_private_access_sg_rule = true
  cluster_endpoint_private_access_cidrs = var.cluster_endpoint_private_access_cidrs

  cluster_enabled_log_types       = var.log_types
  cluster_log_retention_in_days   = var.log_retention_in_days
  write_kubeconfig                = true

  tags = {
    Environment     = var.environment
    Name            = var.cluster_name
    Region          = var.tag_region
    Applicationtype = var.applicationtype
    Application     = var.application
    BU              = var.bu
    Deploymenttype  = "Terraform"
  }

  vpc_id = var.vpc_id

  node_groups_defaults = {
    ami_type  = "AL2_x86_64"
    disk_size = 75
  }

  node_groups = {
    colletorng = {
      name             = var.nodegroup_name
      desired_capacity = var.asg_desired_capacity_group_one
      max_capacity     = var.asg_max_size_group_one
      min_capacity     = var.asg_min_size_group_one
      key_name         = var.ssh_key
      source_security_group_ids = [aws_security_group.all_worker_mgmt.id,aws_security_group.all_worker_mgmt_one.id]
      instance_types = var.instance_type_group_one
      k8s_labels = {
                Environment     = var.environment
		            Region          = var.tag_region
		            BU              = var.bu
                Name            = var.nodegroup_name
                Application     = var.application
                Deploymenttype  = "Terraform"
      }
      additional_tags = {
        ApplicationType = var.applicationtype
      }
    }
  }

  worker_additional_security_group_ids = [aws_security_group.all_worker_mgmt_one.id]


  map_roles                            = var.map_roles
  map_users                            = var.map_users
  map_accounts                         = var.map_accounts
}

