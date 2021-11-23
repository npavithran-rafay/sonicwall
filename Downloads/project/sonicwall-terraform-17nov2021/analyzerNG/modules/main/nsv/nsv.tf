#-----------------------------------------------#
#save the state file to s3 bucket               #
#-----------------------------------------------#
/*terraform {
  # The configuration for this backend will be filled in by Terragrunt
  backend "s3" {}
}*/

#--------------------------------------------------#
#launch prodsim NSv instances  in az one           #
#--------------------------------------------------#

module "nsm-analyzerng_ec2_nsv_az_one" {
  source                 = "../../../modules/infrastructure/nsv_tf13"
  number_of_ami          = var.nsv_number
  ami                    = var.nsv_ami
  ami_instance_type      = var.nsv_ami_instance_type
  key_pair_name          = var.key_name
  ami_az                 = "${var.region}a"
  vpc_public_security_group_ids = var.security_group_lb_ids
  ami_public_subnet_id          = var.az_one_public_id
  public_subnet_cidr    = var.az_one_public_cidr
  ami_ip_address_start   = "55"
  sd_check               = "true"
  name_tag               = "${var.prefix}-analyzerng-nsv"
  enviroment_tag         = var.enviroment_tag
  bu_tag                 = var.bu_tag
  applicationName_tag    = var.applicationName_tag
  region_tag             = var.region_tag
  machineType_tag        = var.machineType_tag
  applicationtype_tag    = var.applicationtype_tag
  volume_size            = var.nsv_volume_size
  deploymenttype_tag     = "Terraform"
  ami_private_subnet_id  = data.terraform_remote_state.vpc-output.outputs.vpc_private_subnets_ids[15]
#  ami_private_subnet_id  = var.ami_private_subnet_id
  private_ip             = var.nsv1_lan_ip
  private_security_group_ids = [data.terraform_remote_state.vpc-output.outputs.vpc_security_group_id]
#  private_security_group_ids = var.private_security_group_ids
#
ami_termination_protection = var.ami_termination_protection
ebs_optimized               = var.ebs_optimized
ebs_volume_type             = var.ebs_volume_type
ebs_device_name             = var.ebs_device_name
ami_monitoring              = var.ami_monitoring
ami_shutdown_behavior       = var.ami_shutdown_behavior
associate_public_ip_address = var.associate_public_ip_address
volume_type                 = var.volume_type
ebs_volume_number           = var.ebs_volume_number
volume_iops                 = var.volume_iops
delete_volume_on_termination= var.delete_volume_on_termination
ebs_volume_size             = var.ebs_volume_size
ebs_iops                    = var.ebs_iops
}
