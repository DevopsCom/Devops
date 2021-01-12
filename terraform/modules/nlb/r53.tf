data "aws_route53_zone" "primary" {
  name          = var.r53_zone_domain_name
  private_zone  = true
}


#Create a record in our zone that maps a simple name to NLB DNS Name
resource "aws_route53_record" "nlb_r53_record" {
  zone_id = data.aws_route53_zone.primary.zone_id
  name    = var.r53_record_name
  type    = "A"
  ttl     = "300"

  alias {
    Name                    = aws_lb.nlbapp.dns_name
    zone_id                 = aws_lb.nlbapp.zone_id
    evaluated_target_health = true
  }
}
