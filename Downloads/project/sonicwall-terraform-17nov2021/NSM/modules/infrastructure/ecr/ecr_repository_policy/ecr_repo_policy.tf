###################################################
# Create repository policy for the ecs repository #
###################################################


resource "aws_ecr_repository_policy" "default" {
  repository = "${var.repo_policy_name}"
  policy     = "${var.repo_policy}"
}
