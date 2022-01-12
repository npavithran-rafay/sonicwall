#gitea module
module "gitea" {
  source = "./gitea"  

  bucket_name   = "${var.bucket_name_gitea}"
  acl           = "${var.acl_gitea}"
  lifecycle_name = "${var.lifecycle_name}"
  storage_class  = "${var.storage_class}"
  tags        = var.tags
  role_name   = var.role_name
}

module "reportlite" {
    source = "./reportlite"

    bucket_name   = "${var.bucket_name_reportlite}"
    acl           = "${var.acl_reportlite}"
    tags       = var.tags
}