output "cluster_writer_endpoint" {
  description = "cluster writer-endpoint"
  value = aws_rds_cluster.postgresql.endpoint
}
output "cluster_reader_endpoint" {
  description = "cluster reader-endpoint"
  value = aws_rds_cluster.postgresql.reader_endpoint
}

output "dbendpoint" {
  description = "database endpoint"
  value = aws_rds_cluster_instance.mypostgresql01.*.endpoint
}
