# ==============================
# rds-values.tf
# ==============================

variable "aws_region" {
  description = "AWS region"
  type        = string
  default     = "ap-south-1"
}

variable "db_identifier" {
  description = "RDS instance identifier"
  type        = string
  default     = "balaji-rds-instance"
}

variable "engine" {
  description = "Database engine"
  type        = string
  default     = "postgres"
}

variable "engine_version" {
  description = "Database engine version"
  type        = string
  default     = "15"
}

variable "instance_class" {
  description = "RDS instance type"
  type        = string
  default     = "db.t3.micro"
}

variable "allocated_storage" {
  description = "Storage size in GB"
  type        = number
  default     = 20
}

variable "db_name" {
  description = "Initial database name"
  type        = string
  default     = "balajidb"
}

variable "db_username" {
  description = "Database username"
  type        = string
  default     = "postgres"
}

variable "db_password" {
  description = "Database password"
  type        = string
  default     = "ChangeMe123!"
}

variable "parameter_group_name" {
  description = "Parameter group"
  type        = string
  default     = "default.postgres15"
}

variable "subnet_group_name" {
  description = "Subnet group name"
  type        = string
  default     = "balaji-rds-subnet-group"
}

variable "subnet_ids" {
  description = "List of subnet IDs"
  type        = list(string)
  default     = ["subnet-xxxxxxxx", "subnet-yyyyyyyy"]
}

variable "sg_name" {
  description = "Security group name"
  type        = string
  default     = "balaji-rds-sg"
}

variable "db_port" {
  description = "Database port"
  type        = number
  default     = 5432
}

variable "allowed_cidr_blocks" {
  description = "Allowed CIDR blocks"
  type        = list(string)
  default     = ["0.0.0.0/0"]
}

variable "environment" {
  description = "Environment tag"
  type        = string
  default     = "dev"
}
