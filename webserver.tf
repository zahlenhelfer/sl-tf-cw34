resource "aws_instance" "web" {
  count           = var.anzahlInstanzen
  ami             = data.aws_ami.amazon-linux-2.image_id
  security_groups = [aws_security_group.web_access.name]
  instance_type   = "t3.small"
  user_data       = file("apache.sh")

  tags = {
    Name = "App Server ${count.index + 1}"
  }
}
