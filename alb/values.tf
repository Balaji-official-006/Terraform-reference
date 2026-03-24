# ==============================
# alb-values.tf
# ==============================

variable "aws_region" {
  description = "AWS region"
  type        = string
  default     = "ap-south-1"
}

variable "alb_name" {
  description = "ALB name"
  type        = string
  default     = "balaji-alb"
}

variable "alb_sg_name" {
  description = "Security group name for ALB"
  type        = string
  default     = "balaji-alb-sg"
}

variable "target_group_name" {
  description = "Target group name"
  type        = string
  default     = "balaji-target-group"
}

variable "vpc_id" {
  description = "VPC ID where ALB will be deployed"
  type        = string
  default     = "vpc-xxxxxxxx"
}

variable "subnet_ids" {
  description = "Public subnet IDs"
  type        = list(string)
  default     = ["subnet-xxxxxxxx", "subnet-yyyyyyyy"]
}

variable "allowed_cidr_blocks" {
  description = "Allowed inbound CIDR blocks"
  type        = list(string)
  default     = ["0.0.0.0/0"]
}

variable "environment" {
  description = "Environment tag"
  type        = string
  default     = "dev"
}
