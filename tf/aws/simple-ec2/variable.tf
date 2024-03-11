variable "instance_type" {
   type        = string
   default     = "t2.micro"
   description = "Instance type t2.micro"
}

variable "ami_id" {
  type = string
  default = "ami-0e670eb768a5fc3d4"
  description = "ec2 instance base image ID" 
}

variable "public_ip" {
    type = bool
    default = false
    description = "By default public ip is disabled"
}