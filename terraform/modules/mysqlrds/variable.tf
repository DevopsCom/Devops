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


variable "private_ips" {
  description = "A list of private IP address to associate with the instance in a VPC. Should match the number of instances."
  type        = list(string)
}

variable "ami" {
  description = "ID of AMI to use for the instance"
  type        = string
}

variable "instance_type" {
  description = "The type of instance to start"
  type        = string
}

variable "instance_count" {
  description = "The number of instance to create"
}

variable "availability_zone" {
  description = "The availability zone"
}

variable "volume_size" {
  description = "The EBS size"
  type        = string
}
