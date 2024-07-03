module "vpc" {
    source = "./vpc"
  
}
module "ec2" {
  source = "./ec2"
  si = module.vpc.my_subnet1
  sg = module.vpc.my_sg1
}
