        resource "aws_instance" "pro2" {

        ami           =  var.image_id
        instance_type =  var.instance_type
        count         =  var.instance_count
        associate_public_ip_address  =  var.pulic_ip
        tags = {
                Name = "project-3"
        }  
        }

        resource "iam_user" "create_iam_user"
        {
        count = length(var.user_names)
        name  = var.user_names[count.index]
        }
