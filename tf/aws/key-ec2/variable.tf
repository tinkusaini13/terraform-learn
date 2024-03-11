variable "ami_id" {
    type = string
    default = "ami-0e670eb768a5fc3d4"
}

variable "aws_instance_type" {
    type = string
    default = "t2.micro"
}

variable "iam_role" {
    type = string
    default = "demo_role"
  
}