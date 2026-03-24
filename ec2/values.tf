# ==============================
# values.tf
# ==============================

variable "aws_region" {
  description = "AWS region"
  type        = string
  default     = "us-east-1"
}

variable "ami_id" {
  description = "AMI ID for EC2 instance"
  type        = string
  default     = "ami-0f5ee92e2d63afc18"
}

variable "instance_type" {
  description = "EC2 instance type"
  type        = string
  default     = "t2.micro"
}

variable "key_name" {
  description = "Existing AWS key pair name"
  type        = string
  default     = "terraform-key"
}

variable "instance_name" {
  description = "Name tag for EC2 instance"
  type        = string
  default     = "Terraform-EC2"
}

variable "sg_name" {
  description = "Security group name"
  type        = string
  default     = "terraform-ec2-sg"
}

variable "allowed_ssh_cidr" {
  description = "CIDR blocks allowed for SSH"
  type        = list(string)
  default     = ["0.0.0.0/0"]
}
