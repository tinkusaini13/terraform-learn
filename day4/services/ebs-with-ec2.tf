provider "aws" {
  region = "ap-south-1"
}

resource "aws_ebs_volume" "myvol1" {
  availability_zone = "ap-south-1b"  # Make sure this matches the availability zone of your EC2 instance
  size              = 5
  type              = "gp2"

  tags = {
    Name = "dev-vol"
  }
}

resource "aws_volume_attachment" "myvol1" {
  device_name = "/dev/sdh"
  instance_id = "i-04ccc9d6354df2888"  #  existing instance id
  volume_id   = aws_ebs_volume.myvol1.id
}
