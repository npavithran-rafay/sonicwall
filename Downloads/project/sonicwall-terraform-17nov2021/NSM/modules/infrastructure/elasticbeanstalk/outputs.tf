output "id" {
  description = "ID of the Elastic Beanstalk environment."
  value       = "${aws_elastic_beanstalk_environment.instance-register-env.id}"
}

output "name" {
  value       = "${aws_elastic_beanstalk_environment.instance-register-env.name}"
  description = "Name"
}

output "elb_dns_name" {
  value       = "${aws_elastic_beanstalk_environment.instance-register-env.cname}"
  description = "ELB technical host"
}

output "tier" {
  description = "The environment tier specified."
  value       = "${aws_elastic_beanstalk_environment.instance-register-env.tier}"
}

output "application" {
  description = "The Elastic Beanstalk Application specified for this environment."
  value       = "${aws_elastic_beanstalk_environment.instance-register-env.application}"
}

output "cname" {
  description = "Fully qualified DNS name for the environment."
  value       = "${aws_elastic_beanstalk_environment.instance-register-env.cname}"
}

output "instances" {
  description = "Instances used by this environment."
  value       = "${aws_elastic_beanstalk_environment.instance-register-env.instances}"
}

output "load_balancers" {
  description = "Elastic Load Balancers in use by this environment."
  value       = "${aws_elastic_beanstalk_environment.instance-register-env.load_balancers}"
}

output "elb_load_balancers" {
  description = "Elastic Load Balancers in use by this environment."
  value       = "${aws_elastic_beanstalk_environment.instance-register-env.load_balancers}"
}
