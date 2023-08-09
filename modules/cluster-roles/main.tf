variable "resource_names" {
  description = "Names of the resources to apply the role to"
  type        = list(string)
  default     = ["admin", "edit", "view"]
}

resource "helm_release" "cluster_role_deploy" {
  chart = "./helm-cluster_role"
  name  = "cluster-role-chart"

  values = ("./helm-cluster_role/values.yaml")

  set {
    name  = "cluster_role_yaml"
    value = templatefile("./modules/cluster-roles/helm-cluster_role/templates/cluster_roles.yaml", {
      resource_names = var.resource_names
    })
  }
}


