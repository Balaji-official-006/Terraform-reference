# ==============================
# lambda-values.tf
# ==============================

variable "aws_region" {
  description = "AWS region"
  type        = string
  default     = "ap-south-1"
}

variable "lambda_function_name" {
  description = "Lambda function name"
  type        = string
  default     = "balaji-terraform-lambda"
}

variable "lambda_role_name" {
  description = "IAM role name for Lambda"
  type        = string
  default     = "balaji-lambda-role"
}

variable "runtime" {
  description = "Lambda runtime environment"
  type        = string
  default     = "python3.11"
}

variable "handler_name" {
  description = "Lambda handler name"
  type        = string
  default     = "lambda_function.lambda_handler"
}

variable "filename" {
  description = "Path to deployment package zip file"
  type        = string
  default     = "lambda_function.zip"
}

variable "environment" {
  description = "Environment tag"
  type        = string
  default     = "dev"
}

variable "project_name" {
  description = "Project tag name"
  type        = string
  default     = "terraform-lambda-project"
}
