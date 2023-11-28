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

variable "project_env" {
  description = "project name and environment"
  type        = map(string)
  default     = {
    project     = "IaaS Uk Team",
    environment = "development"
  }
}
  
