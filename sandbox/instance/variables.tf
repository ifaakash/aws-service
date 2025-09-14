variable "ami_id" {
  description = "The AMI ID to use for the instance"
  type        = string
}

variable "interface_id" {
  description = "The network interface ID"
  type        = string
}

variable "instance_type" {
  description = "The type of instance to launch"
  type        = string
}

variable "prefix" {
  description = "A prefix for naming resources"
  type        = string
}

variable "network_interface_id" {
  description = "The network interface ID"
  type        = string
}

# variable "associate_public_ip_address" {
#   description = "Whether to associate a public IP address with the instance"
#   type        = bool
# }

variable "default_tags" {
  type = map(string)
}
