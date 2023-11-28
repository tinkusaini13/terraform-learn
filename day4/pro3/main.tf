resource "aws_instance" "pro2" {
        ami           =  var.image_id
        instance_type =  var.instance_type
        count         =  var.instance_count
        associate_public_ip_address  =  var.pulic_ip
        tags = var.project_env
        
        }
       