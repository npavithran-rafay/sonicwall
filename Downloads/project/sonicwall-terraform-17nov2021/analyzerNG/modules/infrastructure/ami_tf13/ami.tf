#Creates N number of EC2 instances
#


resource "aws_instance" "default"{

      count = var.number_of_ami


     ami                                      =  var.ami
     instance_type                            =  var.ami_instance_type
     availability_zone                        =  var.ami_az
     key_name                                 =  var.key_pair_name
     iam_instance_profile                     =  var.iam_instance_profile
     ebs_optimized                            =  var.ebs_optimized
     disable_api_termination                  =  var.ami_termination_protection
     instance_initiated_shutdown_behavior     =  var.ami_shutdown_behavior
     monitoring                               =  var.ami_monitoring
     vpc_security_group_ids                   =  var.vpc_security_group_ids
     subnet_id                                =  var.ami_subnet_id
     associate_public_ip_address              =  var.associate_public_ip_address
     private_ip                               =  cidrhost(var.private_subnet_cidr,var.ami_ip_address_start + count.index)
     source_dest_check                        =  var.sd_check

     volume_tags                              =  {
                                                   Name = "${var.name_tag}${count.index+1}"
                                                   BU              =  var.bu_tag
                                                   Environment     =  var.enviroment_tag
                                                   Application     =  var.applicationName_tag
                                                   Region          =  var.region_tag
                                                   MachineType     =  var.machineType_tag
                                                   Applicationtype =  var.applicationtype_tag
                                                   Deploymenttype  =  var.deploymenttype_tag
                                                }

    root_block_device  {
            volume_size           = var.volume_size
            volume_type           = var.volume_type
            iops                  = var.volume_iops
            delete_on_termination = var.delete_volume_on_termination

  }

  lifecycle {
    ignore_changes = [
        associate_public_ip_address,
        volume_tags
    ]
  }


  tags = {

         Name            =  "${var.name_tag}${count.index+1}"
         Environment     =  var.enviroment_tag
         BU              =  var.bu_tag
         ApplicationName =  var.applicationName_tag
         Region          =  var.region_tag
         MachineType     =  var.machineType_tag
         Applicationtype =  var.applicationtype_tag
         Deploymenttype  =  var.deploymenttype_tag
   }



}


resource "aws_ebs_volume" "default" {

        count             = var.ebs_volume_number
        availability_zone = var.ami_az
        size              = var.ebs_volume_size
        type              = var.ebs_volume_type
        iops              = var.ebs_iops


        tags   =         {
                              Name            = "${var.name_tag}${count.index+1}"
                              BU              =  var.bu_tag
                              Environment     =  var.enviroment_tag
                              Application     =  var.applicationName_tag
                              Region          =  var.region_tag
                              MachineType     =  var.machineType_tag
                              Applicationtype =  var.applicationtype_tag
                              Deploymenttype  =  var.deploymenttype_tag
                        }

}

resource "aws_volume_attachment" "default" {

         count       = var.ebs_volume_number
         device_name = element(var.ebs_device_name,count.index)
         volume_id   = element(aws_ebs_volume.default.*.id, count.index)
         instance_id = element(aws_instance.default.*.id, count.index)

          lifecycle {
    ignore_changes = [
        instance_id

    ]
  }


}

