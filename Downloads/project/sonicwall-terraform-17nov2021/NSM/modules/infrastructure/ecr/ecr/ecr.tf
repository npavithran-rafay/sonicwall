###########################################
# Create ECR repository
############################################

resource "aws_ecr_repository" "default" {
  name = "${var.repo_name}"
}


