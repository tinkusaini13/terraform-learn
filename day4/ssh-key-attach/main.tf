provider "aws" {
  alias =  "DEV"
  region = "ap-south-1"
}

variable "generated_key_name" {
  type        = string
  default     = "my-key"
  description = "Key-pair generated by Terraform"
}

resource "tls_private_key" "dev_key" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

resource "aws_key_pair" "generated_key" {
  key_name   = var.generated_key_name
  public_key = tls_private_key.dev_key.public_key_openssh

  provisioner "local-exec" {    # Generate "terraform-key-pair.pem" in current directory
    command = <<-EOT
      echo '${tls_private_key.dev_key.private_key_pem}' > ./'${var.generated_key_name}'.pem
      chmod 400 ./'${var.generated_key_name}'.pem
    EOT
  }

}

resource "aws_instance" "ec1" {
  ami           = "ami-0b75322ebdbcb2994"  # Replace with your AMI ID
  instance_type = "t2.micro"

  key_name = "my-key"  # Replace with your key pair name

  tags = {
    Name = "inc-key"
  }
}
