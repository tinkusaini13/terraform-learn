resource "aws_instance" "pro1" {
  ami = "ami-0287a05f0ef0e9d9a"
  instance_type = "t2.micro"
  provider = "aws.DEV"

tags = {
  Name = "project1"
  }
}