#Security Group Output


output "ami_ids" {
    
    description = "The ec2 instance ids"
    value = [aws_instance.default.*.id]

}

output "instance_type" {
    description = "The type of the instance"
    value = [aws_instance.default.*.instance_type]

}


output "az" {

   description = "The AZ of the ec2 instances"
   value = [aws_instance.default.*.availability_zone]

}

output "key_name"{
   description = "List of key names of instance"
   value =  [aws_instance.default.*.key_name]       

}

output "public_ip" {
   description = "List of public IP addresses assigned to the instances, if applicable"
   value = [aws_instance.default.*.public_ip]

}



output "ebs_ids" {
  description = "IDs of EBSs"
  value       = aws_ebs_volume.default.*.id
}


output "primary_network_interface_id" {
   description = "List of IDs of the primary network interface of instance"
   value = [aws_instance.default.*.primary_network_interface_id]

}

output "private_ip"{
   description = "Private IP address assigned to the instances"
   value = [aws_instance.default.*.private_ip]

}

output "security_groups"{
   description = "List of assocated security groups of instances"
   value = [aws_instance.default.*.security_groups]

}

output "vpc_security_group_ids" {
   description = "List of associated security groups of instances, if running in non-default VPC"
   value = [aws_instance.default.*.vpc_security_group_ids]


}

output "subnet_id" {

   description = "List of IDs of VPC subnets of instances"
   value = [aws_instance.default.*.subnet_id]

}

output "tags"{
   description = "List of tags of instances"
   value = [aws_instance.default.*.tags]

}
