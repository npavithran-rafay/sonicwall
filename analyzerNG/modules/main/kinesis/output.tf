output "id" {
  description = "The id of the kinesis stream."
  value       = [aws_kinesis_stream.analyzerng_stream.id,aws_kinesis_stream.analyzerng_stream_url_ng.id,aws_kinesis_stream.analyzerng_stream_urlrating.id,aws_kinesis_stream.analyzerng_rt_stream.id]
}

output "name" {
  description = "Name of stream."
  value       = [aws_kinesis_stream.analyzerng_stream.name,aws_kinesis_stream.analyzerng_stream_url_ng.name,aws_kinesis_stream.analyzerng_stream_urlrating.name,aws_kinesis_stream.analyzerng_rt_stream.name]
}