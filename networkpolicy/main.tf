resource "helm_release" "network_policy" {
  name       = "network-policy-chart"
  repository = "https://example.com/charts"  # Replace with your Helm chart repository URL
  chart      = "./networkpolicy/helm-network-policy"
  
  set {
    name  = "networkpolicy_yaml"
    value = templatefile("${path.module}/template/network_policy.yaml", {
      name_namespace         = var.name_namespace,
      cidr_block            = var.cidr_block,
      except_cidr_block     = var.except_cidr_block,
      project_label_selector   = var.project_label_selector,
      role_frontend_label_selector = var.role_frontend_label_selector,
    })
  }
}
