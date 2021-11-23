
output "arn" {
  value = "${aws_dynamodb_table.dynamodb_table.*.arn}"
}

output "id" {
  value = "${aws_dynamodb_table.dynamodb_table.*.id}"
}

output "write_capacity" {
  description = "Dynamodb table write_capacity"
  value = "${aws_dynamodb_table.dynamodb_table.write_capacity}"
}

output "read_capacity" {
  description = "Dynamodb table read_capacity"
  value = "${aws_dynamodb_table.dynamodb_table.read_capacity}"
}

