
###########################################################
# Variables for creating ecs repository lifecycle policy  #
###########################################################

variable "repo_lifecycle_name" {
  description = "Name of the repository to apply the policy"
  type        = "string"
}

variable "repo_lifecycle_policy" {
  description = "A valid policy JSON document"
  type        = "string"
  default     = ""
}

