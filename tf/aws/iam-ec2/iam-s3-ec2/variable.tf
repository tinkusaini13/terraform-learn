variable "region" {
  default = "ap-south-1"
}

variable "ami_id" {
  type = map(any)
  default = {
    ap-south-1a = "ami-0e670eb768a5fc3d4"
    ap-south-1b = "ami-03bb6d83c60fc5f7c"
    ap-south-1c = "ami-05a5bb48beb785bf1"
  }
}

variable "key_name" {
  type    = string
  default = "app1"
}

variable "instance_type" {
  type    = string
  default = "t2.micro"

}

variable "s3_bucket_name" {
  type    = string
  default = "terraformdatasainijissh"

}