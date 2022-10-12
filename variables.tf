variable "aws_region" {
  default = "us-east-2"
}

variable "bloco" {
  type = list(string)
  default = [
    "192.168.0.0/24",
    "192.168.1.0/24",
    "192.168.2.0/24"
  ]
}

variable "resource-tags" {
  type = map(string)
  default = {
    Provisionado_terraform = "TeRRaFoRM",
    mary                   = "estag"
  }
  description = "A map of tags for the resource(s)"
}

variable "vpc_id" {
  default = "vpc-0b769f0fdcf9ef629"
}

variable "eip_id" {
  default = "eipalloc-0a791b96d2310c1a2"
}