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

variable "default_tags" {
  type = map(string)
}
