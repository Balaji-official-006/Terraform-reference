# ==============================
#s3-values.tf
# ==============================

variable "aws_region" {
  description = "AWS region"
  type        = string
  default     = "us-east-1"
}

variable "bucket_name" {
  description = "Globally unique S3 bucket name"
  type        = string
  default     = "balaji-terraform-demo-bucket-12345"
}

variable "environment" {
  description = "Environment tag"
  type        = string
  default     = "dev"
}
