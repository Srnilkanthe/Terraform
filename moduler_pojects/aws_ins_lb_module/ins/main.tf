resource "aws_instance" "test1" {
    ami = var.ami
    subnet_id = var.subnet_id
    instance_type = var.instance_type
    security_groups = [ var.security_groups ]
    key_name = var.key_name

    
      
}

resource "aws_instance" "test2" {
    ami = var.ami2
    subnet_id = var.subnet_id
    instance_type = var.instance_type
    security_groups = [ var.security_groups ]
    key_name = var.key_name
}