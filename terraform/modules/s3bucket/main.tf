#S3 bucket
resource "aws_s3_bucket" "s3_bucket" {
  bucket = "my-tf-test-bucket"
  acl    = "private"

  #Allow policy that will allow content to be written by AWS
  policy = "$(data.template_file.s3_bucket_policy.rendered)"

  #the bucket will destroy when using force_destroy = true.
  force_destroy = "$(var.s3_force_destroy)"

  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        sse_algorithm     = "AES256"
      }
    }
  }

  tags = {
    Name          = "my-tf-test-bucket"
    Tech.Env      = "sandbox"
    Tech.AppCode  = "${upper(var.app_code)}"
  }
}
