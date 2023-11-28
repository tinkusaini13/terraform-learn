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

variable "instance_count" {
   description = "number of instance provising"
   type        =  number
   default     = "1"
}

variable "pulic_ip" {
   description = "Enable Puplic IP to access server"
   type = bool
   default = true
  
}

variable "iam_user_add" {
   description = "Add IAM user to access this service"
   type = list(string)
   default = ["user1, user2"]   
}
  
