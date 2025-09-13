######################## NETWORKING ########################

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

variable "ssh_access_cidr" {
  type    = string
  default = "49.36.144.148/32"
}

variable "private_subnet_cidr_block" {
  type    = string
  default = "10.0.1.0/28"
}

variable "default_tags" {
  type = map(string)
  default = {
    Environment = "Sandbox"
  }
}

######################## INSTANCE ########################

variable "ami_id" {
  type = string
  default = "ami-0360c520857e3138f"
}

variable "instance_type" {
  type = string
  default = "t2.micro"
}
