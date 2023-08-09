variable "namespace_name" {
  description = "Name of the namespace"
  type        = string
  default     = "default"  # Change this to your desired default value
}

provider "helm" {
  kubeconfig = "$HOME/.kube/config"
}

resource "helm_release" "namespace" {
  kubeconfig = "$HOME/.kube/config"
  chart     = "${path.root}/helm-namespace"
  name      = "namespace-template"
  namespace = var.namespace_name

}
