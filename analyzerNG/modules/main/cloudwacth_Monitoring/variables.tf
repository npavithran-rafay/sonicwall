variable "region" {
  default = "us-east-2"
}

// Kinesis stream name
variable "kinesis_stream_names" {
  #default = "karan-test"
  description = "Name of the kinesis stream to monitor"
  #type        = string
}

// Kinesis Iterator Age Alarm Settings
variable "kinesis_iterator_age_error_threshold" {
  description = "The value against which the specified statistic is compared."
  default     = "1000000"
}

variable "kinesis_iterator_age_error_evaluation_periods" {
  description = "The number of periods over which data is compared to the specified threshold."
  default     = "1"
}

variable "kinesis_iterator_age_error_period" {
  description = "The period in seconds over which the specified stat is applied."
  default     = "300"
}

// Redshift EMR
variable "name" {
  type        = string
  description = "Redshift cluster name."
  default = "redshift-analyzerng-cluster"
}

variable "cpu_threshold" {
  description = "The value against which the specified statistic is compared."
  default     = "1000000"
}

variable "redshift_evaluation_periods" {
  default =  "1"
}

variable "redshift_period" {
  default = "300"
}
