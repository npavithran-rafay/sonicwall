CREATE EXTERNAL TABLE IF NOT EXISTS ${db_name}.flowdata (
  `id` bigint, 
  `slot_id` bigint, 
  `last_timestamp` bigint, 
  `timestamp` bigint, 
  `app_id` bigint, 
  `app_name` string, 
  `b_reason` bigint, 
  `botnet` bigint, 
  `cat_id` bigint, 
  `flags` bigint, 
  `gav_id` bigint, 
  `gav_name` string, 
  `in_pri` bigint, 
  `init_addr` bigint, 
  `init_gw` bigint, 
  `init_iface` bigint, 
  `init_iface_str` string, 
  `init_loc_id` bigint, 
  `init_mac` string, 
  `init_octets` bigint, 
  `init_pkts` bigint, 
  `init_port` bigint, 
  `init_rate` bigint, 
  `init_spi` bigint, 
  `ip_version` bigint, 
  `ips_id` bigint, 
  `ips_name` string, 
  `out_pri` bigint, 
  `protocol` string, 
  `resp_addr` bigint, 
  `resp_gw` bigint, 
  `resp_iface` bigint, 
  `resp_iface_str` string, 
  `resp_loc_id` bigint, 
  `resp_mac` string, 
  `resp_octets` bigint, 
  `resp_pkts` bigint, 
  `resp_port` bigint, 
  `resp_rate` bigint, 
  `resp_spi` bigint, 
  `risk` bigint, 
  `sig_id` bigint, 
  `sig_name` string, 
  `spyw_id` bigint, 
  `spyw_name` string, 
  `threat_id` bigint, 
  `threat_name` string, 
  `threat_type` string, 
  `usr_id` bigint, 
  `usr_name` string)
PARTITIONED BY ( 
  `date` int, 
  `hour` int, 
  `serialnum` string)
ROW FORMAT SERDE 
  'org.apache.hadoop.hive.ql.io.parquet.serde.ParquetHiveSerDe' 
STORED AS INPUTFORMAT 
  'org.apache.hadoop.hive.ql.io.parquet.MapredParquetInputFormat' 
OUTPUTFORMAT 
  'org.apache.hadoop.hive.ql.io.parquet.MapredParquetOutputFormat'
LOCATION
  '${cloudfront_log_location}'
TBLPROPERTIES (
  'parquet.compress'='SNAPPY', 
  'transient_lastDdlTime'='1597683799')
