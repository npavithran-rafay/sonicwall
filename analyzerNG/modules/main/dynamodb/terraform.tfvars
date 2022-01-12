/*#---------------------------------------------------------------#
#aws provider info                                              #
#---------------------------------------------------------------#
aws_access_key = ""

aws_secret_key = ""

#Region for the VPC
#region = "eu-central-1"
region = "us-west-1"
########################
## Dynamodb vales   ##
########################
db_tablename       = "ANGRealtimeMonitor"
billing_mode       = "PROVISIONED"
write_capacity     = 50
read_capacity      = 50
hash_key           = "dataype-serialnum"
attribute_type     = "S"
range_key          = "time"
range_attribute_type = "N"
tags_BU            = "NSM"
tags_Application   = "NSM"
Applicationtype    = "Analyzer-NG"
tags_Region        = "Frankfurt"


alert_db_tablename       = "alerts"
alert_write_capacity     = 50
alert_read_capacity      = 50
alert_hash_key           = "serialnum_cat_subcat"


trafficstats_db_tablename       = "trafficstats"
trafficstats_write_capacity     = 5
trafficstats_read_capacity      = 5
trafficstats_hash_key           = "serialnum-type"

trafficstatsDebug_db_tablename  = "trafficstatsDebug"
trafficstatsDebug_hash_key      = "serialnum-type-id"

trafficalerts_db_tablename      = "trafficalerts"
trafficalerts_hash_key          = "serialcatsubcat"

alertconfig_db_tablename        = "alertconfiguration"
alertconfig_hash_key            = "serialcatsubcat"

serial_db_tablename             = "serial"
serial_hash_key                 = "subserial"

ANGRealtime_hash_key             = "datatype-serialnum"
ANGRealtime_attribute_type       = "S"
ANGRealtime_range_key            = "ts"
ANGRealtime_range_attribute_type = "N"

server_side_encryption_enabled  = "false"
point_in_time_recovery_enabled  = "fasle"
stream_enabled                     = "false"
ttl_enabled                        = "false"*/
