# ==============================
# ECR-values.tf
# ==============================

variable "aws_region" {
  description = "AWS region"
  type        = string
  default     = "ap-south-1"
}

variable "repository_name" {
  description = "ECR repository name"
  type        = string
  default     = "balaji-ecr-repository"
}

variable "image_tag_mutability" {
  description = "Image tag mutability setting"
  type        = string
  default     = "MUTABLE"
}

variable "environment" {
  description = "Environment tag"
  type        = string
  default     = "dev"
}

variable "project_name" {
  description = "Project tag name"
  type        = string
  default     = "terraform-ecr-project"
}

