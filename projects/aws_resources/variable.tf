variable "ami" {
    description = "ami id of ubuntu image"
    type = string
    default = "ami-01376101673c89611"
  
}
variable "availability_zone" {
    description = "availability zone"
    type = string
    default = "ap-south-1a"
}
variable "cidr_block" {
    type = string
    default =  "10.0.0.0/16"
}
variable "instance_type" {
    description = "basic instance type"
    type = string
    default = "t2.micro"
}
variable "key_name" {
    type = string
    default = "test_key2"
}

