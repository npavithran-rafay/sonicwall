###################################
#eks master cluster node variables
###################################

variable "eks_cluster_name" {
  default = "test-cluster-terraform"
  type    = "string"
}

variable "eks_cluster_version" {
  description = "eks cluster version"
  default     = "1.14"
  type        = "string"
}

#########################################
#eks worker variables
#########################################

variable "eks_cluster_node_group_name" {
  description = "eks cluster nodes group name"
  default     = "eks-worknode-cluster-terraform"
}

variable "eks_worker_node_role_arn" {
  description = "arn of the eks workernode role"
}

variable "eks_worker_subnet_ids" {
  type = "list"
}

variable "instance_type" {
  description = "instance type for the lauch config"
  type        = "list"
  default     = ["m5.large"]
}

variable "ami_type" {
  description = "ami type Valid values AL2_x86_64 AL2_x86_64_GPU"
  default     = "AL2_x86_64"
}

variable "eks_worker_security_groups_ids" {
  description = "list of groups for eks node group"
  type        = "list"
}

variable "release_version" {
  description = "woker node release version"
  default     = ""
}

variable "desired_capacity" {
  description = "desired capacity"
  default     = "4"
}

variable "max_size" {
  description = "The maximum size of the auto scale group"
  default     = "8"
}

variable "min_size" {
  description = "The minimum size of the auto scale group"
  default     = "2"
}

###############################
#eks worker volume variables
##############################

variable "volume_size" {
  description = "The size of the volume in gibibytes (GiB)."
  default     = "100"
}

variable "ec2_ssh_key" {
  description = "ec2 ssh key for worker nodes"
  default     = ""
}
