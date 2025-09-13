variable "aws_region" {
  type    = string
  default = "us-east-1"
}

variable "vpc_cidr_block" {
  type    = string
  default = "10.0.0.0/22"
}

variable "prefix" {
  type    = string
  default = "otcomes-sandbox"
}

variable "public_subnet_cidr_block" {
  type    = string
  default = "10.0.0.0/24"
}

variable "private_subnet_cidr_block" {
  type    = string
  default = "10.0.0.0/28"
}

variable "default_tags" {
  type = map(string)
  default = {
    Environment = "Sandbox"
  }
}
