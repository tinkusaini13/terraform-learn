resource "aws_instance" "pro2" {
        ami           =  "ami-0287a05f0ef0e9d9a"
        instance_type =   "t2.micro"
        key_name = "tinku"
        }


resource "aws_ebs_volume" "vol1" {
  availability_zone = "ap-south-1a"
  size              = 10

  tags = {
    Name = "myvol"
  }
}

