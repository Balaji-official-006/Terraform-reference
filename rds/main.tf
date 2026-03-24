# ==============================
# rds- main.tf
# ==============================

provider "aws" {
  region = var.aws_region
}

# ------------------------------
# Security Group for RDS
# ------------------------------
resource "aws_security_group" "rds_sg" {
  name        = var.sg_name
  description = "Allow database access"

  ingress {
    from_port   = var.db_port
    to_port     = var.db_port
    protocol    = "tcp"
    cidr_blocks = var.allowed_cidr_blocks
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = var.sg_name
  }
}

# ------------------------------
# RDS Subnet Group
# ------------------------------
resource "aws_db_subnet_group" "rds_subnet_group" {
  name       = var.subnet_group_name
  subnet_ids = var.subnet_ids

  tags = {
    Name = var.subnet_group_name
  }
}

# ------------------------------
# RDS Instance
# ------------------------------
resource "aws_db_instance" "rds_instance" {
  identifier              = var.db_identifier
  allocated_storage       = var.allocated_storage
  engine                  = var.engine
  engine_version          = var.engine_version
  instance_class          = var.instance_class
  db_name                 = var.db_name
  username                = var.db_username
  password                = var.db_password
  parameter_group_name    = var.parameter_group_name
  skip_final_snapshot     = true
  publicly_accessible     = true
  vpc_security_group_ids  = [aws_security_group.rds_sg.id]
  db_subnet_group_name    = aws_db_subnet_group.rds_subnet_group.name
  multi_az                = false

  tags = {
    Name        = var.db_identifier
    Environment = var.environment
  }
}

# ------------------------------
# Outputs
# ------------------------------
output "rds_endpoint" {
  value = aws_db_instance.rds_instance.endpoint
}

output "rds_db_name" {
  value = aws_db_instance.rds_instance.db_name
}
