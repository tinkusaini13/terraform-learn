output "instance_type" {
  value = aws_instance.pro2.instance_type
}

output "private_ip" {
  value = aws_instance.pro2.private_ip
}

output "pulic_ip" {
  value = aws_instance.pro2.public_ip
}

output "public_dns" {
    value = aws_instance.pro2.public_dns
}
output "owner" {
    value = var.owner
}
