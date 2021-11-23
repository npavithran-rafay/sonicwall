resource "aws_dynamodb_table" "dynamodb_table" {
  name             = "${var.db_tablename}"
  billing_mode     = "${var.billing_mode}"
  read_capacity    = "${var.read_capacity}"
  write_capacity   = "${var.write_capacity}"
  hash_key         = "${var.hash_key}"
  range_key        = "${var.range_key}"
  stream_enabled   = "${var.stream_enabled}"
  stream_view_type =  "${var.stream_view_type}"

  attribute {
    name = "${var.hash_key}"
    type = "${var.attribute_type}"
  }

#  attribute {
#    name = "${var.range_key}"
#    type = "${var.attribute_type}"
#  }

  ttl {
     enabled        = "${var.ttl_enabled}"
     attribute_name = "${var.ttl_attribute_name}"
   }
  #
  # global_secondary_index {
  #     name               = "${var.global_secondary_index_name}"
  #     hash_key           = "${var.global_secondary_index_hash_key}"
  #     range_key          = "${var.global_secondary_index_range_key}"
  #     write_capacity     = "${var.global_secondary_index_write_capacity}"
  #     read_capacity      = "${var.global_secondary_index_read_capacity}"
  #     projection_type    = "${var.global_secondary_index_projection_type}"
  #     non_key_attributes = ["${var.hash_key}"]
  #   }

  server_side_encryption {
       enabled     = "${var.server_side_encryption_enabled}"
  #       kms_key_arn = "${var.server_side_encryption_kms_key_arn}"
     }

  point_in_time_recovery {
     enabled = "${var.point_in_time_recovery_enabled}"
   }

  tags = {
    Name        = "${var.db_tablename}"
    BU          = "${var.tags_BU}"
    Region      = "${var.tags_Region}"
    Application = "${var.tags_application}"
  }
}

