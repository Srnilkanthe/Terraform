resource "aws_instance" "my_ins" {
    ami = "ami-01376101673c89611"
    instance_type = "t2.micro"
    subnet_id = var.si
    security_groups = [var.sg]
    key_name = "test_key2"
}