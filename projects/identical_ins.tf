# by count method
provider "aws" {
  region = "us-west-2"  # Replace with your desired region
}

resource "aws_instance" "web" {
  count         = 3  # Number of identical instances
  ami           = "ami-0abcdef1234567890"  # Replace with a valid AMI ID
  instance_type = "t2.micro"  # Replace with your desired instance type

  tags = {
    Name = "web-instance-${count.index + 1}"  # Unique name for each instance
  }
}





# by each method
provider "aws" {
  region = "us-west-2"  # Replace with your desired region
}

locals {
  instance_count = {
    instance1 = "ami-0abcdef1234567890"  # Replace with a valid AMI ID
    instance2 = "ami-0abcdef1234567890"
    instance3 = "ami-0abcdef1234567890"
  }
}

resource "aws_instance" "web" {
  for_each      = local.instance_count
  ami           = each.value
  instance_type = "t2.micro"

  tags = {
    Name = each.key
  }
}
