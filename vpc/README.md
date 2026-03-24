# Terraform VPC Deployment (AWS)

This project provisions a custom Virtual Private Cloud (VPC) using Terraform. It demonstrates Infrastructure as Code (IaC) best practices for designing AWS networking infrastructure in a reusable and structured way.

This setup is suitable for DevOps learning, portfolio building, and interview preparation.

---

## 📌 Project Overview

This Terraform configuration:

* Creates a custom VPC
* Enables DNS support and DNS hostnames
* Creates two public subnets across multiple Availability Zones
* Configures Internet Gateway for internet connectivity
* Creates route table and associates subnets
* Outputs VPC ID and subnet IDs after deployment

Project structure:

```text
main.tf
values.tf
```

---

## 🧱 Project Structure

```text
terraform-vpc/
│
├── main.tf
├── values.tf
└── README.md
```

---

## ⚙️ Prerequisites

Ensure the following tools are installed before running this project.

### 1️⃣ Install Terraform

Check installation:

```bash
terraform -version
```

Download if needed:

https://developer.hashicorp.com/terraform/downloads

---

### 2️⃣ Install AWS CLI

Verify installation:

```bash
aws --version
```

Install if required:

https://docs.aws.amazon.com/cli/latest/userguide/getting-started-install.html

---

### 3️⃣ Configure AWS Credentials

Run:

```bash
aws configure
```

Provide:

```
AWS Access Key
AWS Secret Key
Region: ap-south-1
Output format: json
```

---

## 🚀 Deployment Steps

Follow these steps to create the VPC infrastructure.

### Step 1: Initialize Terraform

```bash
terraform init
```

Downloads required provider plugins.

---

### Step 2: Validate Configuration

```bash
terraform validate
```

Ensures syntax correctness.

---

### Step 3: Preview Execution Plan

```bash
terraform plan
```

Displays resources Terraform will create.

---

### Step 4: Apply Configuration

```bash
terraform apply
```

Type:

```
yes
```

when prompted.

Terraform will now create the VPC and networking components.

---

## 📦 Verify Infrastructure Creation

Open:

```
AWS Console → VPC → Your VPCs
```

You should see:

```
balaji-vpc
```

Check subnets:

```
AWS Console → VPC → Subnets
```

---

## 📤 Terraform Outputs

Retrieve VPC ID:

```bash
terraform output vpc_id
```

Retrieve subnet IDs:

```bash
terraform output public_subnet_ids
```

---

## 🌐 Architecture Created

This configuration deploys:

* 1 VPC
* 2 Public Subnets (multi-AZ)
* 1 Internet Gateway
* 1 Route Table
* Subnet associations with internet route

This forms the networking foundation required for:

* EC2 deployments
* ECS services
* EKS clusters
* Load balancers

---

## 🧹 Destroy Resources (Cleanup)

To avoid AWS charges:

```bash
terraform destroy
```

Type:

```
yes
```

when prompted.

---

## 📘 Variables Used

| Variable             | Description         | Default     |
| -------------------- | ------------------- | ----------- |
| aws_region           | AWS region          | ap-south-1  |
| vpc_name             | VPC name            | balaji-vpc  |
| vpc_cidr             | VPC CIDR            | 10.0.0.0/16 |
| public_subnet_1_cidr | Public subnet AZ-1  | 10.0.1.0/24 |
| public_subnet_2_cidr | Public subnet AZ-2  | 10.0.2.0/24 |
| az_1                 | Availability Zone 1 | ap-south-1a |
| az_2                 | Availability Zone 2 | ap-south-1b |
| environment          | Environment tag     | dev         |

---

## 🎯 Learning Outcomes

By completing this project, you demonstrate:

* AWS VPC provisioning using Terraform
* Multi-AZ subnet architecture design
* Internet Gateway configuration
* Route table association setup
* Variable-driven infrastructure deployment
* Infrastructure as Code best practices

---

## 👨‍💻 Author

Balaji B
DevOps Engineer 
AWS | Terraform | Docker | CI/CD | Kubernetes (Basics)

---

## ⭐ Future Improvements

Possible enhancements:

* Add private subnets
* Configure NAT Gateway
* Create security groups
* Add Network ACL rules
* Convert configuration into reusable Terraform modules
* Use remote backend (S3 + DynamoDB)
