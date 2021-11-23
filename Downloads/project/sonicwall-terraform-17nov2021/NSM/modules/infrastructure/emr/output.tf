output "id" {
  value = "${aws_emr_cluster.default.*.id}"
}

output "name" {
  value = "${aws_emr_cluster.default.*.name}"
}

output "master_public_dns" {
  value = "${aws_emr_cluster.default.*.master_public_dns}"
}

output "master_security_group_id" {
  value = "${aws_security_group.emr_master.id}"
}

output "slave_security_group_id" {
  value = "${aws_security_group.emr_slave.id}"
}
