locals {
  common_tags = {
    "Tech.Env" = upper(var.env)
    "Tech.AppCode" = upper(var.app_code)
    "ManagedByAutomation" = "true"
  }
}

variable "env" {
  description = "Name of the environment"
}

variable "app_code" {
  description = "Name of the application code"
}

variable "s3_force_destroy" {
  description = "to destroy s3 bucket"
}

variable "all_roles" {
  description = "Roles allowed to access s3 bucket"
  type  = "list"
}
