
resource "aws_security_group_rule" "ingress_rules" {
  type             = "ingress"
  from_port        = "8443"
  to_port          = "8443"
  protocol         = "TCP"
  cidr_blocks      = var.ingress_cidr_blocks
  security_group_id = aws_security_group.mysqlrds.name.*.id
  description      = "inbound rule"
}

resource "aws_security_group_rule" "egress_rules" {
  type             = "egress"
  from_port        = "443"
  to_port          = "443"
  protocol         = "TCP"
  cidr_blocks      = var.egress_cidr_blocks
  security_group_id = aws_security_group.mysqlrds.name.*.id
  description      = "outbound rule"
}
