resource "aws_instance" "instance" {
  ami           = var.ami_id
  instance_type = var.instance_type
  primary_network_interface {
    network_interface_id = var.interface_id
  }
  user_data                   = file("${path.module}/install.sh")
  user_data_replace_on_change = true
  key_name                    = data.aws_key_pair.key_pair.id
  # associate_public_ip_address = var.associate_public_ip_address
  tags = merge({ "Name" : "${var.prefix}-instance" }, var.default_tags)
}

data "aws_key_pair" "key_pair" {
  filter {
    name   = "Name"
    values = ["otcomes-sandbox-key-pair"]
  }
  region = "us-east-1"
}

resource "aws_eip" "ip" {
  domain            = "vpc"
  instance          = aws_instance.instance.id
  network_interface = var.network_interface_id
  tags = merge({
    "Name" : "${var.prefix}-eip"
  }, var.default_tags)
}
