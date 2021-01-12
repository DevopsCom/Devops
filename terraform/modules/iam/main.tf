#IAM Role and Policy

resource "aws_iam_role" "businesslogic_role" {
  name = var.role_name

  assume_role_policy =  "${file("${path.module}/templates/lambda-assume-policy.json")}"
}

resource "aws_iam_role_policy" "businesslogic_policy" {
  name = var.policy_name
  role = aws_iam_role.businesslogic_role.name

  policy = "$(data.template_file.businesslogic_policy.rendered)"
}

#Attach businesslogic custom policy
resource "aws_iam_role_policy_attachment" "businesslogic-attach" {
  role       = aws_iam_role.businesslogic_role.name
  policy_arn = aws_iam_policy.businesslogic_policy.arn
}
