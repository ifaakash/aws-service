resource "aws_ec2_instance" "example" {
  ami           = var.ami_id
  instance_type = var.instance_type
  primary_network_interface {
    network_interface_id = var.interface_id
  }
  tags = {
    merge({"Name": "${var.prefix}-instance"}, var.default_tags)
  }
}
