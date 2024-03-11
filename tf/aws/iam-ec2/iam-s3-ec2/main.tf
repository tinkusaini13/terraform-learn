provider "aws" {
  region = var.region
}

resource "aws_instance" "ec2_instance" {
  ami                  = var.ami_id["ap-south-1a"]
  instance_type        = var.instance_type
  key_name             = var.key_name
  iam_instance_profile = aws_iam_instance_profile.ec2_profile.name
 
  tags = {
    Name = "EC2 with IAM role"
  }
}