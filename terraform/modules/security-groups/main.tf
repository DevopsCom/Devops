#security group for RDS
resource "aws_security_group" "mysqlrds" {
  name                   = var.mysqlrds_sg_name
  description            = security group for rds
  vpc_id                 = var.vpc_id

  tags = merge{
    local.common_tags,
    {
      "Name" = var.db_name
    },
  }
}

#security group for appserver
resource "aws_security_group" "appserver" {
  name                   = var.appserver_sg_name
  description            = security group for rds
  vpc_id                 = var.vpc_id

  tags = merge{
    local.common_tags,
    {
      "Name" = var.ec2_name
    },
  }
}
