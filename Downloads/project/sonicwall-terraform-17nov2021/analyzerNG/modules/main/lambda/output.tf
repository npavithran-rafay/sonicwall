output "lambda_function_name" {
  description = "The name of the Lambda function"
  value       = module.lambda.function_name
}


output "lambda_operations_name" {
  description = "The name of the Lambda function"
  value       = module.ang-operations.function_name
}
/*
output "lambda_terminaterestartemr_name" {
  description = "The name of the Lambda function"
  value       = module.lambda_terminaterestartemr.function_name
}

output "lambda_schedulejobs_name" {
  description = "The name of the Lambda function"
  value       = module.lambda_schedulejobs.function_name
}

output "lambda_realtimereport_name" {
  description = "The name of the Lambda function"
  value       = module.lambda_realtimereport.function_name
}


output "lambda_bucketmonitor_name" {
  description = "The name of the Lambda function"
  value       = module.lambda_bucketmonitor.function_name
}

output "lambda_logparser_name" {
  description = "The name of the Lambda function"
  value       = module.lambda_logparser.function_name
}

output "lambda_deleteDynamodbemr_name" {
  description = "The name of the Lambda function"
  value       = module.lambda_deleteDynamodbemr.function_name
}


output "lambda_terminatemrdynamodb_name" {
  description = "The name of the Lambda function"
  value       = module.lambda_terminatemrdynamodb.function_name
}


output "lambda_stepFunctionemr_name" {
  description = "The name of the Lambda function"
  value       = module.lambda_stepFunctionemr.function_name
}

output "lambda_Logprocessor_new_name" {
  description = "The name of the Lambda function"
  value       = module.logprocessor.function_name
}


output "lambda_LogProcessorWeb_name" {
  description = "The name of the Lambda function"
  value       = module.logprocessor-web.function_name
}
*/

output "lambda_ANG-Setup_name" {
  description = "The name of the Lambda function"
  value       = module.setup.function_name
}


output "lambda_function_arn" {
  description = "The name of the Lambda function"
  value       = module.lambda.function_arn
}


output "lambda_operations_arn" {
  description = "The name of the Lambda function"
  value       = module.ang-operations.function_arn
}
/*
output "lambda_terminaterestartemr_arn" {
  description = "The name of the Lambda function"
  value       = module.lambda_terminaterestartemr.function_arn
}

output "lambda_schedulejobs_arn" {
  description = "The name of the Lambda function"
  value       = module.lambda_schedulejobs.function_arn
}

output "lambda_realtimereport_arn" {
  description = "The name of the Lambda function"
  value       = module.lambda_realtimereport.function_arn
}

output "lambda_bucketmonitor_arn" {
  description = "The name of the Lambda function"
  value       = module.lambda_bucketmonitor.function_arn
}

output "lambda_logparser_arn" {
  description = "The name of the Lambda function"
  value       = module.lambda_logparser.function_arn
}

output "lambda_deleteDynamodbemr_arn" {
  description = "The arn of the Lambda function"
  value       = module.lambda_deleteDynamodbemr.function_arn
}


output "lambda_terminatemrdynamodb_arn" {
  description = "The arn of the Lambda function"
  value       = module.lambda_terminatemrdynamodb.function_arn
}


output "lambda_stepFunctionemr_arn" {
  description = "The arn of the Lambda function"
  value       = module.lambda_stepFunctionemr.function_arn
}

output "lambda_Logprocessor_new_arn" {
  description = "The arn of the Lambda function"
  value       = module.logprocessor.function_arn
}


output "lambda_LogProcessorWeb_arn" {
  description = "The arn of the Lambda function"
  value       = module.logprocessor-web.function_arn
}
*/

output "lambda_ANG-Setup_arn" {
  description = "The arn of the Lambda function"
  value       = module.setup.function_arn
}


#output "lambda_qualified_arn" {
#  description = "The qualified ARN of the Lambda function"
#  value       = [module.lambda.qualified_arn,module.lambda_logprocessor.qualified_arn,module.lambda_terminaterestartemr.qualified_arn,module.lambda_schedulejobs.qualified_arn,module.lambda_realtimereport.qualified_arn,module.lambda_bucketmonitor.qualified_arn,module.lambda_logparser.qualified_arn]
#}


output "role_arn" {
  description = "The ARN of the IAM role created for the Lambda function"
  value       = aws_iam_role.iam_for_lambda.arn
}
/*
output "EventBridgeName"{
  description = "Name of the EventBridge rules"
  value       = [aws_cloudwatch_event_rule.logparser.name,aws_cloudwatch_event_rule.logprocessor.name,aws_cloudwatch_event_rule.realtimereport.name,aws_cloudwatch_event_rule.logparser_restart-stepFailure.name,aws_cloudwatch_event_rule.logparser_delete_dynamodbtables.name,aws_cloudwatch_event_rule.logprocessor_restart-stepFailure.name,aws_cloudwatch_event_rule.logprocessor_delete_dynamodbtables.name]
}
*/
