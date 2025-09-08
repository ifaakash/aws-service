terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

module "networking"{
  source= "./networking"
  region = var.aws_region
  vpc_cidr_block = var.vpc_cidr_block
  public_subnet_cidr_block = var.public_subnet_cidr_block
  private_subnet_cidr_block = var.private_subnet_cidr_block
  tags = var.default_tags
}
