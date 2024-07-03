module "vpc" {
    source = "./vpc"
    vpc_cidr =  "10.0.0.0/16"
    cidr = "0.0.0.0/0"                    # vpc cidr block
    sub_cidr = "10.0.1.0/24"              # subnet cidr block availability_zone = "ap-south-1a"
    sub_cidr2 = "10.0.2.0/24"             # subnet cidr block availability_zone = "ap-south-1b"
    availability_zone = "ap-south-1a"
    availability_zone2 = "ap-south-1b"

  
}
module "ins" {
    source = "./ins"
    subnet_id = module.vpc.sub
    security_groups = module.vpc.sec
    ami = "ami-01376101673c89611"
    ami2 = "ami-0ad21ae1d0696ad58"
    key_name = "test_key2"
    instance_type = "t2.micro"
  
}
module "load_balancer" {
    source = "./load_balanser"
    subnet_id = module.vpc.sub
    subnet_id2 = module.vpc.sub2
    security_groups = module.vpc.sec
    vpc_id = module.vpc.vpc
    ins1_pid = module.ins.public_id1
    ins2_pid = module.ins.public_id2
  
}