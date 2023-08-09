variable "resource_names" {
  description = "Names of the resources to apply the role to"
  type        = list(string)
  default     = ["admin", "edit", "view"]
}

resource "helm_release" "cluster_role_deploy" {
  chart = "./modules/cluster-roles/helm-cluster_role"
  name  = "cluster-role-chart"

  values = [file("./modules/cluster-roles/helm-cluster_role/values.yaml")]

  set {
    name  = "cluster_role_yaml"
    value = templatefile("./modules/cluster-roles/helm-cluster_role/templates/cluster_roles.yaml", {
      resource_names = var.resource_names
    })
  }
}

# Use this provisioner block to trigger a refresh on the file
resource "null_resource" "refresh_trigger" {
  triggers = {
    source_files = file("./modules/cluster-roles/helm-cluster_role/templates/cluster_roles.yaml")
  }
  depends_on = [helm_release.cluster_role_deploy]
}


