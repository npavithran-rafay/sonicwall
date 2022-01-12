#Security Group Output


output "idrule" {

    value = "${aws_security_group_rule.default.*.id}"

}
