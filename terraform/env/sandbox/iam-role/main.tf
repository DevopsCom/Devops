provider "aws" {
}

terraform {
  backend "s3"{
    bucket  = "bucket_name"
    key     = "AWS_account/infra/sandbox/iam-role/terraform.tfstate"
  }
}

module "iam" {
  source              = "../../../modules/iam"
  env                 = "sandbox"
  role_name           = "Your-custom-policy-role"
  policy_name         = "Your-Custom-Policy-Name"
}
