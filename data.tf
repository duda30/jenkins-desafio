data "aws_vpc" "id-vpc-data" {
  id = var.vpc_id
}

data "aws_ami" "ubuntu" {
  most_recent = true
  
  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
}

data "aws_eip" "id-eip" {
  id = var.eip_id
}