resource "aws_instance" "web" {
  count           = var.anzahlInstanzen
  ami             = data.aws_ami.amazon-linux-2.image_id
  security_groups = [aws_security_group.web_access.name]
  instance_type   = "t3.micro"
  user_data       = file("apache.sh")
  monitoring      = true

  metadata_options {
    http_tokens                 = "optional"
    http_put_response_hop_limit = 1
    http_endpoint               = "enabled"
  }

  tags = {
    Name = "App Server ${count.index + 1}"
  }
}
