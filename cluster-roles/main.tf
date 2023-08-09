resource "helm_release" "cluster_role_deploy" {
  name       = "cluster-role-chart"
  chart      = "./cluster-roles/helm-cluster_role"

  set {
    name  = "cluster_roles_yaml"
    value = templatefile("${path.module}/templates/clusterrole.tpl", {
      resource_names = var.resource_names,
    })
  }
}
