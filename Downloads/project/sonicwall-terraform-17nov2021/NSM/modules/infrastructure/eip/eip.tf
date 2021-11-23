resource "aws_eip" "default"{

     count                       = "${var.number_of_eip}"     
     vpc                         =  true
     instance                    = "${var.instance_id}"
#     instance                    =  "${element(var.instance_id, count.index)}"
     network_interface           = "${var.network_interface_id}"
     associate_with_private_ip   = "${var.private_ip_address}"
     public_ipv4_pool            = "${var.public_ip_pool}"
     
     tags     = {
   	             Name = "${var.eip_tag_name}${count.index+1}"
	        }
	
	    
}
