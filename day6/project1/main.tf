provider "aws" {
  alias =  "DEV"
  region = ap-south-1
}

locals {
  env = "development"
  az = "ap-south-1a"
}


resource "aws_vpc" "dev_vpc" {
    cidr_block = "10.0.0.0/16"
    enable_dns_support = true
    enable_dns_hostnames = true
    instance_tenancy = "default"
    tags = {
      Name = "${local.env}-vpc"
    }
}

###  subnet createing  ###
resource "aws_subnet" "dev_subnet" {
vpc_id = aws_vpc.dev_vpc.id
cidr_block = "10.0.0.0/16"
availability_zone = "${local.az}"
map_public_ip_on_launch = "true"
    tags = {
        Name =  "${local.env}-subnet"
    }
}

# create internet getway
resource "aws_internet_gateway" "dev_igw" {
  vpc_id = aws_vpc.dev_vpc.id
  tags   = {
    Name = "${local.env}-igw"
  }
}


### Create Custom Route Table
resource "aws_route_table" "dev_route_tb" {
  vpc_id = aws_vpc.dev_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.dev_igw.id
  }
}

#### associate route table to subnet

resource "aws_route_table_association" "dev_route_tb_associate" {
       subnet_id = "${aws_subnet.dev_subnet.id}"
       route_table_id = "${aws_route_table.dev_route_tb.id}"

}


## create ebs volume and attched

resource "aws_ebs_volume" "data1" {
  availability_zone = "ap-south-1a"  # Make sure this matches the availability zone of your EC2 instance
  size              = 5
  type              = "gp2"

  tags = {
    Name = "dev-vol"
  }
}

resource "aws_volume_attachment" "vol_attach" {
  volume_id          = aws_ebs_volume.data1.id
  instance_id        = aws_instance.dev_ec2.id
  device_name        = "/dev/sdf"  # Replace with your desired device name
  force_detach       = false
}

# aws instance

resource "aws_instance" "dev_ec2" {
ami = "ami-0287a05f0ef0e9d9a"
instance_type = "t2.micro"
subnet_id = aws_subnet.dev_subnet.id
availability_zone = "${local.az}"
vpc_security_group_ids = [aws_security_group.dev_sg.id]
key_name   = "${local.env}"
user_data = file("httpd.sh")

## managing  volume size

root_block_device {
    volume_type = "gp2"
    volume_size = "13"
    delete_on_termination = true
  }
tags = {
        Name = "${local.env}-team-ops"
}
}


resource "aws_security_group" "dev_sg" {
    vpc_id = aws_vpc.dev_vpc.id
    name = "${local.env}-sg"
    description = "This is dev sg group"

    ingress {
       from_port = 80
       to_port = 80
       protocol = "tcp"
       cidr_blocks = ["0.0.0.0/0"]
       description = "Allow only http request"
        }

    ingress {
        from_port   = 22
        to_port = 22
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
        description = "Allow only SSH Request"
    }

    egress {
        from_port   = 0
        to_port = 0
        protocol = "-1"
        cidr_blocks = ["0.0.0.0/0"]
        description = "Allow All outbound traffic"
    }
}

variable "dev" {
  type        = string
  default     = "development"
  description = "Key-pair generated by Terraform"
}

resource "tls_private_key" "dev_key" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

resource "aws_key_pair" "generated_key" {
  key_name   = var.dev
  public_key = tls_private_key.dev_key.public_key_openssh

  provisioner "local-exec" {    # Generate "terraform-key-pair.pem" in current directory
    command = <<-EOT
      echo '${tls_private_key.dev_key.private_key_pem}' > ./'${var.dev}'.pem
      chmod 400 ./'${var.dev}'.pem
    EOT
  }

}
