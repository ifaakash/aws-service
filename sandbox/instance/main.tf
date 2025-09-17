resource "aws_instance" "instance" {
  ami           = var.ami_id
  instance_type = var.instance_type
  primary_network_interface {
    network_interface_id = var.interface_id
  }
  user_data                   = file("${path.module}/install.sh")
  user_data_replace_on_change = true
  key_name                    = "otcomes-sandbox-key-pair"
  tags                        = merge({ "Name" : "${var.prefix}-instance" }, var.default_tags)
}

data "aws_key_pair" "key_pair" {
  key_name = "otcomes-sandbox-key-pair"
}

resource "aws_eip" "ip" {
  domain            = "vpc"
  instance          = aws_instance.instance.id
  network_interface = var.network_interface_id
  tags = merge({
    "Name" : "${var.prefix}-eip"
  }, var.default_tags)
}
