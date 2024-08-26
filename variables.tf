variable "anzahlInstanzen" {
  description = "Anzahl der zu erstellenden Instanzen"
  type        = number
  default     = 1
}

variable "sg_config" {
  type = map(any)
  default = {
    "web access" = {
      port        = 80,
      description = "http Access",
      protocol    = "tcp",
      cidr_blocks = ["0.0.0.0/0"],
    }
    "ssh access" = {
      port        = 22,
      description = "SSH Access",
      protocol    = "tcp",
      cidr_blocks = ["0.0.0.0/0"],
    }
  }
}
