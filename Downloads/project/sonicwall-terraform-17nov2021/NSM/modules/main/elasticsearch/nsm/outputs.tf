//ES Endpoint URL
output "ES_Endpoint" {
  value = "${module.elasticsearch_domain.ES_Endpoint}"
}

//Kibana Endpoint URL
output "Kibana_Endpoint" {
  value = "${module.elasticsearch_domain.Kibana_Endpoint}"
}
