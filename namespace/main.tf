
resource "helm_release" "resource-template" {
  chart     = "./helm-namespace"  # Path to helm-namespace subdirectory
  name      = "namespace-template"
  values    = [file("./helm-namespace/values.yaml")]

  
}
