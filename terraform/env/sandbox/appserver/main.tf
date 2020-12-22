provider "aws" {
}

terraform {
  backend "s3"{
    bucket  = "bucket_name"
    key     = "AWS_account/infra/sandbox/appserver/terraform.tfstate"
  }
}

module "appserver" {
  source              = "../../../modules/ec2"
  env                 = "sandbox"
  domain_env          = "AWS_account"
  ami                 = "aws-rhel7-*"
  ec2_instance_names  = ["awsec2test1"]
  ec2_instance_count  = "1"
  vpc_name            = "vpc-providename"
  subnet_ids          = ["subnet-subnetname"]
  availability_zones  = ["us-west-1a"]
  private_ips         = ["x.x.x.x"]
  instance_type       = "m5.small"
  nlb_name            = "nameofnlb"
  volume_size         = "50"
}
