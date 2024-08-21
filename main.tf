terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.63.0"
    }
  }
}

provider "aws" {
  # Configuration options
}

variable "anzahlInstanzen" {
  description = "Anzahl der zu erstellenden Instanzen"
  type        = number
  default     = 1
}

resource "aws_instance" "web" {
  count           = var.anzahlInstanzen
  ami             = "ami-0de02246788e4a354"
  security_groups = [aws_security_group.web_access.name]
  instance_type   = "t3.small"
  user_data       = file("apache.sh")

  tags = {
    Name = "App Server ${count.index + 1}"
  }
}

output "public_ip_address" {
  value = aws_instance.web.*.public_ip
}


