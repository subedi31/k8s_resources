variable "namespace_name" {
  description = "Name of the namespace"
  type        = string
  default     = "default"  # Change this to your desired default value
}
resource "helm_release" "namespace" {
  chart     = "./helm-namespace"
  values    =  ["${path.root}/helm-namespace/values.yaml"]
  name      = "namespace-template"
  namespace = var.namespace_name
}

