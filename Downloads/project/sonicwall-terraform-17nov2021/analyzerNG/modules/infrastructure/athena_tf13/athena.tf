resource "aws_athena_database" "athena_database" {
  name   = var.athena_name
  bucket = var.bucket_name
}

resource "aws_athena_workgroup" "default" {
  count         = var.create_workgroup ? 1 : 0
  name          = var.athena_workgroup_name
  force_destroy = var.workgroup_force_destroy
  configuration {
    result_configuration {
      output_location = var.s3_output_location
    }
  }
}

resource "aws_athena_named_query" "athena_table_query" {
  count           = var.create_named_query ? 1 : 0
  depends_on      = [aws_athena_workgroup.default]
  name            = var.named_query
  database        = aws_athena_database.athena_database.name
  workgroup       = aws_athena_workgroup.default[count.index].id
  query           = var.query
}

