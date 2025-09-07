variable "vpc_cidr_block"{
  type= string
}

variable "public_subnet_cidr_block"{
  type = string
}

variable "default_tags"{
  type= list(string)
}
