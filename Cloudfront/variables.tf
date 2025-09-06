##################### BACKEND #####################

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

##################### S3 #####################

variable "storage_bucket_name" {
  description = "The name of the S3 bucket"
  type        = string
}

variable "tags" {
  description = "Tags to apply to the S3 bucket"
  type        = map(string)
  default= {
    "Owner": "ifaakash"
    "Created_by" : "Terraform"
  }
}
