resource "aws_s3_bucket" "terraform_state" {
  bucket = var.bucket_name

  tags = merge({ "Name" = "${var.prefix}-terraform-state" }, var.default_tags)
}
