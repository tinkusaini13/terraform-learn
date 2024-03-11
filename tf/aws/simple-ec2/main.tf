resource "aws_instance" "Dev" {
  ami = var.ami_id
  instance_type = var.instance_type
  associate_public_ip_address = var.public_ip
  tags = {
    Team = "Development"
  }
}