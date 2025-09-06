resource "aws_s3_bucket" "image_s3"{
  bucket= var.bucket_name
  force_destroy= true
  tags = merge({"Name": var.bucket_name},var.tags)
}
