//Save TF state to S3 bucket - backend config

# terraform {
#   backend "s3" {}
# }

//Create AWS Elasticsearch Domain for CSCMA 1.9

module "elasticsearch_domain" {
  source = "../../../../modules/infrastructure/elasticsearch"

  region             = "${var.region}"
  domain_name        = "${var.domain_name}"
  es_version         = "${var.es_version}"
  subnet_ids         = "${var.subnet_ids}"
  security_group_ids = "${var.security_group_ids}"

  ebs_size = "${var.ebs_size}"
  ebs_type = "${var.ebs_type}"
  ebs_iops = "${var.ebs_iops}"

  master_instance_count = "${var.master_instance_count}"
  master_instance_type  = "${var.master_instance_type}"

  data_instance_count = "${var.data_instance_count}"
  data_instance_type  = "${var.data_instance_type}"

  zone_awareness = "${var.zone_awareness}"
  az_count       = "${var.az_count}"

  node_to_node_encryption = "${var.node_to_node_encryption}"

  create_service_linked_role = "${var.create_service_linked_role}"

  //LOGGING
  log_publishing_index_enabled       = "${var.log_publishing_index_enabled}"
  log_publishing_search_enabled      = "${var.log_publishing_search_enabled}"
  log_publishing_application_enabled = "${var.log_publishing_application_enabled}"

  //TAGS
  env     = "${var.env}"
  BU      = "${var.BU}"
  appname = "${var.appname}"
}
