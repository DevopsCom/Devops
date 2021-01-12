provider "aws" {
}

terraform {
  backend "s3"{
    bucket  = "bucket_name"
    key     = "AWS_account/infra/sandbox/nlb_app/terraform.tfstate"
  }
}

module "nlb" {
  source              = "../../../modules/nlb"
  env                 = "sandbox"
  vpc_name            = "vpc-providename"
  subnet_ids          = ["subnet-subnetname"]
  availability_zones  = ["us-west-1a"]
  nlb_name            = "nameofnlb"
  acm_cert_fqdn       = "www.example.com"
  nlb_probe_url       = "/"
  r53_record_name     = "appname.sandbox.r53example.com"
  r53_zone_domain_name  = "sandbox.r53example.com"
}
