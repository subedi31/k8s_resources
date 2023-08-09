variable "name_namespace" {
  description = "Namespace name"
}

variable "cidr_block" {
  description = "CIDR block"
}

variable "except_cidr_block" {
  description = "CIDR block exceptions"
}

variable "project_label_selector" {
  description = "Label selector for the project"
}

variable "role_frontend_label_selector" {
  description = "Label selector for the 'frontend' role"
}
