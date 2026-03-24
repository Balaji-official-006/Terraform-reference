# Terraform S3 Bucket Deployment (AWS)

This project provisions an Amazon S3 bucket using Terraform. It demonstrates Infrastructure as Code (IaC) best practices by creating reusable and parameterized configurations suitable for DevOps learning and interview preparation.

---

## 📌 Project Overview

This Terraform configuration:

* Creates an S3 bucket
* Enables versioning for object recovery
* Applies tagging for resource identification
* Uses parameterized variables for flexibility
* Demonstrates reusable Terraform configuration structure

The project uses:

```
main.tf
values.tf
```

---

## 🧱 Project Structure

```
terraform-s3-bucket/
│
├── main.tf        # S3 resource definitions
├── values.tf      # Variable declarations
└── README.md      # Project documentation
```

---

## ⚙️ Prerequisites

Before running this project, ensure the following tools are installed and configured.

### 1. Install Terraform

Check installation:

```
terraform -version
```

Download Terraform if needed:

https://developer.hashicorp.com/terraform/downloads

---

### 2. Install AWS CLI

Verify installation:

```
aws --version
```

Download AWS CLI if required:

https://docs.aws.amazon.com/cli/latest/userguide/getting-started-install.html

---

### 3. Configure AWS Credentials

Run:

```
aws configure
```

Provide:

```
AWS Access Key
AWS Secret Key
Region (example: ap-south-1)
Output format: json
```

---

## 🚀 Deployment Steps

Follow these steps to create the S3 bucket.

### Step 1: Initialize Terraform

```
terraform init
```

This downloads the required provider plugins.

---

### Step 2: Validate Configuration

```
terraform validate
```

Checks Terraform syntax and configuration correctness.

---

### Step 3: Preview Execution Plan

```
terraform plan
```

Displays the resources Terraform will create.

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

Terraform will now create the S3 bucket.

---

## 📦 Verify Bucket Creation

Go to AWS Console:

```
AWS Console → S3 → Buckets
```

You should see your Terraform-created bucket listed.

---

## 🔐 Versioning Support

This project enables **bucket versioning**, allowing:

* Recovery of deleted files
* Restoration of previous object versions
* Protection against accidental overwrites

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

| Variable    | Description       | Default               |
| ----------- | ----------------- | --------------------- |
| aws_region  | AWS region        | ap-south-1            |
| bucket_name | Name of S3 bucket | terraform-demo-bucket |
| environment | Environment tag   | dev                   |

---

## 🎯 Learning Outcomes

By completing this project, you demonstrate:

* Terraform provider configuration
* S3 bucket provisioning using IaC
* Bucket versioning configuration
* Resource tagging strategy
* Variable-based Terraform structure
* AWS CLI integration with Terraform workflow

---

## 👨‍💻 Author

Balaji B
DevOps Engineer 
AWS | Terraform | Docker | CI/CD | Kubernetes (Basics)

---

## ⭐ Future Improvements

Possible enhancements:

* Enable server-side encryption (SSE-S3 / SSE-KMS)
* Configure lifecycle policies
* Enable bucket logging
* Add bucket policy for restricted access
* Use remote backend (S3 + DynamoDB)
* Convert configuration into reusable Terraform modules
