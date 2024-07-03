provider "aws" {
   region = "ap-south-1"
}


resource "aws_vpc" "my-cpc" {
    cidr_block = var.cidr_block
   
}

resource "aws_subnet" "my-subnet" {
    vpc_id = aws_vpc.my-cpc.id
    cidr_block = var.cidr_block
    availability_zone = var.availability_zone

}

resource "aws_instance" "my-instance" {
    ami = var.ami
    subnet_id = aws_subnet.my-subnet.id
    instance_type = var.instance_type
    key_name = var.key_name

}
output "public-ip-address" {
  value = aws_instance.my-instance.public_ip
}

