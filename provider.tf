# Configure the AWS Provider
provider "aws" {
  access_key = "${var.aws_access_key}"
  secret_key = "${var.aws_secret_key}"
  region     = "${var.region}"
}
terraform { 
  required_providers {
    aws = ">= 3.31.0"
    local = "~> 1.2" 
    template = "~> 2.1"
    kubernetes = "~> 1.11" 
  }
}
#The Local provider is used to manage local resources.
provider "local" {
}

#The template provider exposes data sources to use templates to generate strings for other Terraform resources or outputs.
provider "template" { 
}

#The Kubernetes (K8S) provider is used to interact with the resources supported by Kubernetes. 
#The provider needs to be configured with the proper credentials before it can be used.
provider "kubernetes" {
  host                   = module.analyzerNG.NG_eks_cluster_endpoint
  cluster_ca_certificate = base64decode(module.analyzerNG.NG_certificate_authority)
  #token                  = module.analyzerNG.NG_token
  load_config_file       = false
  # version                = "~> 1.11"
}

