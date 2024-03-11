variable "name"{
  type = string
}

variable "age"{
   type = number
}

output "User_details"{
  value = "Here is User Name ${var.name} and age is ${var.age}"
}
