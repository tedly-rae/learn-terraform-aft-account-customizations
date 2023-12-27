data "aws_caller_identity" "current" {}

resource "aws_s3_bucket" "sandbox_bucket" {
  bucket = "aft-sandbox-${data.aws_caller_identity.current.account_id}"
  # acl    = "private" (Deprecated)
}

resource "aws_s3_bucket_public_access_block" "block-sandbox-bucket" {
  bucket = aws_s3_bucket.sandbox_bucket.id

  block_public_acls       = false
  block_public_policy     = false
  ignore_public_acls      = true
  restrict_public_buckets = true
}