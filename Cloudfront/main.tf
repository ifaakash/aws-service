terraform {
  backend "s3" {
    bucket = "ifaakash-terraform-backend"
    key    = "ifaakash-aws-infra.tfstate"
    region = "us-east-1"
  }
}

# Import Github OIDC Role
module "iam"{
  source = "./iam"
}

# S3 Bucket to hold image, for hosting
module "s3"{
  source = "./s3"
  bucket_name = var.storage_bucket_name
  tags = var.tags
}
