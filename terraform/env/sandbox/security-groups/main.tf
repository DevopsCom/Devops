provider "aws" {
}

terraform {
  backend "s3"{
    bucket  = "bucket_name"
    key     = "AWS_account/infra/sandbox/security-groups/terraform.tfstate"
  }
}

module "security-groups" {
  source              = "../../../modules/security-groups"
  env                 = "sandbox"
  domain_env          = "AWS_account"
  vpc_id              = "vpc-providename"
  mysqlrds_sg_name    = "mysqlrds-default-sg"
  appserver_sg_name   = "appserver-default-sg"
  db_name             = "databasename"
  ec2_name            = "appservername"
  ingress_cidr_blocks = ["x.x.x.x/x"]
  egress_cidr_blocks  = ["x.x.x.x/x"]

}
