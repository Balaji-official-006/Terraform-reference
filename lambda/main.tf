# ==============================
# lambda-main.tf
# ==============================

provider "aws" {
  region = var.aws_region
}

# ------------------------------
# IAM Role for Lambda
# ------------------------------
resource "aws_iam_role" "lambda_role" {
  name = var.lambda_role_name

  assume_role_policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Action = "sts:AssumeRole",
        Effect = "Allow",
        Principal = {
          Service = "lambda.amazonaws.com"
        }
      }
    ]
  })
}

# Attach basic execution policy
resource "aws_iam_role_policy_attachment" "lambda_basic_policy" {
  role       = aws_iam_role.lambda_role.name
  policy_arn = "arn:aws:iam::aws:policy/service-role/AWSLambdaBasicExecutionRole"
}

# ------------------------------
# Lambda Function
# ------------------------------
resource "aws_lambda_function" "lambda_function" {
  function_name = var.lambda_function_name
  role          = aws_iam_role.lambda_role.arn
  handler       = var.handler_name
  runtime       = var.runtime

  filename         = var.filename
  source_code_hash = filebase64sha256(var.filename)

  tags = {
    Environment = var.environment
    Project     = var.project_name
  }

  depends_on = [aws_iam_role_policy_attachment.lambda_basic_policy]
}

# ------------------------------
# Output Lambda ARN
# ------------------------------
output "lambda_function_arn" {
  value = aws_lambda_function.lambda_function.arn
}

output "lambda_function_name" {
  value = aws_lambda_function.lambda_function.function_name
}
