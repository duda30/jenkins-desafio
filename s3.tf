resource "aws_s3_bucket" "bucket-backend" {
  bucket = "my-bucket-mary-maria12312"

  versioning {
    enabled = true
  }

  tags = {
    for key, value in var.resource-tags :
    key => lower(value)
  }
  
}

resource "aws_s3_bucket_acl" "acl-to-my-bucket" {
  bucket = aws_s3_bucket.bucket-backend.id
  acl    = "private"
}