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

# tags variable
variable "tags" {
  description = "Tags to apply to all resources"
  type        = map(string)
  default     = {}
}

# versioning_status variable
variable "versioning_status" {
  description = "The versioning status of the S3 bucket"
  type        = string
  default     = "Enabled"
}

# kmskey_description variable
variable "kmskey_description" {
  description = "The description of the KMS key"
  type        = string
  default     = "KMS key for S3 bucket"
}

# kmskey_key_rotation variable
variable "kmskey_key_rotation" {
  description = "enable key rotation for the KMS key"
  type = bool
  default = true
}

# kmskey_rotation_period variable
variable "kmskey_rotation_period" {
  description = "The rotation period in days for the KMS key"
  type        = number
  default     = 365
}

# kms_alias_name variable
variable "kms_alias_name" {
  description = "The alias name for the KMS key"
  type        = string
  default     = "alias/my-kms-key"
}

# sse_algorithm variable
variable "sse_algorithm" {
  description = "The server side encryption algorithm"
  type        = string
  default     = "aws:kms"
}

# bucket_key_enabled variable
variable "bucket_key_enabled" {
  description = "Whether to enable bucket key"
  type        = bool
  default     = true
}
