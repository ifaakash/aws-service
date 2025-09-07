resource "aws_vpc" "sandbox_vpc" {
  cidr_block = var.vpc_cidr_block
  tags= var.tags
}

resource "aws_subnet" "public_subnet"{
  vpc_id = aws_vpc.sandbox_vpc.id
  cidr_block = var.public_subnet_cidr_block
}
