# ==============================
# ECR- main.tf
# ==============================

provider "aws" {
  region = var.aws_region
}

# ------------------------------
# Create ECR Repository
# ------------------------------
resource "aws_ecr_repository" "repo" {
  name                 = var.repository_name
  image_tag_mutability = var.image_tag_mutability

  image_scanning_configuration {
    scan_on_push = true
  }

  encryption_configuration {
    encryption_type = "AES256"
  }

  tags = {
    Environment = var.environment
    Project     = var.project_name
  }
}

# ------------------------------
# Lifecycle Policy
# ------------------------------
resource "aws_ecr_lifecycle_policy" "lifecycle_policy" {
  repository = aws_ecr_repository.repo.name

  policy = jsonencode({
    rules = [
      {
        rulePriority = 1,
        description  = "Expire untagged images after 7 days",
        selection = {
          tagStatus   = "untagged",
          countType   = "sinceImagePushed",
          countUnit   = "days",
          countNumber = 7
        },
        action = {
          type = "expire"
        }
      }
    ]
  })
}

# ------------------------------
# Outputs
# ------------------------------
output "repository_url" {
  value = aws_ecr_repository.repo.repository_url
}

output "repository_name" {
  value = aws_ecr_repository.repo.name
}
