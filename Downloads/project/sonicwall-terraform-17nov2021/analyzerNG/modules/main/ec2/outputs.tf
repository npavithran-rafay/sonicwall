output "ids" {
  value = [module.ps_ma_ec2_emr_client1_az_one.ami_ids,module.ps_ma_ec2_mgmt_az_one.ami_ids]
}

output "tags" {
  value = [module.ps_ma_ec2_emr_client1_az_one.tags,module.ps_ma_ec2_mgmt_az_one.tags]
}

output "instance_type" {
  value = [module.ps_ma_ec2_emr_client1_az_one.instance_type,module.ps_ma_ec2_mgmt_az_one.instance_type]
}


output "private_ip" {
  value = [module.ps_ma_ec2_emr_client1_az_one.private_ip,module.ps_ma_ec2_mgmt_az_one.private_ip]
}

