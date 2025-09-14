resource "aws_instance" "instance" {
  ami           = var.ami_id
  instance_type = var.instance_type
  primary_network_interface {
    network_interface_id = var.interface_id
  }
  user_data                   = file("${path.module}/install.sh")
  user_data_replace_on_change = true
  key_name                    = module.key_pair.key_name
  # associate_public_ip_address = var.associate_public_ip_address
  tags = merge({ "Name" : "${var.prefix}-instance" }, var.default_tags)
}


module "key_pair" {
  source             = "terraform-aws-modules/key-pair/aws"
  key_name           = "instance-startup"
  create_private_key = true
  tags               = merge({ "Name" : "${var.prefix}-key-pair" }, var.default_tags)
}

resource "aws_eip" "ip" {
  domain            = "vpc"
  instance          = aws_instance.instance.id
  network_interface = var.network_interface_id
  tags = merge({
    "Name" : "${var.prefix}-eip"
  }, var.default_tags)
}
