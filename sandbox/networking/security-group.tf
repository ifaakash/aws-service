resource "aws_security_group" "sg" {
  name        = "${var.prefix}-sg"
  description = "Security group for ${var.prefix}-vpc that allow SSH access from particular IP address"
  vpc_id      = aws_vpc.sandbox_vpc.id
  tags        = merge({ "Name" : "${var.prefix}-sg" }, var.default_tags)
}

resource "aws_vpc_security_group_ingress_rule" "ingress_ssh" {
  security_group_id = aws_security_group.sg.id
  from_port         = 22
  to_port           = 22
  ip_protocol       = "tcp"
  cidr_ipv4         = var.ssh_access_cidr
}

resource "aws_vpc_security_group_ingress_rule" "ingress_http" {
  security_group_id = aws_security_group.sg.id
  from_port         = 80
  to_port           = 80
  ip_protocol       = "tcp"
  cidr_ipv4         = var.ssh_access_cidr
}

resource "aws_network_interface_sg_attachment" "ingress" {
  security_group_id    = aws_security_group.sg.id
  network_interface_id = aws_network_interface.networking_interface.id
}

resource "aws_vpc_security_group_egress_rule" "egress_all" {
  security_group_id = aws_security_group.sg.id
  cidr_ipv4         = "0.0.0.0/0"
  ip_protocol       = "tcp"
  from_port         = 0
  to_port           = 0
}
