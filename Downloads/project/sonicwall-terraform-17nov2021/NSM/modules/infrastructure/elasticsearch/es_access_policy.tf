//Get template using data 
data "template_file" "access_policy_template" {
  template = "${file("${path.root}/access_policy.tpl")}"

  vars = {
    resource_arn = "${aws_elasticsearch_domain.def_domain.arn}"
  }
}

//ES Domain Policy
resource "aws_elasticsearch_domain_policy" "policy" {
  domain_name     = "${aws_elasticsearch_domain.def_domain.domain_name}"
  access_policies = "${data.template_file.access_policy_template.rendered}"
}
