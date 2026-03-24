# ==============================
# eks-values.tf
# ==============================

variable "aws_region" {
  description = "AWS region"
  type        = string
  default     = "us-east-1"
}

variable "cluster_name" {
  description = "EKS Cluster Name"
  type        = string
  default     = "balaji-eks-cluster"
}

variable "cluster_role_name" {
  description = "IAM Role Name for EKS Cluster"
  type        = string
  default     = "balaji-eks-cluster-role"
}

variable "vpc_cidr" {
  description = "CIDR block for VPC"
  type        = string
  default     = "10.0.0.0/16"
}

variable "public_subnet_1_cidr" {
  description = "CIDR for Public Subnet 1"
  type        = string
  default     = "10.0.1.0/24"
}

variable "public_subnet_2_cidr" {
  description = "CIDR for Public Subnet 2"
  type        = string
  default     = "10.0.2.0/24"
}
