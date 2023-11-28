provider "aws" {
  alias =  "DEV"
  region = ap-south-1
}

resource "aws_security_group" "mysg" {
    name = "mysg"
    description = "Create first security group using terraform"

    ingress {
       from_port = 80
       to_port = 80
       protocol = "tcp"
       cidr_blocks = ["0.0.0.0/0"]
        }

    ingress {
        from_port   = 22
        to_port = 22
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }

    egress {
        from_port   = 22
        to_port = 22
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }
}



