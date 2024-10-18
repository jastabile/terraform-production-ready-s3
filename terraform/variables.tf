# env variable
variable "env" {
  description = "The environment in which the resources will be created"
  type        = string
  default     = "dev"
}

# bucket_name variable
variable "bucket_name" {
  description = "The name of the S3 bucket"
  type        = string
  default     = "my-bucket"
}

# force_destroy variable
variable "force_destroy" {
  description = "Whether to force destroy the bucket"
  type        = bool
  default     = false
}


# logging_bucket_name variable
variable "logging_bucket_name" {
  description = "The name of the S3 bucket for logging"
  type        = string
  default     = "my-logging-bucket"
}

# create_logging_bucket variable
variable "create_logging_bucket" {
  description = "Whether to create a logging bucket"
  type        = bool
  default     = false
}

