# ==============================
#eks- main.tf
# ==============================

provider "aws" {
  region = var.aws_region
}

# ------------------------------
# VPC for EKS Cluster
# ------------------------------
resource "aws_vpc" "eks_vpc" {
  cidr_block = var.vpc_cidr

  tags = {
    Name = "eks-vpc"
  }
}

# Public Subnet 1
resource "aws_subnet" "public_subnet_1" {
  vpc_id                  = aws_vpc.eks_vpc.id
  cidr_block              = var.public_subnet_1_cidr
  availability_zone       = "ap-south-1a"
  map_public_ip_on_launch = true
}

# Public Subnet 2
resource "aws_subnet" "public_subnet_2" {
  vpc_id                  = aws_vpc.eks_vpc.id
  cidr_block              = var.public_subnet_2_cidr
  availability_zone       = "ap-south-1b"
  map_public_ip_on_launch = true
}

# Internet Gateway
resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.eks_vpc.id
}

# Route Table
resource "aws_route_table" "route_table" {
  vpc_id = aws_vpc.eks_vpc.id
}

# Default Route
resource "aws_route" "default_route" {
  route_table_id         = aws_route_table.route_table.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.igw.id
}

# Route Table Associations
resource "aws_route_table_association" "assoc_1" {
  subnet_id      = aws_subnet.public_subnet_1.id
  route_table_id = aws_route_table.route_table.id
}

resource "aws_route_table_association" "assoc_2" {
  subnet_id      = aws_subnet.public_subnet_2.id
  route_table_id = aws_route_table.route_table.id
}

# ------------------------------
# IAM Role for EKS Cluster
# ------------------------------
resource "aws_iam_role" "eks_cluster_role" {
  name = var.cluster_role_name

  assume_role_policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Effect = "Allow",
        Principal = {
          Service = "eks.amazonaws.com"
        },
        Action = "sts:AssumeRole"
      }
    ]
  })
}

resource "aws_iam_role_policy_attachment" "eks_cluster_policy" {
  role       = aws_iam_role.eks_cluster_role.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSClusterPolicy"
}

# ------------------------------
# EKS Cluster
# ------------------------------
resource "aws_eks_cluster" "eks_cluster" {
  name     = var.cluster_name
  role_arn = aws_iam_role.eks_cluster_role.arn

  vpc_config {
    subnet_ids = [
      aws_subnet.public_subnet_1.id,
      aws_subnet.public_subnet_2.id
    ]
  }

  depends_on = [aws_iam_role_policy_attachment.eks_cluster_policy]
}

# ------------------------------
# Output Cluster Name
# ------------------------------
output "eks_cluster_name" {
  value = aws_eks_cluster.eks_cluster.name
}

# Output Endpoint
output "eks_cluster_endpoint" {
  value = aws_eks_cluster.eks_cluster.endpoint
}
