output "db_name" {
  value = ["${module.cscma_db.this_db_instance_name}"]
}

output "db_username" {
  value = ["${module.cscma_db.this_db_instance_username}"]
}

output "db_resource_id" {
  value = ["${module.cscma_db.this_db_instance_resource_id}"]
}

output "db_endpoint" {
  value = ["${module.cscma_db.this_db_instance_endpoint}"]
}

output "db_arn" {
  value = ["${module.cscma_db.this_db_instance_arn}"]
}

#output "tags" {
#  value = ["${module.cscma_db.tags}"]
#}

