resource "aws_instance" "instance" {
  ami           = var.ami_id
  instance_type = var.instance_type
  primary_network_interface {
    network_interface_id = var.interface_id
  }
  # associate_public_ip_address = var.associate_public_ip_address
  tags = merge( { "Name": "${var.prefix}-instance" }, var.default_tags)
}


resource "aws_eip" "ip" {
  domain            = "vpc"
  instance          = aws_instance.instance.id
  network_interface = var.network_interface_id
  tags = merge({
    "Name" : "${var.prefix}-eip"
  }, var.default_tags)
}
