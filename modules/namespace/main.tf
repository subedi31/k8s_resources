variable "namespace_name" {
  description = "Name of the namespace"
  type        = string
  default     = "default"  # Change this to your desired default value
}
resource "helm_release" "namespace" {
  chart     = "${path.root}/helm-namespace"
  values    = "${path.root}/helm-namespace"
  name      = "namespace-template"
  namespace = var.namespace_name
}

