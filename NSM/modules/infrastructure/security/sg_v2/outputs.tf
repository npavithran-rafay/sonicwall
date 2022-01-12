#Security Group Output


output "sgid" {

    value = "${aws_security_group.default.*.id}"

}
