provider "helm" {}

resource "helm_release" "namespace" {
  name       = "namespace-template"
  repository = "./helm-namespace"
  chart      = "helm-namespace"
  namespace  = var.namespace_name
  values     = [file("./helm-namespace/values.yaml")]

  # Additional set blocks if needed
}
