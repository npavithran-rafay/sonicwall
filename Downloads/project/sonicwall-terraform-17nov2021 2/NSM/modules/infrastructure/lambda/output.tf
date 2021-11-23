output "function_name" {
  description = "The name of the Lambda function"
  value       = "${aws_lambda_function.lambda_function.function_name}"
}

output "function_arn" {
  description = "The ARN of the Lambda function"
  value       = "${aws_lambda_function.lambda_function.arn}"
}

output "qualified_arn" {
  description = "The qualified ARN of the Lambda function"
  value       = "${aws_lambda_function.lambda_function.qualified_arn}"
}

