provider "aws" {
  region = "us-north-1"
}

module "ecr" {
  source = "./infra/ecr"
}



module "vpc" {
  source  = "./infra/vpc"
  aws_region = "eu-north-1"
  vpc_cidr   = "10.0.0.0/16"
}

module "eks" {
  source          = "./infra/eks"
  kubernetes_version = "1.21"
  subnet_ids         = module.vpc.private_subnets
  vpc_id             = module.vpc.vpc_id
  ami_id             = "AL2_x86_64"
  instance_types     = ["t3.medium"]
  aws_region         = "eu-north-1"  # Pass the region
} 
