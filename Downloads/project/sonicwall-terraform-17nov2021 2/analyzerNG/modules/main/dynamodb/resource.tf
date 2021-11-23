#-----------------------------------------------#
#save the state file to s3 bucket               #
#-----------------------------------------------#
/*terraform {
  # The configuration for this backend will be filled in by Terragrunt
  backend "s3" {}
}*/


module "dynamodb_table" {
  source           = "terraform-aws-modules/dynamodb-table/aws"
  version          = "0.9.0"
  name             = var.db_tablename
  billing_mode     = var.billing_mode
  read_capacity    = var.read_capacity
  write_capacity   = var.write_capacity
  hash_key         = var.hash_key
  range_key        = var.range_key
  stream_enabled   = var.stream_enabled
  stream_view_type = var.stream_view_type
  attributes = [
    { 
     name   = var.hash_key
     type   = var.attribute_type
    },
    {
     name   = var.range_key
     type   = var.range_attribute_type
    }
  ]
  tags = {
     Name        = var.db_tablename
     BU          = var.tags_BU
     Region      = var.tags_Region
     Application = var.tags_Application
     Applicationtype = var.Applicationtype
  }
}

module "alert_dynamodb_table" {
  source           = "terraform-aws-modules/dynamodb-table/aws"
  version          = "0.9.0"
  name             = var.alert_db_tablename
  billing_mode     = var.billing_mode
  read_capacity    = var.alert_read_capacity
  write_capacity   = var.alert_write_capacity
  hash_key         = var.alert_hash_key
  stream_enabled   = var.stream_enabled
  stream_view_type = var.stream_view_type
  attributes = [
    {
     name   = var.alert_hash_key
     type   = var.attribute_type
    }
  ]
  tags = {
     Name        = var.alert_db_tablename
     BU          = var.tags_BU
     Region      = var.tags_Region
     Application = var.tags_Application
     Applicationtype = var.Applicationtype
  }
}

module "trafficstats_dynamodb_table" {
  source           = "terraform-aws-modules/dynamodb-table/aws"
  version          = "0.9.0"
  name             = var.trafficstats_db_tablename
  billing_mode     = var.billing_mode
  read_capacity    = var.trafficstats_read_capacity
  write_capacity   = var.trafficstats_write_capacity
  hash_key         = var.trafficstats_hash_key
  stream_enabled   = var.stream_enabled
  stream_view_type = var.stream_view_type
  attributes = [
    {
     name   = var.trafficstats_hash_key
     type   = var.attribute_type
    }
  ]
  tags = {
     Name        = var.trafficstats_db_tablename
     BU          = var.tags_BU
     Region      = var.tags_Region
     Application = var.tags_Application
     Applicationtype = var.Applicationtype
  }
}

module "serial_dynamodb_table" {
  source           = "terraform-aws-modules/dynamodb-table/aws"
  version          = "0.9.0"
  name             = var.serial_db_tablename
  billing_mode     = var.billing_mode
  read_capacity    = var.read_capacity
  write_capacity   = var.write_capacity
  hash_key         = var.serial_hash_key
  stream_enabled   = var.stream_enabled
  stream_view_type = var.stream_view_type
  attributes = [
    {
     name   = var.serial_hash_key
     type   = var.attribute_type
    }
  ]
  tags = {
     Name        = var.serial_db_tablename
     BU          = var.tags_BU
     Region      = var.tags_Region
     Application = var.tags_Application
     Applicationtype = var.Applicationtype
  }
}

module "alertconfig_dynamodb_table" {
  source           = "terraform-aws-modules/dynamodb-table/aws"
  version          = "0.9.0"
  name             = var.alertconfig_db_tablename
  billing_mode     = var.billing_mode
  read_capacity    = var.read_capacity
  write_capacity   = var.write_capacity
  hash_key         = var.alertconfig_hash_key
  stream_enabled   = var.stream_enabled
  stream_view_type = var.stream_view_type
  attributes = [
    {
     name   = var.alertconfig_hash_key
     type   = var.attribute_type
    }
  ]
  tags = {
     Name        = var.alertconfig_db_tablename
     BU          = var.tags_BU
     Region      = var.tags_Region
     Application = var.tags_Application
     Applicationtype = var.Applicationtype
  }
}


module "trafficalerts_dynamodb_table" {
  source           = "terraform-aws-modules/dynamodb-table/aws"
  version          = "0.9.0"
  name             = var.trafficalerts_db_tablename
  billing_mode     = var.billing_mode
  read_capacity    = var.read_capacity
  write_capacity   = var.write_capacity
  hash_key         = var.trafficalerts_hash_key
  stream_enabled   = var.stream_enabled
  stream_view_type = var.stream_view_type
  attributes = [
    {
     name   = var.trafficalerts_hash_key
     type   = var.attribute_type
    }
  ]
  tags = {
     Name        = var.trafficalerts_db_tablename
     BU          = var.tags_BU
     Region      = var.tags_Region
     Application = var.tags_Application
     Applicationtype = var.Applicationtype
  }
}


module "trafficstatsDebug_dynamodb_table" {
  source           = "terraform-aws-modules/dynamodb-table/aws"
  version          = "0.9.0"
  name             = var.trafficstatsDebug_db_tablename
  billing_mode     = var.billing_mode
  read_capacity    = var.read_capacity
  write_capacity   = var.write_capacity
  hash_key         = var.trafficstatsDebug_hash_key
  stream_enabled   = var.stream_enabled
  stream_view_type = var.stream_view_type
  attributes = [
    {
     name   = var.trafficstatsDebug_hash_key
     type   = var.attribute_type
    }
  ]
  tags = {
     Name        = var.trafficstatsDebug_db_tablename
     BU          = var.tags_BU
     Region      = var.tags_Region
     Application = var.tags_Application
     Applicationtype = var.Applicationtype
  }
}


module "ANGRealtime_table" {
  source           = "terraform-aws-modules/dynamodb-table/aws"
  version          = "0.9.0"
  name             = "ANGRealTimeMonitorMod"
  billing_mode     = "PAY_PER_REQUEST"
  hash_key         = var.ANGRealtime_hash_key
  range_key        = var.ANGRealtime_range_key
  attributes = [
    {
     name   = var.ANGRealtime_hash_key
     type   = var.ANGRealtime_attribute_type
    },
    {
     name   = var.ANGRealtime_range_key
     type   = var.ANGRealtime_range_attribute_type
    }
  ]
  tags = {
     Name        = "ANGRealTimeMonitorMod"
     BU          = var.tags_BU
     Region      = var.tags_Region
     Application = var.tags_Application
     Applicationtype = var.Applicationtype
  }
}

