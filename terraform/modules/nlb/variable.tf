locals {
  common_tags = {
    "Tech.Env" = upper(var.env)
    "Tech.AppCode" = upper(var.app_code)
    "ManagedByAutomation" = "true"
  }
}

variable "vpc_name" {
  description = "Name of the VPC in which to create the instance"
}

variable "subnet_ids" {
  description = "A list of VPC Subnet IDs to launch in"
  type        = list(string)
}


variable "acm_cert_fqdn" {
  description = "FQDN for the certificate that is uploaded to ACM"
}

variable "nlb_probe_url" {
  description = "Application location in appservers"
}

variable "r53_record_name" {
  description = "record set present in R53"
  type        = string
}

variable "r53_zone_domain_name" {
  description = "The nname of the domain that needs to create"
}

variable "availability_zone" {
  description = "The availability zone"
}
