output "name" {
  value = var.username
}

output "age" {
  value = var.age
}

output "city" {
  #  value = "Hey This is my city ${tostring(var.city[0])}"

  #if you need all list print in output then use join funcation join(" ",var.your_fun_name)
  #value = "Hey This is my city ${join(" ",var.city)}"
  #value = "Hey This is my city ${join("->",var.city)}"
  value = "Hey This is my city ${join("--", var.city)}"
}

output "developers" {
  value = "Here is the developers name from map variable to print ${lookup(var.developers, "F_name")}"
}


output "tester" {
  value = "Here is the tester name from map dynamic variable  ${lookup(var.tester, "${var.tester_name}")}"
}
