resource "aws_vpc" "sandbox_vpc" {
  cidr_block = var.vpc_cidr_block
  tags       = merge({ "Name" : "${var.prefix}-vpc" }, var.default_tags)
}

resource "aws_subnet" "public_subnet" {
  vpc_id     = aws_vpc.sandbox_vpc.id
  cidr_block = var.public_subnet_cidr_block
  tags       = merge({ "Name" : "${var.prefix}-public-subnet" }, var.default_tags)
}

resource "aws_subnet" "private_subnet" {
  vpc_id     = aws_vpc.sandbox_vpc.id
  cidr_block = var.private_subnet_cidr_block
  tags       = merge({ "Name" : "${var.prefix}-private-subnet" }, var.default_tags)
}

resource "aws_internet_gateway" "sandbox_igw" {
  vpc_id = aws_vpc.sandbox_vpc.id
  tags   = merge({ "Name" : "${var.prefix}-igw" }, var.default_tags)
}

resource "aws_route_table" "public_route_table" {
  vpc_id = aws_vpc.sandbox_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.sandbox_igw.id
  }
  tags = merge({ "Name" : "${var.prefix}-public-route-table" }, var.default_tags)
}

resource "aws_route_table_association" "public_route_table_association" {
  subnet_id      = aws_subnet.public_subnet.id
  route_table_id = aws_route_table.public_route_table.id
}


resource "aws_network_interface" "networking_interface" {
  subnet_id = aws_subnet.public_subnet.id
  tags      = merge({ "Name" : "${var.prefix}-networking-interface" }, var.default_tags)
}
