
#-----------------------------------------------#
#save the state file to s3 bucket               #
#-----------------------------------------------#
/*terraform {
  # The configuration for this backend will be filled in by Terragrunt
  backend "s3" {}
}*/


#----------------------------------------------------------------------#
#Create an EC2s instances for prodsim Analyzer-NG EMR Client in az one #
#----------------------------------------------------------------------#

module "ps_ma_ec2_emr_client1_az_one" {
  source                 = "../../../modules/infrastructure/ami_tf13"
  number_of_ami          = var.emr_client1_number
  ami                    = var.emr_client1_ami
  ami_instance_type      = var.emr_client1_ami_instance_type
  key_pair_name          = var.key_name
  ami_az                 = "${var.region}a"
  #iops                   = var.volume_iops
  iam_instance_profile   =  var.iam_instance_profile
#  vpc_security_group_ids = var.security_group_ids
#  ami_subnet_id          = var.az_one_id
  vpc_security_group_ids = [data.terraform_remote_state.vpc-output.outputs.vpc_security_group_id,data.terraform_remote_state.emr.outputs.EMR_master_sg,data.terraform_remote_state.emr.outputs.EMR_slave_sg]
  ami_subnet_id          = data.terraform_remote_state.vpc-output.outputs.vpc_private_subnets_ids[15]
  private_subnet_cidr    = var.az_one_cidr
  ami_ip_address_start   = "185"
  sd_check               = "false"
  name_tag               = "${var.prefix}-nsm-ang-emr_client1"
  enviroment_tag         = var.enviroment_tag
  bu_tag                 = var.bu_tag
  applicationName_tag    = var.applicationName_tag
  region_tag             = var.region_tag
  machineType_tag        = var.machineType_emr_client1
  applicationtype_tag    = var.applicationtype_tag
  deploymenttype_tag     = var.deploymenttype_tag
  volume_size            = var.emr_client1_volume_size
  delete_volume_on_termination = var.delete_volume_on_termination
  ebs_iops                     = var.ebs_iops
  volume_type                  = var.volume_type
  volume_iops                  = var.volume_iops
  ebs_optimized                = var.ebs_optimized
  ebs_volume_type              = var.ebs_volume_type
  ami_shutdown_behavior        = var.ami_shutdown_behavior
  ami_monitoring               = var.ami_monitoring
  ami_termination_protection   = var.ami_termination_protection
  associate_public_ip_address  = var.associate_public_ip_address

  #add extra EBS
  ebs_volume_number = var.number_of_ebs_emr_client1
  ebs_volume_size   = var.ebs_volume_size_emr_client1
  ebs_device_name   = var.ebs_device_name_emr_client1
}

#-----------------------------------------------------------------------#
#Create an EC2s instances for prodsim Analyzer-NG EMR Client2 in az one #
#-----------------------------------------------------------------------#

module "ps_ma_ec2_mgmt_az_one" {
  source                 = "../../../modules/infrastructure/ami_tf13"
  number_of_ami          = var.emr_client2_number
  ami                    = var.emr_client2_ami
  ami_instance_type      = var.emr_client2_ami_instance_type
  key_pair_name          = var.key_name
  ami_az                 = "${var.region}a"
  iam_instance_profile   =  var.iam_instance_profile
  sd_check      = var.sd_check
#  vpc_security_group_ids = var.security_group_ids
#  ami_subnet_id          = var.az_one_id
  vpc_security_group_ids = [data.terraform_remote_state.vpc-output.outputs.vpc_security_group_id,data.terraform_remote_state.emr.outputs.EMR_master_sg,data.terraform_remote_state.emr.outputs.EMR_slave_sg]
  ami_subnet_id          = data.terraform_remote_state.vpc-output.outputs.vpc_private_subnets_ids[15]
  private_subnet_cidr    = var.az_one_cidr
  ami_ip_address_start   = "171"
  name_tag               = "${var.prefix}-nsm-ang-emr-client"
  enviroment_tag         = var.enviroment_tag
  bu_tag                 = var.bu_tag
  applicationName_tag    = var.applicationName_tag
  region_tag             = var.region_tag
  machineType_tag        = var.machineType_emr_client2
  applicationtype_tag    = var.applicationtype_tag
  deploymenttype_tag     = var.deploymenttype_tag
  volume_size            = var.emr_client2_volume_size
  delete_volume_on_termination = var.delete_volume_on_termination
  ebs_iops                     = var.ebs_iops
  volume_type                  = var.volume_type
  volume_iops                  = var.volume_iops
  ebs_optimized                = var.ebs_optimized
  ebs_volume_type              = var.ebs_volume_type
  ami_shutdown_behavior        = var.ami_shutdown_behavior
  ami_monitoring               = var.ami_monitoring
  ami_termination_protection   = var.ami_termination_protection
  associate_public_ip_address  = var.associate_public_ip_address

  #add extra EBS
  ebs_volume_number = var.number_of_ebs_emr_client2
  ebs_volume_size   = var.ebs_volume_size_emr_client2
  ebs_device_name   = var.ebs_device_name_emr_client2
}


