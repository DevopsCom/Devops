# Find a certificate that is issued and uploaded to ACM
data "aws_acm_certificate" "acm_crt" {
  domain   = var.acm_cert_fqdn
  statuses = ["ISSUED"]
  most_recent = true
}
