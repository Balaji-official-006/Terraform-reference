# Terraform ECR Repository Deployment (AWS)

This project provisions an Amazon Elastic Container Registry (ECR) repository using Terraform. It demonstrates Infrastructure as Code (IaC) best practices for managing container image storage securely and efficiently in AWS.

This setup is suitable for DevOps learning, portfolio building, and interview preparation.

---

## 📌 Project Overview

This Terraform configuration:

* Creates an ECR repository
* Enables image scanning on push
* Configures AES256 encryption
* Applies lifecycle policy to remove unused images
* Uses parameterized variables for reusable configuration
* Outputs repository name and repository URL after deployment

Project structure:

```
main.tf
values.tf
```

---

## 🧱 Project Structure

```
terraform-ecr-repository/
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

```
terraform -version
```

Download Terraform if needed:

https://developer.hashicorp.com/terraform/downloads

---

### 2️⃣ Install AWS CLI

Verify installation:

```
aws --version
```

Install AWS CLI if required:

https://docs.aws.amazon.com/cli/latest/userguide/getting-started-install.html

---

### 3️⃣ Configure AWS Credentials

Run:

```
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

Follow these steps to create the ECR repository.

### Step 1: Initialize Terraform

```
terraform init
```

Downloads required provider plugins.

---

### Step 2: Validate Configuration

```
terraform validate
```

Ensures configuration syntax correctness.

---

### Step 3: Preview Execution Plan

```
terraform plan
```

Displays resources Terraform will create.

---

### Step 4: Apply Configuration

```
terraform apply
```

Type:

```
yes
```

when prompted.

Terraform will now create the ECR repository.

---

## 📦 Verify Repository Creation

Open:

```
AWS Console → ECR → Repositories
```

You should see:

```
balaji-ecr-repository
```

---

## 📤 Terraform Outputs

Retrieve repository name:

```
terraform output repository_name
```

Retrieve repository URL:

```
terraform output repository_url
```

Example output:

```
123456789012.dkr.ecr.ap-south-1.amazonaws.com/balaji-ecr-repository
```

---

## 🐳 Push Docker Image to ECR

Authenticate Docker with ECR:

```
aws ecr get-login-password --region ap-south-1 \
| docker login --username AWS --password-stdin <account-id>.dkr.ecr.ap-south-1.amazonaws.com
```

Tag image:

```
docker tag nginx:latest <repository_url>:latest
```

Push image:

```
docker push <repository_url>:latest
```

---

## 🧹 Destroy Resources (Cleanup)

To avoid AWS charges:

```
terraform destroy
```

Type:

```
yes
```

when prompted.

---

## 📘 Variables Used

| Variable             | Description            | Default               |
| -------------------- | ---------------------- | --------------------- |
| aws_region           | AWS region             | ap-south-1            |
| repository_name      | ECR repository name    | balaji-ecr-repository |
| image_tag_mutability | Tag mutability setting | MUTABLE               |
| environment          | Environment tag        | dev                   |
| project_name         | Project tag            | terraform-ecr-project |

---

## 🎯 Learning Outcomes

By completing this project, you demonstrate:

* ECR repository provisioning using Terraform
* Container image security configuration
* Lifecycle policy automation
* Image scanning configuration
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

* Use KMS encryption instead of AES256
* Add repository access policies
* Integrate with ECS deployment pipeline
* Integrate with EKS image pull workflow
* Store Terraform state in S3 backend
* Convert configuration into reusable modules
