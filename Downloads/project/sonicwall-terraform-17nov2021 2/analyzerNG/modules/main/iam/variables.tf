
####################################
#aws info
###################################
variable "aws_access_key" {}

variable "aws_secret_key" {}

variable "region" {
  description = "Region for the VPC"
  #default     = ""
}

variable "iam_name" {}

variable "nsm_eks_worker_iam" {}