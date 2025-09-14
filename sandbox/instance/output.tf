output "instance_id" {
  value = aws_instance.instance.id
}

output "key_name" {
  value = aws_key_pair.key_pair.id
}
