# Create an S3 bucket
resource "aws_s3_bucket" "example" {
  bucket = var.bucket_name
  force_destroy = var.force_destroy
  tags = local.tags
}

# Add versioning
resource "aws_s3_bucket_versioning" "example" {
  bucket = aws_s3_bucket.example.id

  versioning_configuration {
    status = "Enabled"
  }
}

# Create a KMS key with rotation
resource "aws_kms_key" "example" {
  description             = "KMS key for S3 bucket"
  rotation_period_in_days = 365
  enable_key_rotation     = true
}

# Create alias for the KMS key
resource "aws_kms_alias" "example" {
  name          = "alias/s3-kms-alias"
  target_key_id = aws_kms_key.example.id
}

# Add server side encryption at rest to the bucket
resource "aws_s3_bucket_server_side_encryption_configuration" "example" {
  bucket = aws_s3_bucket.example.id
  rule {
    apply_server_side_encryption_by_default {
      kms_master_key_id = aws_kms_key.example.id
      sse_algorithm     = "aws:kms"
    }
    bucket_key_enabled = true
  }
}

# Add access logging to the bucket
resource "aws_s3_bucket_logging" "example" {
  bucket = aws_s3_bucket.example.id
  target_bucket = var.logging_bucket_name
  target_prefix = "logs/"
}

# Create a logging bucket
resource "aws_s3_bucket" "logging" {
  # only if var.create_logging_bucket is true
  count = var.create_logging_bucket ? 1 : 0

  bucket = var.logging_bucket_name
  tags = local.tags
}