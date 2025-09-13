variable "prefix" {
  type    = string
  default = "otcomes-sandbox"
}

variable "bucket_name"{
  type    = string
  default = "${var.prefix}-terraform-state"
}


######################## DEFAULT TAGS ########################

variable "default_tags" {
  type = map(string)
  default = {
    Environment = "Sandbox"
  }
}
