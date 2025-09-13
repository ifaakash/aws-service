resource "aws_s3_bucket" "terraform_state" {
  bucket        = var.bucket_name
  force_destroy = true
  tags          = merge({ "Name" = "${var.prefix}-terraform-state" }, var.default_tags)
}
