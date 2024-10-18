# create a s3_bucket_prod_ready
module "s3_bucket_prod_ready" {
  source = "../../modules/s3_bucket_prod_ready"
  env = "dev"
  bucket_name = "test-bucket-c6afdg"
  force_destroy = true
  create_logging_bucket = false
  logging_bucket_name = "test-bucket-c6afdg"

  tags = {
    env = "dev"
  }
}