output "eip_ids" {

    value = ["${aws_eip.default.*.id}"]

}

output "private_ip" {

   value = ["${aws_eip.default.*.private_ip}"]
}

#output "associate_with_private_ip" {
#   value = ["${aws_eip.default.*.associate_with_private_ip}"]
#}

output "public_ip" {
  
   value = ["${aws_eip.default.*.public_ip}"]

}

output "instance" {

    value = ["${aws_eip.default.*.instance}"]
}


output "network_interface" {

    value = ["${aws_eip.default.*.network_interface}"]
}

output "public_ipv4_pool" {

    value = ["${aws_eip.default.*.public_ipv4_pool}"]

}
