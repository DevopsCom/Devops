data "aws_route53_zone" "r53_zone" {
  name         = var.r53_zone_domain_name
  private_zone = true
}

resource "aws_route53_record" "mysqlrds" {
  zone_id = data.aws_route53_zone.r53_zone.zone_id
  name    = var.r53_rds_record_name
  type    = "A"
  ttl     = "300"
  records = [aws_db_instance.mysqlrds.address]
}
