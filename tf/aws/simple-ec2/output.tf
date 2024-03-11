output "instance_id" {
  value = aws_instance.Dev.id
}
output "instance_type" {
  value = aws_instance.Dev.instance_type
}
output "public_ip" {
  value = aws_instance.Dev.public_ip
}
output "instance_zone" {
  value = aws_instance.Dev.availability_zone
}