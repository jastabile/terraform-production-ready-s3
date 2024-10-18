locals {
  bucket_name = "${var.env}-${var.bucket_name}"

  tags = {
    Name = local.bucket_name
    Env = var.env
  }
}

