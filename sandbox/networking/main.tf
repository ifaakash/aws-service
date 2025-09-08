resource "aws_vpc" "sandbox_vpc" {
  cidr_block = var.vpc_cidr_block
  tags       = merge({"Name" : "${var.prefix}-vpc"}, var.default_tags)
}

resource "aws_subnet" "public_subnet" {
  vpc_id     = aws_vpc.sandbox_vpc.id
  cidr_block = var.public_subnet_cidr_block
  tags       = merge({"Name" : "${var.prefix}-public-subnet"}, var.default_tags)
}


resource "aws_subnet" "private_subnet" {
  vpc_id     = aws_vpc.sandbox_vpc.id
  cidr_block = var.private_subnet_cidr_block
  tags       = merge({"Name" : "${var.prefix}-private-subnet"}, var.default_tags)
}
