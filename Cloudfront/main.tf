terraform {
  backend "s3" {
    bucket = "ifaakash-terraform-backend"
    key    = "ifaakash-aws-infra.tfstate"
    region = "us-east-1"
  }
}


module "iam"{
  source = "./iam"
}
