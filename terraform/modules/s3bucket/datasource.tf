#Custom Managed Policy
data "template_file" "s3_bucket_policys" {
  template  = "${file("${path.module}/templates/s3_policy.json.tpl")}"

  vars  {
    bucket_name          = "my-tf-test-bucket"
    all_userids          = "sandbox"
    Tech.AppCode         = "${jsoncode(formatlist("%s:*",data.aws_iam_role.all_roles.*.arn))}"

  }
}

data "aws_iam_role" "all_roles" {
  count   = "${length(var.all_roles)}"
  Name    = "${var.all_roles[count.index]}"
}
