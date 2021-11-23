###########################################################
# Variables for creating ecs repository policy            #
###########################################################

variable "repo_policy_name" {
  description = "Name of the repository to apply the policy"
  type        = "string"
}

variable "repo_policy" {
  description = "A valid bucket policy JSON document"
  type        = "string"
  default     = <<EOF
{
  "Version": "2008-10-17",
  "Statement": [
    {
      "Sid": "AllActionsAllow",
      "Effect": "Allow",
      "Principal": {
        "AWS": "*"
      },
      "Action": [
        "ecr:GetDownloadUrlForLayer",
        "ecr:BatchGetImage",
        "ecr:BatchCheckLayerAvailability",
        "ecr:PutImage",
        "ecr:InitiateLayerUpload",
        "ecr:UploadLayerPart",
        "ecr:CompleteLayerUpload"
      ]
    }
  ]
}
EOF
}

