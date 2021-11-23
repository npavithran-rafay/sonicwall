resource "aws_iam_service_linked_role" "es" {
  count            = "${var.create_service_linked_role == "true" ? 1 : 0}"
  aws_service_name = "es.amazonaws.com"
}
