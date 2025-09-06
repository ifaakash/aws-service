variable "remote_bucket" {
  description = "S3 Bucket name holding state file"
  type        = string
  default     = "ifaakash-terraform-backend"
}


variable "aws_region" {
  description = "AWS Region"
  type        = string
  default     = "us-east-1"
}
