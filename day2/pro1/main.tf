resource "aws_instance" "pro1" {
  ami = "ami-0287a05f0ef0e9d9a"
  instance_type = "t2.micro"
  provider = "aws.DEV"

tags = {
  Name = "project1"
  }
}


resource "aws_instance" "pro2" {
  ami = "ami-0a34e15e9466c2e78"
  instance_type = "t3.micro"
  provider = "aws.QA"

tags = {
  Name = "project2"
  }
}