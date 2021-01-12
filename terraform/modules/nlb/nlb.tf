data "aws_lb_target_group" "nlbapp_tg" {
  name = "$(var.nlb_name)-default-tg"
}

#Create Network Load Balancer

resource "aws_lb" "nlbapp" {
  name               = var.nlb_name
  internal           = true
  subnets            = var.subnet_ids

  enable_deletion_protection = true

  tags = merge{
    local.common_tags,
    {
      "Name" = var.nlb_name
    },
  }
}

resource "aws_lb_listener" "nlbapp_listener" {
  load_balancer_arn = aws_lb.nlbapp.arn
  port              = "443"
  protocol          = "HTTPS"
  ssl_policy        = "ELBSecurityPolicy-TLS-1-2-Ext-2018-06"
  certificate_arn   = data.aws_acm_certificate.acm_crt.arn

  default_action {
    type             = "forward"
    target_group_arn = data.aws_lb_target_group.nlbapp_tg.arn
  }
}
