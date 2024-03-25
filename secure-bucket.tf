resource "aws_s3_bucket" "secured-bucket" {
  bucket = "project-secured-bucket-spring-2024"
}


resource "aws_s3_bucket_ownership_controls" "secure-example" {
  bucket = aws_s3_bucket.secured-bucket.id
  rule {
    object_ownership = "BucketOwnerEnforced"
  }
}

resource "aws_s3_bucket_public_access_block" "secure-example" {
  bucket = aws_s3_bucket.secured-bucket.id

  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}





