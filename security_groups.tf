resource "aws_security_group" "web_access" {
  name        = "web-server-access"
  description = "Security Group - Webserver-Access"

  dynamic "ingress" {
    for_each = var.sg_config
    content {
      description = ingress.value.description
      from_port   = ingress.value.port
      to_port     = ingress.value.port
      protocol    = ingress.value.protocol
      cidr_blocks = ingress.value.cidr_blocks
    }
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = -1
    cidr_blocks = ["0.0.0.0/0"]
  }
}
