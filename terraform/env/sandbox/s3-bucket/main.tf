provider "aws" {
  region  = "your-region"
}

terraform {
  backend "s3"{
    bucket  = "bucket_name"
    key     = "AWS_account/infra/sandbox/s3-bucket/terraform.tfstate"
  }
}

module "s3bucket" {
  source              = "../../../modules/s3bucket"
  env                 = "sandbox"
  s3_force_destroy    = "true"
  all_roles           = ["Role-Name"]
}
