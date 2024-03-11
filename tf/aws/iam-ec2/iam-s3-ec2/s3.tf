resource "aws_s3_bucket" "iam_demo_bucket_name" {
  bucket = var.s3_bucket_name //s3 bucket name 
  acl    = "private"

  tags = {
    Name        = "Team"
    Environment = "Terraform"
  }

}