###################################
#eks master cluster node variables
###################################
variable "eks_iam_role_name" {
  default = "eks-cluster-iamrole-terraform"
  type    = "string"
}

variable "eks_cluster_name" {
  default = "test-cluster-terraform"
  type    = "string"
}

variable "eks_cluster_version" {
  description = "eks cluster version"
  default     = "1.14"
}

variable "eks_cluster_log_types" {
  description = "logging types api audit authenticator controller manager scheduler"
  default     = ["api", "audit"]
}

variable "retention_days" {
  description = "log retention days"
  default     = "3"
}

#this is required
variable "eks_subnet_ids" {
  type = "list"
}

variable "eks_security_groups_ids" {
  type = "list"
}

#########################################
#eks worker variables
#########################################

variable "eks_workernode_iam_role_name" {
  description = "name of the eks workernode iam role"
  default     = "eks-workernode-role"
}

variable "associate_public_ip_address" {
  description = "associate public ip to nodes"
  default     = false
}

variable "instance_type" {
  description = "instance type for the lauch config"
  default     = "m5.large"
}

variable "name_prefix" {
  description = "instance name prefix"
  default     = "eks-worker"
}

variable "eks_worker_security_groups_ids" {
  description = "list of groups for launch config"
  type        = "list"
}

#####################################################
#eks worker root volume variables for launch config
####################################################
variable "volume_type" {
  description = "The type of volume Can be standard gp2 io1 sc1 or st1"
  default     = "gp2"
}

variable "volume_size" {
  description = "The size of the volume in gibibytes (GiB)."
  default     = "10"
}

variable "volume_iops" {
  description = "The amount of provisioned IOPS. This is only valid for volume_type of io1, and must be specified if using that type"
  default     = "0"
}

variable "delete_volume_on_termination" {
  description = "Whether the volume should be destroyed on instance termination"
  default     = true
}

variable "encrypted" {
  description = "encrpyt root volume"
  default     = false
}

####################################################
#eks worker add extra ebs to worker in lauch config
###################################################

variable "ebs_volume_number" {
  description = "number of extra volumes"
  default     = "0"
}

variable "ebs_az" {
  description = "ebs az"
  default     = ""
}

variable "ebs_volume_size" {
  description = "ebs size"
  default     = "10"
}

variable "ebs_volume_type" {
  description = "the type of EBS volume. standard, gp or io1"
  default     = "gp2"
}

variable "ebs_iops" {
  description = "IOPS provision. This must be set for volume type io1"
  default     = "0"
}

#mount point for full list see AWS site
#https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/device_naming.html
variable "ebs_device_name" {
  description = "Ebs mount point"
  type        = "list"
  default     = ["/dev/xvdb", "/dev/xvdc", "/dev/xvdd", "/dev/xvde", "/dev/xvdf", "/dev/xvdg", "/dev/xvdh", "/dev/xvdi", "/dev/xvdj", "/dev/xvdk", "/dev/xvdl", "/dev/xvdm", "/dev/xvdn", "/dev/xvdo", "/dev/xvdp", "/dev/xvdq", "/dev/xvdr", "/dev/xvds", "/dev/xvdt", "/dev/xvdu", "/dev/xvdv", "/dev/xvdw", "/dev/xvdx", "/dev/xvdy", "/dev/xvdz"]
}

########################################
#auto scaling vairables
#######################################

variable "asg_name" {
  description = "auto scaling group name"
  default     = "terrafrom-asg-eksworker-default-name"
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

variable "eks_worker_subnet_ids" {
  type = "list"
}
