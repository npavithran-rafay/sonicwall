# // SNS_Topic
resource "aws_sns_topic" "Rafay_kinesis" {
  name = "Rafay_kinesis-topic"
}

resource "aws_sns_topic_subscription" "Rafay_Kinesis_sns_target" {
  topic_arn = aws_sns_topic.Rafay_kinesis.arn
  protocol  = "email"
  endpoint = "email_id"
}

// Kinesis: Iterator Age
resource "aws_cloudwatch_metric_alarm" "Rafay_kinesis_analyzerng_stream" {
  count               = length(var.kinesis_stream_names)
  alarm_name          = "${var.kinesis_stream_names[count.index]}_high_iterator_age"
  alarm_description   = "The Get iterator age of ${var.kinesis_stream_names[count.index]} is starting to lag behind"
  namespace           = "AWS/Kinesis"
  metric_name         = "GetRecords.IteratorAgeMilliseconds"
  statistic           = "Maximum"
  comparison_operator = "GreaterThanThreshold"
  threshold           = var.kinesis_iterator_age_error_threshold
  evaluation_periods  = var.kinesis_iterator_age_error_evaluation_periods
  period              = var.kinesis_iterator_age_error_period

  alarm_actions = [aws_sns_topic.Rafay_kinesis.arn]
  ok_actions    = [aws_sns_topic.Rafay_kinesis.arn]

  dimensions = {
    StreamName = var.kinesis_stream_names[count.index]
  }
}

resource "aws_cloudwatch_metric_alarm" "Rafay_kinesis_analyzerng_stream_url_ng" {
  count               = length(var.kinesis_stream_names)
  alarm_name          = "${var.kinesis_stream_names[count.index]}_high_iterator_age"
  alarm_description   = "The Get iterator age of ${var.kinesis_stream_names[count.index]} is starting to lag behind"
  namespace           = "AWS/Kinesis"
  metric_name         = "GetRecords.IteratorAgeMilliseconds"
  statistic           = "Maximum"
  comparison_operator = "GreaterThanThreshold"
  threshold           = var.kinesis_iterator_age_error_threshold
  evaluation_periods  = var.kinesis_iterator_age_error_evaluation_periods
  period              = var.kinesis_iterator_age_error_period

  alarm_actions = [aws_sns_topic.Rafay_kinesis.arn]
  ok_actions    = [aws_sns_topic.Rafay_kinesis.arn]

  dimensions = {
    StreamName = var.kinesis_stream_names[count.index]
  }
}

resource "aws_cloudwatch_metric_alarm" "Rafay_kinesis_analyzerng_stream_urlrating" {
  count               = length(var.kinesis_stream_names)
  alarm_name          = "${var.kinesis_stream_names[count.index]}_high_iterator_age"
  alarm_description   = "The Get iterator age of ${var.kinesis_stream_names[count.index]} is starting to lag behind"
  namespace           = "AWS/Kinesis"
  metric_name         = "GetRecords.IteratorAgeMilliseconds"
  statistic           = "Maximum"
  comparison_operator = "GreaterThanThreshold"
  threshold           = var.kinesis_iterator_age_error_threshold
  evaluation_periods  = var.kinesis_iterator_age_error_evaluation_periods
  period              = var.kinesis_iterator_age_error_period

  alarm_actions = [aws_sns_topic.Rafay_kinesis.arn]
  ok_actions    = [aws_sns_topic.Rafay_kinesis.arn]

  dimensions = {
    StreamName = var.kinesis_stream_names[count.index]
  }
}

resource "aws_cloudwatch_metric_alarm" "Rafay_Redshift_EMR" {
  alarm_name          = "${var.name}_cpuutilization"
  alarm_description   = "Alarm if ${var.name} CPU > ${var.cpu_threshold}% for 5 minutes"
  namespace           = "AWS/Redshift"
  metric_name         = "GetRecords.IteratorAgeMilliseconds"
  statistic           = "Maximum"
  comparison_operator = "GreaterThanThreshold"
  threshold           = var.cpu_threshold
  evaluation_periods  = var.redshift_evaluation_periods
  period              = var.redshift_period
  
  alarm_actions = [aws_sns_topic.Rafay_kinesis.arn]
  ok_actions    = [aws_sns_topic.Rafay_kinesis.arn]

  dimensions = {
    ClusterIdentifier = var.name
  }
}