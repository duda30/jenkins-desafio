output "instance_id" {
  value = aws_instance.ec2-maria.id
}

output "subnet_id" {
  value = aws_subnet.subnet-publica.id
}

output "igw_id" {
  value = aws_internet_gateway.igw-maria.id
}

output "security_group_id" {
  value = aws_security_group.allow_22_80_myip.id
}