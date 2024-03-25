resource "aws_s3_bucket" "unsecured-bucket" {
  bucket = "project-unsecured-bucket-spring-2024"
}


resource "aws_s3_bucket_ownership_controls" "example" {
  bucket = aws_s3_bucket.unsecured-bucket.id
  rule {
    object_ownership = "BucketOwnerPreferred"
  }
}

resource "aws_s3_bucket_public_access_block" "example" {
  bucket = aws_s3_bucket.unsecured-bucket.id

  block_public_acls       = false
  block_public_policy     = false
  ignore_public_acls      = false
  restrict_public_buckets = false
}

resource "aws_s3_bucket_acl" "example" {
  depends_on = [
    aws_s3_bucket_ownership_controls.example,
    aws_s3_bucket_public_access_block.example,
  ]

  bucket = aws_s3_bucket.unsecured-bucket.id
  acl    = "public-read"
}



