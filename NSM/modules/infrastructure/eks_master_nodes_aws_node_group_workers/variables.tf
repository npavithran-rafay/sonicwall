###################################
#eks master cluster node variables
###################################
variable "eks_iam_role_name" {
  # default = "eks-cluster-iamrole-terraform"
  # type    = string
}

variable "eks_cluster_name" {
  # default = "test-cluster-terraform"
  # type    = string
}

variable "eks_cluster_version" {
  description = "eks cluster version"
  # default     = "1.14"
}

variable "eks_cluster_log_types" {
  description = "logging types api audit authenticator controller manager scheduler"
  # default     = ["api", "audit"]
  # type = list
}

variable "retention_days" {
  description = "log retention days"
  # default     = "3"
}

#this is required
variable "eks_subnet_ids" {
  type = list
}

variable "eks_security_groups_ids" {
  # type = list
}

variable "eks_endpoint_private_access" {
  description = "Indicates whether or not the Amazon EKS private API server endpoint is enabled."
  # default     = false
}

variable "eks_endpoint_public_access" {
  description = "Indicates whether or not the Amazon EKS public API server endpoint is enabled."
  # default     = true
}

variable "eks_endpoint_public_access_cidr" {
  description = "List of CIDR blocks. Indicates which CIDR blocks can access the Amazon EKS public API server endpoint when enabled. "
  # type = list
  # default     = ["0.0.0.0/0"]
}

variable "bu" {
  # default     = "terraform"
  description = "Bussiness unit."
  # type        = string
}

variable "application" {
  # default     = "terraform"
  description = "application name."
  # type        = string
}

variable "tag_environment" {
  # default     = "terraform-created"
  description = "environment - prod, sim etc."
  # type        = string
}

variable "tag_region" {
  # default     = "terraform-created"
  description = "name of the region."
  # type        = string
}


#########################################
#eks worker variables
#########################################

variable "eks_cluster_node_group_name" {
  description = "eks cluster nodes group name"
  # default     = "eks-worknode-cluster-terraform"
}

variable "eks_workernode_iam_role_name" {
  description = "name of the eks workernode iam role"
  # default     = "eks-workernode-role"
}

variable "eks_worker_subnet_ids" {
  type = list
}

variable "instance_type" {
  description = "instance type for the lauch config"
  # type        = list
  # default     = ["m5.large"]
}

variable "ami_type" {
  description = "ami type Valid values AL2_x86_64 AL2_x86_64_GPU"
  # default     = "AL2_x86_64"
}

variable "eks_worker_security_groups_ids" {
  description = "list of groups for eks node group"
  # type        = list
}

variable "release_version" {
  description = "woker node release version"
  # default     = ""
}

variable "desired_capacity" {
  description = "desired capacity"
  # default     = "4"
}

variable "max_size" {
  description = "The maximum size of the auto scale group"
  # default     = "8"
}

variable "min_size" {
  description = "The minimum size of the auto scale group"
  # default     = "2"
}

###############################
#eks worker volume variables
##############################

variable "volume_size" {
  description = "The size of the volume in gibibytes (GiB)."
  # default     = "100"
}

variable "ec2_ssh_key" {
  description = "ec2 ssh key for worker nodes"
  # default     = ""
}

variable "node_groups" {
  # default = {}
  # type = list
}
