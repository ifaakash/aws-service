terraform {
  backend "s3" {
    bucket = var.remote_bucket
    key    = "backend-config.tfstate"
    region = var.aws_region
  }
}
