

resource "aws_instance" "ec2-maria" {
  ami                    = data.aws_ami.ubuntu.id
  instance_type          = "t2.micro"
  subnet_id              = aws_subnet.subnet-publica.id
  vpc_security_group_ids = [aws_security_group.allow_22_80_myip.id]
  key_name               = "mary-key"

  tags = {
    for key, value in var.resource-tags :
    key => lower(value)
  }
  user_data = "${file("user-data-jenkins.sh" )}"
}

resource "aws_route53_record" "www" {
  zone_id = data.aws_route53_zone.zona-pavan.zone_id
  name    = "www.maria.jenkins.juliocesarpavan.com.br"
  type    = "A"
  ttl     = 300
  records = ["52.14.94.77"]
}



resource "aws_security_group" "allow_22_80_myip" {
  name        = "allow_ssh_vpn_ip_http"
  description = "Allow ssh, vpn ip, http traffic"
  vpc_id      = data.aws_vpc.id-vpc-data.id

  ingress {
    description = "allow 22"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["54.232.26.136/32"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "allow 80"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "allow 8080"
    from_port   = 8080
    to_port     = 8080
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    for key, value in var.resource-tags :
    key => lower(value)
  }
}