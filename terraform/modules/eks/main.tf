module "eks" {
  source          = "terraform-aws-modules/eks/aws"
  version         = "20.8.4"
  cluster_name    = "usecase-eks-cluster"
  cluster_version = var.kubernetes_version
  subnet_ids      = var.subnet_ids  # Pass as variable
  vpc_id          = var.vpc_id      # Pass as variable

  enable_irsa = true

  tags = {
    cluster = "demo"
  }

  # Fargate profile configuration
  fargate_profiles = {
    default = {
      name = "default"
      selectors = [
        {
          namespace = "default"
        },
        {
          namespace = "kube-system"
        }
      ]
    }
  }
}