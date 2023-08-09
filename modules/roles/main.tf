resource "helm_release" "role_deploy" {
  name       = "role-chart"
  chart      = ".///roles/helm-roles"
  
  set {
    name  = "roles_yaml"
    value = templatefile("${path.module}/template/roles.yaml", {
      name_namespace = var.name_namespace,
      resources      = var.resources,
      verbs          = var.verbs,
    })
  }
}
