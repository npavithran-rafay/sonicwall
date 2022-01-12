#-----------------#
# Lambda Function #
#-----------------#

resource "aws_lambda_function" "lambda_function"{
  function_name                  = var.function_name
  filename                       = var.filename
  description                    = var.description
  role                           = var.role_arn
  handler                        = var.handler
  runtime                        = var.runtime
  publish                        = var.publish
  memory_size                    = var.memory_size
  reserved_concurrent_executions = var.concurrency
  timeout                        = var.lambda_timeout
  layers                         = var.layers
  source_code_hash               = var.source_code_hash
  tags = var.tags
  environment {
      variables = var.environment
  }
#  depends_on = ["aws_cloudwatch_log_group.log-group"]
}

resource "aws_lambda_function_event_invoke_config" "this" {
  function_name                = aws_lambda_function.lambda_function.function_name
  qualifier                    = aws_lambda_function.lambda_function.version
  maximum_event_age_in_seconds = var.event_age_in_seconds
  maximum_retry_attempts       = var.retry_attempts

  depends_on = [
    aws_lambda_function.lambda_function
  ]
}

#resource "aws_lambda_function_event_invoke_config" "latest" {
#  function_name                = "${aws_lambda_function.lambda_function.function_name}"
#  qualifier                    = "$LATEST"
#  maximum_event_age_in_seconds = "${var.event_age_in_seconds}"
#  maximum_retry_attempts       = "${var.retry_attempts}"
#
#  depends_on = [
#    "aws_lambda_function.lambda_function"
#  ]
#}

#---------------#
# Cloud watch   #
#---------------#

resource "aws_cloudwatch_log_group" "log-group" {
  name              = "/aws/lambda/${var.function_name}"
  retention_in_days = var.log_retention
}

