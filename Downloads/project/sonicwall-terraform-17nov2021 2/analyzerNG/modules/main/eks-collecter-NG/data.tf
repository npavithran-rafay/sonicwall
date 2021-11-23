provider "aws" {
  version = ">= 2.28.1"
  region  = var.region
}

#The Local provider is used to manage local resources.
provider "local" {
  version = "~> 1.2"
}

#The template provider exposes data sources to use templates to generate strings for other Terraform resources or outputs.
provider "template" {
  version = "~> 2.1"
}

#The Kubernetes (K8S) provider is used to interact with the resources supported by Kubernetes. 
#The provider needs to be configured with the proper credentials before it can be used.
provider "kubernetes" {
  host                   = data.aws_eks_cluster.cluster.endpoint
  cluster_ca_certificate = base64decode(data.aws_eks_cluster.cluster.certificate_authority.0.data)
  token                  = data.aws_eks_cluster_auth.cluster.token
  load_config_file       = false
  version                = "~> 1.11"
}

