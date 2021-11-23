############################################
# Create lifecycle policy for the repository
############################################

resource "aws_ecr_lifecycle_policy" "default" {
  repository = "${var.repo_lifecycle_name}"
  policy     = "${var.repo_lifecycle_policy}"
}
