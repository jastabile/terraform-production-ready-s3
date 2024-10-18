# Create an S3 bucket
resource "aws_s3_bucket" "example" {
  bucket = var.bucket_name
  force_destroy = var.force_destroy
  tags = var.tags
}

# Add versioning
resource "aws_s3_bucket_versioning" "example" {
  bucket = aws_s3_bucket.example.id

  versioning_configuration {
    status = var.versioning_status
  }
}

# Create a KMS key with rotation
resource "aws_kms_key" "example" {
  description             = var.kmskey_description
  rotation_period_in_days = var.kmskey_rotation_period
  enable_key_rotation     = var.kmskey_key_rotation
}

# Create alias for the KMS key
resource "aws_kms_alias" "example" {
  name          = var.kms_alias_name
  target_key_id = aws_kms_key.example.id
}

# Add server side encryption at rest to the bucket
resource "aws_s3_bucket_server_side_encryption_configuration" "example" {
  bucket = aws_s3_bucket.example.id
  rule {
    apply_server_side_encryption_by_default {
      kms_master_key_id = aws_kms_key.example.id
      sse_algorithm     = var.sse_algorithm
    }
    bucket_key_enabled = var.bucket_key_enabled
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
  tags = var.tags
}