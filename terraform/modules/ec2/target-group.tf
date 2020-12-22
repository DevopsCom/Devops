resource "aws_lb_target_group" "appserver_tg" {
  name     = "${var.alb_name}-default-tg"
  port     = 443
  protocol = "HTTP"
  vpc_id   = var.vpc_name

  health_check {
    enabled     = "true"
    protocol    = "TCP"
    port        = "443"
    interval    = 30
  }
}


resource "aws_lb_target_group_attachment" "appserver_tga" {
  count            = var.ec2_instance_count
  target_group_arn = aws_lb_target_group.appserver_tg.arn
  target_id        = element(aws_instance.appserver.*.id, count.index)
  port             = 443
}
