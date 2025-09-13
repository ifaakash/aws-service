output "network_interface_id" {
  value       = aws_network_interface.networking_interface.id
  description = "The ID of the network interface, being used by EC2 Instance in public subnet"
}
