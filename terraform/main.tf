provider "aws" {
  region = "eu-north-1"
}

module "ecr" {
  source = "./modules/ecr"
}



module "vpc" {
  source  = "./modules/vpc"
  aws_region = "eu-north-1"
  vpc_cidr   = "10.0.0.0/16"
}

module "eks" {
  source          = "./modules/eks"
  kubernetes_version = "1.21"
  subnet_ids         = module.vpc.private_subnets
  vpc_id             = module.vpc.vpc_id
  ami_id             = "ami-0c1ac8a41498c1a9c"
  instance_types     = ["t3.micro"]
  aws_region         = "eu-north-1" 
} 
