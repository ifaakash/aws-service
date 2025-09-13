variable "prefix" {
  type    = string
  default = "otcomes-sandbox"
}

variable "bucket_name" {
  type    = string
  default = "otcomes-sandbox-terraform-state"
}

######################## DEFAULT TAGS ########################

variable "default_tags" {
  type = map(string)
  default = {
    Environment = "Sandbox"
  }
}
