resource "aws_security_group" "node-sg" {
  name        = "web-app-sg"
  description = "Security group"
  vpc_id      = aws_vpc.main.id

  tags = {
    Name        = "web-app-sg"
    Environment = var.environment
  }
}

locals {
  ingress_ports = [8080, 443, 22]
}

resource "aws_vpc_security_group_ingress_rule" "multiple_ports" {
  for_each = toset(local.ingress_ports)

  security_group_id = aws_security_group.web_app.id
  cidr_ipv4         = aws_vpc.main.cidr_block
  from_port         = each.value
  ip_protocol       = "tcp"
  to_port           = each.value
}