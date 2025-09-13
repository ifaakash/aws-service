variable "vpc_cidr_block" {
  type = string
}

variable "public_subnet_cidr_block" {
  type = string
}

variable "private_subnet_cidr_block" {
  type = string
}

variable "prefix" {
  type = string
}

variable "ssh_access_cidr" {
  type = string
}

variable "instance_id" {
  type = string
}

variable "default_tags" {
  type = map(string)
}
