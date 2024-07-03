resource "aws_vpc" "vpc1" {
    cidr_block = var.vpc_cidr
  
}
resource "aws_subnet" "sub1" {
    vpc_id = aws_vpc.vpc1.id
    availability_zone = var.availability_zone
    cidr_block = var.sub_cidr
  
  
}

resource "aws_subnet" "sub2" {
    vpc_id = aws_vpc.vpc1.id
    availability_zone = var.availability_zone2
    cidr_block = var.sub_cidr2
  
  
}

resource "aws_security_group" "sec1" {
    vpc_id = aws_vpc.vpc1.id
    name = "my_sec1"

    ingress  {
        from_port = 22
        to_port = 22
        protocol = "tcp"
        cidr_blocks = [var.cidr]
    }

    egress {
        from_port = 0
        to_port = 0
        protocol = "tcp"
        cidr_blocks = [var.cidr]
    }
}

resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.vpc1.id
}
resource "aws_route_table" "RT" {
  vpc_id = aws_vpc.vpc1.id

  route {
    cidr_block = var.cidr
    gateway_id = aws_internet_gateway.igw.id
  }
}

resource "aws_route_table_association" "rta1" {
  subnet_id      = aws_subnet.sub1.id
  route_table_id = aws_route_table.RT.id
}

resource "aws_route_table_association" "rta2" {
  subnet_id      = aws_subnet.sub2.id
  route_table_id = aws_route_table.RT.id
}