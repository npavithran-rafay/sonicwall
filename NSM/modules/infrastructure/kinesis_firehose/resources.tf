
resource "aws_cloudwatch_log_group" "gms-application" {
  name                = "${var.log_grp_name}"
}
resource "aws_cloudwatch_log_stream" "RedshiftDelivery" {
  name                = "RedshiftDelivery"
  log_group_name      = "${aws_cloudwatch_log_group.gms-application.name}"
}
resource "aws_cloudwatch_log_stream" "S3Delivery" {
  name                = "S3Delivery"
  log_group_name      = "${aws_cloudwatch_log_group.gms-application.name}"
}


resource "aws_kinesis_firehose_delivery_stream" "kinesisfirehose_redshift" {
#  depends_on           = ["aws_s3_bucket.s3_bucket", "aws_iam_role.iam_role_firehose"]
  name                 = "${var.firehosename}"
  destination          = "${var.destination}"
  s3_configuration {
    role_arn           = "${var.role_arn}"
    bucket_arn         = "${var.bucket_arn}"
    buffer_interval    = 60
    cloudwatch_logging_options {
      enabled          = "${var.s3isenabled}"
      log_group_name   = "${aws_cloudwatch_log_group.gms-application.name}"
      log_stream_name  = "${aws_cloudwatch_log_stream.S3Delivery.name}"
    }
  }

  redshift_configuration {
    role_arn           = "${var.role_arn}"
    cluster_jdbcurl    = "${var.clusterjdbc}"
    username           = "${var.master_username}"
    password           = "${var.master_password}"
    data_table_name    = "${var.data_table_name}"
    copy_options       = "${var.copy_options}"
    cloudwatch_logging_options {
      enabled          = "${var.isenabled}"
      log_group_name   = "${aws_cloudwatch_log_group.gms-application.name}"
      log_stream_name  = "${aws_cloudwatch_log_stream.RedshiftDelivery.name}"
    }
  }
  tags  = {
    Name        = "${var.firehosename}"
    BU          = "${var.bu}"
    Application = "${var.application}"
    Environment = "${var.tag_environment}"
    Region      = "${var.tag_region}"
  }
}


