resource "aws_instance" "pro3" {

   ami           =  var.image_id
   instance_type =  var.instance_type
   
   tags = {
           Name = "project-3"
   }
}

variable "instance_type" {
   description = "Instance type t2.micro"
   type        = string
   default     = "t2.micro"
}

variable "image_id" {
   description = "Image ID"
   type        = string
   default     = "ami-0b75322ebdbcb2994"

}