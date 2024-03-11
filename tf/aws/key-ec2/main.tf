resource "aws_iam_role" "example_role" {
  name               = "demo-role"
  assume_role_policy = jsonencode({
    Version = "2012-10-17",
    Statement = [{
      Effect    = "Allow",
      Principal = {
        Service = "ec2.amazonaws.com"
      },
      Action    = "sts:AssumeRole"
    }]
  })
}

resource "aws_instance" "iam-ec2" {
    ami = var.ami_id
    instance_type = var.aws_instance_type
    iam_instance_profile = var.iam_role
}

