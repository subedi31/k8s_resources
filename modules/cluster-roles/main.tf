variable "resource_names" {
  description = "Names of the resources to apply the role to"
  type        = list(string)
  default     = ["admin", "edit", "view"]
}


resource "helm_release" "cluster_role_deploy" {
  chart     = "./modules/cluster-roles/helm-cluster_role/Chart.yaml"  
  name      = "cluster-role-deployment"

  set {
    name  = "cluster_role_yaml"
    value = templatefile("${path.module}/helm-cluster_role/template/cluster_roles.yaml", {
      resource_names = var.resource_names
    })
  }
}


