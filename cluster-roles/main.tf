resource "helm_release" "cluster_role_deploy" {
  name       = "cluster-role-chart"
  repository = "https://example.com/charts"  # Replace with your Helm chart repository URL
  chart      = "./cluster-roles/helm-cluster_role"

  set {
    name  = "cluster_roles_yaml"
    value = templatefile("${path.module}/templates/clusterrole.tpl", {
      resource_names = var.resource_names,
    })
  }
}
