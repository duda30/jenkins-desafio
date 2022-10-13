data "aws_vpc" "id-vpc-data" {
  id = var.vpc_id
}

data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-jammy-22.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
}

data "aws_eip" "id-eip" {
  id = var.eip_id
}

data "aws_route53_zone" "zona-pavan" {
  name = "juliocesarpavan.com.br"
  private_zone = false
}