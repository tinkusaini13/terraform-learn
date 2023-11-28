resource "aws_instance" "pro2" {

   ami           =  var.image_id
   instance_type =  var.instance_type
   count         =  var.instance_count
   tags = {
           Name = "project-3"
   }
}