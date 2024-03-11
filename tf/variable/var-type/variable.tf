variable "username" {
  type    = string
  default = "tinku"
}

variable "age" {
  type = number
}

variable "city" {
  type    = list(any)
  default = ["Jaipur", "Ajmer", "Pune"]
}


variable "developers" {
  type = map(any)
  default = {
    F_name  = "Aman"
    L_name  = "kumar"
  }
}



variable "tester" {
  type = map(any)
  default = {
    Team-a  = "dev"
    Team-b  = "qa"
  }
}

variable "tester_name"{
  type = string
}
