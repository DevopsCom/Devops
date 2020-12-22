locals {
  common_tags = {
    "Tech.Env" = upper(var.env)
    "Tech.AppCode" = upper(var.app_code)
    "ManagedByAutomation" = "true"
  }
}

variable "vpc_id" {
  description = "id of the VPC in which to create the instance"
}

variable "ingress_cidr_blocks" {
  description = "A list of CIDR for inbound rules"
  type        = list(string)
}


variable "egress_cidr_blocks" {
  description = "A list of CIDR for outbound rules."
  type        = list(string)
}

variable "mysqlrds_sg_name" {
  description = "name of RDS security group"

}

variable "appserver_sg_name" {
  description = "name of appserver security group"

}

variable "ec2_name" {
  description = "name of appserver"
}

variable "db_name" {
  description = "name of DB"
}
