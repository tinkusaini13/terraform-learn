

resource "aws_iam_role" "s3_access_role_ec2" {
  name               = "s3_access_role"
  assume_role_policy = jsonencode({
    "Version": "2012-10-17",
    "Statement": [
      {
        "Action": "sts:AssumeRole",
        "Principal": {
          "Service": "ec2.amazonaws.com"
        },
        "Effect": "Allow"
      }
    ]
  })
}

resource "aws_iam_instance_profile" "ec2_profile" {
  name = "ec2_profile"
  role = aws_iam_role.s3_access_role_ec2.name
}

resource "aws_iam_role_policy" "s3_bucket_access_policy" {
  name = "s3_bucket_access_policy"
  role = aws_iam_role.s3_access_role_ec2.id

  policy = jsonencode({
    "Version": "2012-10-17",
    "Statement": [
      {
        "Action": "s3:*",
        "Effect": "Allow",
        "Resource": [
          "arn:aws:s3:::terraformdatasainijissh",
          "arn:aws:s3:::terraformdatasainijissh/*"
        ]
      }
    ]
  })
}
