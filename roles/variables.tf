variable "name_namespace" {
  description = "Namespace name"
}

variable "resources" {
  description = "List of resources"
  type        = list(string)
}

variable "verbs" {
  description = "List of verbs"
  type        = list(string)
}
