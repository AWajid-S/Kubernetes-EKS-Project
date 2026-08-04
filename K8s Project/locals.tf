locals {

  name   = "eks-project"
  domain = "project.nginxwajid.uk"
  region = "eu-west-2"

  tags = {
    Environment = "sandbox"
    Project     = "EKS Project"
    Owner       = "Wajid Salam"
  }

}