output "ids" {
  value = [module.nsm-analyzerng_ec2_nsv_az_one.ami_ids]
}

output "tags" {
  value = [module.nsm-analyzerng_ec2_nsv_az_one.tags]
}

output "private_ip" {
  value = [module.nsm-analyzerng_ec2_nsv_az_one.private_ip]
}
