terraform {
  backend "s3" {
    bucket = 
    key    = "ifaakash-aws-infra.tfstate"
    region = "us-east-1"
  }
}


module "iam"{
  source = "./iam"
}
