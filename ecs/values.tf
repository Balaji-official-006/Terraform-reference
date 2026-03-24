# ==============================
#ecs- values.tf
# ==============================

variable "aws_region" {
  description = "AWS region"
  type        = string
  default     = "ap-south-1"
}

variable "cluster_name" {
  description = "Name of ECS Cluster"
  type        = string
  default     = "balaji-ecs-cluster"
}

variable "execution_role_name" {
  description = "IAM execution role name"
  type        = string
  default     = "ecsTaskExecutionRole-balaji"
}

variable "task_family" {
  description = "Task definition family name"
  type        = string
  default     = "nginx-task"
}

variable "task_cpu" {
  description = "CPU units for task"
  type        = string
  default     = "256"
}

variable "task_memory" {
  description = "Memory for task"
  type        = string
  default     = "512"
}

variable "environment" {
  description = "Environment tag"
  type        = string
  default     = "dev"
}
