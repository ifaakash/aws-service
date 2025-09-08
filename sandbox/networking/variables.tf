variable "vpc_cidr_block"{
  type= string
}

variable "public_subnet_cidr_block"{
  type = string
}

variable "private_subnet_cidr_block"{
  type = string
}

variable "prefix"{
  type= string
}

variable "default_tags"{
  type= map(string)
}
