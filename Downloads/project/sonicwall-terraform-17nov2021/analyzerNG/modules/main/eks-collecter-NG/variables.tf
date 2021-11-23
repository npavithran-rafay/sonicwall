variable "cluster_name" {
  description = "Cluster Name"
}

variable "tcp_port" {
  description = "tcp port"
}

variable "protocol" {
  description = "protocol"
}

variable "vpc_id" {
  description = "ID of VPC"
}

variable "subnet_tags" {
  description = "subnet_tags"
}

variable "vpc_private_subnets" {
  description = "VPC private cidr blocks"
}

variable "cluster_version" {
  description = "Kubernetes cluster version"
}

variable "log_types" {
  description = "Log types"
}

variable "log_retention_in_days" {
  description = "log retention in days"
}

#variable "worker_group_one_name" {
#  description = "Name of worker group one"
#}


variable "instance_type_group_one" {
  description = "instance type of worker group one"
}


#variable "platform_group_one" {
#  description = "platform of worker group one"
#}


variable "asg_desired_capacity_group_one" {
  description = "asg_desired_capacity of worker group one"
}


variable "asg_max_size_group_one" {
  description = "asg_max_size of worker group one"
}

variable "asg_min_size_group_one" {
  description = "asg_min_size of worker group two"
}

variable "ssh_key" {
  description = "ssh_key"
}

variable "environment" {
  description = "environment(prod, prodsim, dev etc)"
}

variable "tag_region" {
  description = "region of deployment"
}


variable "applicationtype" {
  description = "applicationtype"
}


variable "bu" {
  description = "Bussiness Unit"
}

variable "application" {
  description = "application name"
}

variable "nodegroup_name" {
  description = "Nodegroup Name"
}

variable "cidr_blocks_all_worker_groups" {
  description = "All worker groups"
  type = list(string)
}

variable "cluster_endpoint_private_access_cidrs" {
  description = "All CIDR that needs access to EKS cluster"
  type = list(string)
}


variable "region" {
}

variable "map_accounts" {
  description = "Additional AWS account numbers to add to the aws-auth configmap."
  type        = list(string)
}

variable "map_roles" {
  description = "Additional IAM roles to add to the aws-auth configmap."
  type = list(object({
    rolearn  = string
    username = string
    groups   = list(string)
  }))
}

variable "map_users" {
  description = "Additional IAM users to add to the aws-auth configmap."
  type = list(object({
    userarn  = string
    username = string
    groups   = list(string)
  }))

  #default = [
   # {
    #  userarn  = "arn:aws:iam::940XXXXXXX359:user/btkubendran"
     # username = "btkubendran"
      #groups   = ["system:masters"]
    #},
  #]
}
