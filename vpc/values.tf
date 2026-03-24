# ==============================
# VPC-values.tf
# ==============================

variable "aws_region" {
  description = "AWS region"
  type        = string
  default     = "ap-south-1"
}

variable "vpc_name" {
  description = "VPC Name"
  type        = string
  default     = "balaji-vpc"
}

variable "vpc_cidr" {
  description = "CIDR block for VPC"
  type        = string
  default     = "10.0.0.0/16"
}

variable "public_subnet_1_cidr" {
  description = "CIDR for public subnet 1"
  type        = string
  default     = "10.0.1.0/24"
}

variable "public_subnet_2_cidr" {
  description = "CIDR for public subnet 2"
  type        = string
  default     = "10.0.2.0/24"
}

variable "az_1" {
  description = "Availability Zone 1"
  type        = string
  default     = "ap-south-1a"
}

variable "az_2" {
  description = "Availability Zone 2"
  type        = string
  default     = "ap-south-1b"
}

variable "environment" {
  description = "Environment tag"
  type        = string
  default     = "de
