//Create AWS ES Domain
resource "aws_elasticsearch_domain" "def_domain" {
  domain_name           = "${var.domain_name}"
  elasticsearch_version = "${var.es_version}"

  //VPC CONFIG
  vpc_options {
    subnet_ids         = flatten("${var.subnet_ids}")
    security_group_ids = flatten("${var.security_group_ids}")
  }

  //EBS CONFIG FOR DATA NODES
  ebs_options {
    ebs_enabled = "true"
    volume_size = "${var.ebs_size}"
    volume_type = "${var.ebs_type}"
    iops        = "${var.ebs_iops}"
  }

  //CLUSTER CONFIG
  cluster_config {
    instance_count           = "${var.data_instance_count}"
    instance_type            = "${var.data_instance_type}"
    dedicated_master_enabled = "true"
    dedicated_master_count   = "${var.master_instance_count}"
    dedicated_master_type    = "${var.master_instance_type}"
    zone_awareness_enabled   = "${var.zone_awareness}"

    zone_awareness_config {
      availability_zone_count = "${var.az_count}"
    }
  }

  //AUTOMATIC SNAPSHOT CONFIG
  snapshot_options {
    automated_snapshot_start_hour = "0"
  }

  //NODE TO NODE ENCRYPTION
  node_to_node_encryption {
    enabled = "${var.node_to_node_encryption}"
  }

  //LOGGING
  log_publishing_options {
    enabled                  = "${var.log_publishing_index_enabled}"
    cloudwatch_log_group_arn = "${var.log_publishing_index_cloudwatch_log_group_arn}"
    log_type                 = "INDEX_SLOW_LOGS"
  }

  log_publishing_options {
    enabled                  = "${var.log_publishing_search_enabled}"
    cloudwatch_log_group_arn = "${var.log_publishing_search_cloudwatch_log_group_arn}"
    log_type                 = "SEARCH_SLOW_LOGS"
  }

  log_publishing_options {
    enabled                  = "${var.log_publishing_application_enabled}"
    cloudwatch_log_group_arn = "${var.log_publishing_application_cloudwatch_log_group_arn}"
    log_type                 = "ES_APPLICATION_LOGS"
  }

  //TAGS
  tags = {
    Name            = "${var.domain_name}"
    Environment     = "${var.env}"
    BU              = "${var.BU}"
    ApplicationName = "${var.appname}"
    Region          = "${var.region}"
  }

  depends_on = [aws_iam_service_linked_role.es]
}
