resource "aws_instance" "instance" {
  ami           = var.ami_id
  instance_type = var.instance_type
  primary_network_interface {
    network_interface_id = var.interface_id
  }
  user_data                   = file("${path.module}/install.sh")
  user_data_replace_on_change = true
  key_name                    = aws_key_pair.key_pair.id
  # associate_public_ip_address = var.associate_public_ip_address
  tags = merge({ "Name" : "${var.prefix}-instance" }, var.default_tags)
}

resource "tls_private_key" "pk" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

resource "local_file" "private_key_pem" {
  content  = tls_private_key.pk.private_key_pem
  filename = "instance-startup.pem"
}

resource "aws_key_pair" "key_pair" {
  key_name   = "instance-startup"
  public_key = tls_private_key.pk.public_key_openssh
  tags       = merge({ "Name" : "${var.prefix}-key-pair" }, var.default_tags)
}

resource "aws_eip" "ip" {
  domain            = "vpc"
  instance          = aws_instance.instance.id
  network_interface = var.network_interface_id
  tags = merge({
    "Name" : "${var.prefix}-eip"
  }, var.default_tags)
}
