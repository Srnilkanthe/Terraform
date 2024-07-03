resource "aws_vpc" "my_vpc" {
    cidr_block = var.cidr_block
}
resource "aws_subnet" "my_subnet" {
    vpc_id = aws_vpc.my_vpc.id
    availability_zone = var.availability_zone
    cidr_block = var.cidr_block
}
resource "aws_security_group" "my_sg" {
    vpc_id = aws_vpc.my_vpc.id
    name = "my_sg"

    ingress {
        from_port = 22
        to_port = 22
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }

    egress {
        from_port = 0
        to_port = 0
        protocol = "-1"
        cidr_blocks = ["0.0.0.0/0"]
    }

}