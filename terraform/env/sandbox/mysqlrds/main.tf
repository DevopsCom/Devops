provider "aws" {
}

terraform {
  backend "s3"{
    bucket  = "bucket_name"
    key     = "AWS_account/infra/sandbox/mysqlrds/terraform.tfstate"
  }
}

module "mysqlrds" {
  source              = "../../../modules/mysqlrds"
  env                 = "sandbox"
  db_name             = "databasename"
  db_instance_class   = "db.r4.large"
  db_allocated_storage  = "320"
  vpc_name            = "vpc-providename"
  subnet_ids          = ["subnet-subnetname"]
  db_username         = var.db_username
  db_password         = var.db_password
  rds_engine_type     = "sqlserver-se"
  rds_engine_version  = "14.00.3201.6.v1"
  r53_zone_domain_name = "www.example.com"
  r53_rds_record_name  = "record.example.com"
  multi_az            = "true"
  ad_domain_id        = "d-domainid"

}
