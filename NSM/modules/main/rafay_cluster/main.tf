#####------------------Download required tools to import cluster------------------#####
resource "null_resource" "download_rctl" {
    provisioner "local-exec" {
        command = "${path.module}/scripts/download_tools.sh ${var.region} ${var.cluster_name}"
        interpreter = ["/bin/bash", "-c"]
    }
    provisioner "local-exec" {
        when = destroy
        command = "${path.module}/scripts/cleanup_tools.sh"
        interpreter = ["/bin/bash", "-c"]
    }
}
#####------------------render import cluster yaml file------------------#####
resource "local_file" "import_cluster_yaml" {
 content = templatefile("${path.module}/templates/import_cluster.tpl", {
                                    region            = "${var.region}",
                                    cluster_name      = "${var.cluster_name}",
                                    project_name      = "${var.project_name}",
                                    blueprint         = "${var.blueprint}",
                                    blueprintversion  = "${var.blueprintversion}"
                                    })
 filename = "${path.module}/yamls/import_cluster.yaml"
}
#####------------------import cluster------------------#####
resource "null_resource" "import_cluster" {
    depends_on = [
        null_resource.download_rctl,
        local_file.import_cluster_yaml
    ]
    provisioner "local-exec" {
        command = "${path.module}/scripts/import_cluster.sh ${path.module}/yamls/import_cluster.yaml ${var.cluster_name} ${var.rest_endpoint} ${var.ops_endpoint} ${var.api_key} ${var.api_secret} ${var.project_name}"
        interpreter = ["/bin/bash", "-c"]
    }
    triggers = {
        cluster_name = var.cluster_name
        RCTL_REST_ENDPOINT="${var.rest_endpoint}"
        RCTL_OPS_ENDPOINT="${var.ops_endpoint}"
        RCTL_API_KEY="${var.api_key}"
        RCTL_API_SECRET="${var.api_secret}"
        RCTL_PROJECT="${var.project_name}"
    } 
    provisioner "local-exec" {
        when = destroy
        command = "${path.module}/scripts/delete_imported_cluster.sh ${self.id} ${self.triggers.cluster_name} ${self.triggers.RCTL_REST_ENDPOINT} ${self.triggers.RCTL_OPS_ENDPOINT} ${self.triggers.RCTL_API_KEY} ${self.triggers.RCTL_API_SECRET} ${self.triggers.RCTL_PROJECT}"
        interpreter = ["/bin/bash", "-c"] 
    }
}

#####------------------HELM Chart deployment as rafay workload------------------#####
resource "local_file" "istio_namespace_yaml" {
  content = templatefile("${path.module}/templates/istio_namespace.tpl", {
                                    cluster_name      = "${var.cluster_name}",
                                    namespace = "istio-system",
                                    })
  filename = "${path.module}/yamls/istio_namespace.yaml"
}
resource "local_file" "istio_base_workload_yaml" {
 content = templatefile("${path.module}/templates/istio_base_workload.tpl", {
                                    cluster_name      = "${var.cluster_name}",
                                    project_name      = "${var.project_name}",
                                    workload_name     = "istio-base",
                                    workload_namespace = "istio-system",
                                    payload           = "./base-1.12.1.tgz"
                                    })
 filename = "${path.module}/yamls/istio_base_workload.yaml"
}
resource "local_file" "istiod_workload_yaml" {
 content = templatefile("${path.module}/templates/istiod_workload.tpl", {
                                    cluster_name      = "${var.cluster_name}",
                                    project_name      = "${var.project_name}",
                                    workload_name     = "istiod",
                                    workload_namespace = "istio-system",
                                    payload           = "./istiod-1.12.1.tgz"
                                    })
 filename = "${path.module}/yamls/istiod_workload.yaml"
}
#####------------------istio deployment------------------#####
resource "null_resource" "istio" {
   depends_on = [
        null_resource.download_rctl,
        null_resource.import_cluster,
        local_file.istio_base_workload_yaml,
        local_file.istiod_workload_yaml
    ]
    provisioner "local-exec" {
        command = "${path.module}/scripts/istio_workload.sh ${path.module}/yamls/istio_namespace.yaml ${path.module}/yamls/istio_base_workload.yaml ${path.module}/yamls/istiod_workload.yaml ${var.cluster_name} ${var.rest_endpoint} ${var.ops_endpoint} ${var.api_key} ${var.api_secret} ${var.project_name}"
        interpreter = ["/bin/bash", "-c"]
    }
    triggers = {
        cluster_name = "${var.cluster_name}"
        RCTL_REST_ENDPOINT="${var.rest_endpoint}"
        RCTL_OPS_ENDPOINT="${var.ops_endpoint}"
        RCTL_API_KEY="${var.api_key}"
        RCTL_API_SECRET="${var.api_secret}"
        RCTL_PROJECT="${var.project_name}"
        istio_base_workload="${path.module}/yamls/istio_base_workload.yaml"
        istiod_workload="${path.module}/yamls/istiod_workload.yaml"
    } 
    provisioner "local-exec" {
        when = destroy
        command = "${path.module}/scripts/delete_istio_workload.sh ${self.id} ${self.triggers.istio_base_workload} ${self.triggers.istiod_workload} ${self.triggers.cluster_name} ${self.triggers.RCTL_REST_ENDPOINT} ${self.triggers.RCTL_OPS_ENDPOINT} ${self.triggers.RCTL_API_KEY} ${self.triggers.RCTL_API_SECRET} ${self.triggers.RCTL_PROJECT}"
        interpreter = ["/bin/bash", "-c"] 
    }
}
#####------------------render nsmps namespace yaml------------------#####
resource "local_file" "nsmps_namespace_yaml" {
  content = templatefile("${path.module}/templates/nsmps_namespace.tpl", {
                                    cluster_name      = "${var.cluster_name}",
                                    namespace = "nsmps",
                                    })
  filename = "${path.module}/yamls/nsmps_namespace.yaml"
}
#####------------------render nsmps helm values file------------------#####
resource "local_file" "nsmps_helm_values_file" {
    content = templatefile("${path.module}/templates/nsmps-values.tpl", {
              region            = "${var.region}",
              NSM_ES_Endpoint   = "${var.NSM_ES_Endpoint}",
              NSM_db_endpoint   = "${var.NSM_db_endpoint[0]}",
              NSM_elasticache_primary_endpoint_address = "${var.NSM_elasticache_primary_endpoint_address[0]}",
              NSM_redshift_endpoint = "${var.NSM_redshift_endpoint[0]}",
              NSM_S3Bucket_reportlite = "${var.NSM_S3Bucket_reportlite}",
              analyzerNG_rs_redshift_cluster_endpoint = "${var.analyzerNG_rs_redshift_cluster_endpoint}"
              })
    filename = "${path.module}/yamls/nsmps-values.yaml"
}
resource "local_file" "nsmps_workload_yaml" {
    depends_on = [
      local_file.nsmps_helm_values_file,
      local_file.nsmps_namespace_yaml
    ]
 content = templatefile("${path.module}/templates/nsmps_workload.tpl", {
                                    cluster_name      = "${var.cluster_name}",
                                    project_name      = "${var.project_name}",
                                    workload_name     = "nsmps",
                                    workload_namespace = "nsmps",
                                    payload           = "./gms-2.3.2-R10.tgz"
                                    nsmps_values       = "./nsmps-values.yaml"
                                    })
 filename = "${path.module}/yamls/nsmps_workload.yaml"
}
resource "null_resource" "nsmps_workload" {
   depends_on = [
        null_resource.download_rctl,
        null_resource.import_cluster,
        local_file.nsmps_helm_values_file,
        null_resource.istio
    ]
    provisioner "local-exec" {
        command = "${path.module}/scripts/nsmps_workload.sh ${path.module}/yamls/nsmps_namespace.yaml ${path.module}/yamls/nsmps_workload.yaml ${var.cluster_name} ${var.rest_endpoint} ${var.ops_endpoint} ${var.api_key} ${var.api_secret} ${var.project_name}"
        interpreter = ["/bin/bash", "-c"]
    }
    triggers = {
        cluster_name = "${var.cluster_name}"
        RCTL_REST_ENDPOINT="${var.rest_endpoint}"
        RCTL_OPS_ENDPOINT="${var.ops_endpoint}"
        RCTL_API_KEY="${var.api_key}"
        RCTL_API_SECRET="${var.api_secret}"
        RCTL_PROJECT="${var.project_name}"
        nsmps_workload="${path.module}/yamls/nsmps_workload.yaml"
    } 
    provisioner "local-exec" {
        when = destroy
        command = "${path.module}/scripts/delete_nsmps_workload.sh ${self.id} ${self.triggers.nsmps_workload} ${self.triggers.cluster_name} ${self.triggers.RCTL_REST_ENDPOINT} ${self.triggers.RCTL_OPS_ENDPOINT} ${self.triggers.RCTL_API_KEY} ${self.triggers.RCTL_API_SECRET} ${self.triggers.RCTL_PROJECT}"
        interpreter = ["/bin/bash", "-c"] 
    }
}
