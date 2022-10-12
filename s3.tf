resource "aws_s3_bucket" "bucket-backend" {
  bucket = "my-bucket-mary-maria12312"
  tags = {
    for key, value in var.resource-tags :
    key => lower(value)
  }
}

resource "aws_s3_bucket_acl" "acl-to-my-bucket" {
  bucket = aws_s3_bucket.bucket-backend.id
  acl    = "private"
}

resource "aws_s3_bucket_versioning" "versioning-my-bucket" {
  bucket = aws_s3_bucket.bucket-backend.id
  versioning_configuration {
    status = "Enabled"
  }
}