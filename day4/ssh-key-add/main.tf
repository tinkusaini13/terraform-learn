resource "aws_instance" "pro2" {

        ami           =  var.image_id
        instance_type =  var.instance_type
        associate_public_ip_address  =  var.pulic_ip
        key_name = "tinku"
        tags = var.project_env
        }

