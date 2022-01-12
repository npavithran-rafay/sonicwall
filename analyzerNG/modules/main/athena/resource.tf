
#-----------------------------------------------#
#save the state file to s3 bucket               #
#-----------------------------------------------#
/*terraform {
  # The configuration for this backend will be filled in by Terragrunt
  backend "s3" {}
}*/


#############################################################
## Create an S3 bucket for storing the athena Query output ##
#############################################################

resource "aws_s3_bucket" "athena_output" {
  bucket = "${var.prefix_analyzer}-athena-query-output"
  acl    = var.athena_bucket_acl
  force_destroy = true
}

resource "aws_s3_bucket_object" "athena-output-object" {
    depends_on  = [aws_s3_bucket.athena_output]
    bucket      = aws_s3_bucket.athena_output.id
    acl         = var.athena_bucket_acl
    key         = var.athena_bucket_key
}


resource "aws_s3_bucket_public_access_block" "public_access_block" {
  bucket                  = aws_s3_bucket.athena_output.id
  block_public_acls       = var.block_public_acls
  ignore_public_acls      = var.ignore_public_acls
  block_public_policy     = var.block_public_policy
  restrict_public_buckets = var.restrict_public_buckets
}

#######################################
## Create athena for cloudfront logs ##
#######################################

module "athena_cloudfront" {
  source                  = "../../../modules/infrastructure/athena_tf13"
  depends_on = [
    data.template_file.sql
  ]
  athena_name             = var.athena_name
  bucket_name             = aws_s3_bucket.athena_output.id
  create_workgroup        = true
  athena_workgroup_name   = var.athena_workgroup_name
  workgroup_force_destroy = var.workgroup_force_destroy
  s3_output_location      = "s3://${aws_s3_bucket.athena_output.id}/${var.athena_bucket_key}"
  create_named_query      = true
  named_query             = var.named_query
  query                   = data.template_file.sql.rendered
}


data "template_file" "sql" {
  depends_on = [
    data.terraform_remote_state.emr_s3
  ]
  template        = file("${path.module}/sql.sql")
  vars = {
    db_name = var.athena_name
    cloudfront_log_location = "s3://${var.emr_bucketid}/emr-logs/"
  }
}


#### Experimental code for remote executing queries ###
#resource "null_resource" "tables" {
#  provisioner     "local-exec" {
#    command = <<-EOF
#aws athena start-query-execution --query-string file://${data.template_file.sql.rendered} --output json --query-execution-context Database=${var.athena_name} --result-configuration OutputLocation=s3://${var.s3_output_location}
#    EOF
#  }
#}
