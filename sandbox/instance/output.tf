output "instance_id" {
  value = aws_instance.instance.id
}

output "key_name" {
  value = module.key_pair.key_name
}
