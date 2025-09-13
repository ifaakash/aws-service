terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "6.13.0"
    }
  }
}

# terraform {
#   backend "s3" {
#     bucket = "otcomes-sandbox-terraform-state"
#     key    = "terraform-state-file"
#     region = "us-east-1"
#   }
# }


provider "aws" {
  region = var.aws_region
}

# module "network" {
#   source                    = "./networking"
#   prefix                    = var.prefix
#   vpc_cidr_block            = var.vpc_cidr_block
#   public_subnet_cidr_block  = var.public_subnet_cidr_block
#   private_subnet_cidr_block = var.private_subnet_cidr_block
#   ssh_access_cidr           = var.ssh_access_cidr
#   default_tags              = var.default_tags
# }


# module "instance" {
#   source = "./instance"
#   prefix = var.prefix
#   ami_id = var.ami_id
#   # associate_public_ip_address = var.associate_public_ip_address
#   interface_id  = module.network.network_interface_id
#   instance_type = var.instance_type
#   default_tags  = var.default_tags

#   depends_on = [
#     module.network
#   ]
# }

module "state" {
  source = "./state_management"
}
