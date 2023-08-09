
resource "helm_release" "resource-template" {
  chart     = "./helm-namespace"  # Path to helm-namespace subdirectory
  name      = "namespace-template"
  values    = [file("./namespace/helm-namespace/values.yaml")]

  
}
