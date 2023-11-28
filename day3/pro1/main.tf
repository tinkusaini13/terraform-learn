resource "aws_instance" "pro3" {

   ami           =  var.image_id
   instance_type =  var.instance_type

   tags = {
           Name = "project-3"
   }
}
