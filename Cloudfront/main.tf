terraform {
  backend "s3" {
    bucket = var.remote_bucket
    key    = "ifaakash-aws-infra.tfstate"
    region = var.aws_region
  }
}


module "iam"{
  source = "./iam"
}
