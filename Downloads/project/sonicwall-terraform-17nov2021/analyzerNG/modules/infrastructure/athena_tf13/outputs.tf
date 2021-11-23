output "database" {
    value	 = aws_athena_database.athena_database.id
}

output "workgrouparns" {
  value       	= aws_athena_workgroup.default.*.arn
}

