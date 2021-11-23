#gitea module
module "gitea" {
  source = "./gitea" 

  aws_access_key  = "${var.aws_access_key}"
  aws_secret_key  = "${var.aws_secret_key}"
  region          = "${var.region}"

  bucket_name   = "${var.bucket_name_gitea}"
  acl           = "${var.acl_gitea}"
  lifecycle_name = "${var.lifecycle_name}"
  storage_class  = "${var.storage_class}"
}

module "reportlite" {
    source = "./reportlite"

    aws_access_key  = "${var.aws_access_key}"
    aws_secret_key  = "${var.aws_secret_key}"
    region          = "${var.region}"

    bucket_name   = "${var.bucket_name_reportlite}"
    acl           = "${var.acl_reportlite}"
}