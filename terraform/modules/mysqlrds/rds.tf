resource "aws_db_subnet_group" "mysqlrds_db_subnet_group" {
  name        = "mysql-db-subnet-group"
  subnet_ids  = var.subnet_ids
  description = "mysql RDS subnet group"
}


resource "aws_db_instance" "mysqlrds" {
  identifier           = var.db_name
  allocated_storage    = var.db_allocated_storage
  storage_type         = "gp2"
  license_model        = "license_included"
  instance_class       = var.db_instance_class
  name                 = "mydb"
  username             = "foo"
  password             = "foobarbaz"
  multi_az             = var.multi_az
  engine               = var.rds_engine_type
  engine_version       = var.rds_engine_version
  vpc_security_group_ids = [data.aws_security_group.appserver.id]
  skup_final_snapshot    = "true"
  db_subnet_group_name   = aws_db_subnet_group.mysqlrds_db_subnet_group.name
  maintenace_window      = "Day:hh:mm-day:hh:mm"
  storage_encrypted      = "true"
  backup_window          = "hh:mm-hh:mm"
  backup_retention_period = "45"
  performance_insights_enabled  = "true"
  domain                        = var.ad_domain_id
  domain_iam_role_name          = "rds=directoryservice-access-role"

  tags = merge{
    local.common_tags,
    {
      "Name" = var.db_name
    },
  }
}
