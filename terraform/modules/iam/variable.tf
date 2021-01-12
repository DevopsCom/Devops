locals {
  common_tags = {
    "Tech.Env" = upper(var.env)
    "Tech.AppCode" = upper(var.app_code)
    "ManagedByAutomation" = "true"
  }
}

variable "role_name" {
  description = "Name of the IAM Role"
}

variable "policy_name" {
  description = "Name of the policy"
}
