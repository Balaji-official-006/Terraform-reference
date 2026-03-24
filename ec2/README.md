# Terraform EC2 Instance Deployment (AWS)

This project provisions an Amazon EC2 instance using Terraform with a structured and reusable configuration approach. It demonstrates Infrastructure as Code (IaC) best practices suitable for DevOps beginner to intermediate-level learning and interviews.

---

## 📌 Project Overview

This Terraform configuration:

* Creates a Security Group allowing SSH access
* Launches an EC2 instance
* Uses parameterized variables for flexibility
* Outputs the public IP of the instance after deployment

The project follows a clean structure using:

```
main.tf
values.tf
```

---

## 🧱 Project Structure

```
terraform-ec2-instance/
│
├── main.tf        # Resource definitions
├── values.tf      # Variable declarations
└── README.md      # Project documentation
```

---

## ⚙️ Prerequisites

Before running this project, ensure the following are installed and configured:

### 1. Install Terraform

Verify installation:

```
terraform -version
```

Download if not installed:

https://developer.hashicorp.com/terraform/downloads

---

### 2. Install AWS CLI

Verify installation:

```
aws --version
```

Download if needed:

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

### 4. Ensure Key Pair Exists in AWS

Make sure your EC2 key pair exists in AWS.

Example:

```
terraform-key
```

If not available, create one from the AWS Console → EC2 → Key Pairs.

---

## 🚀 Deployment Steps

Follow these steps to launch the EC2 instance.

### Step 1: Initialize Terraform

```
terraform init
```

This downloads required provider plugins.

---

### Step 2: Validate Configuration

```
terraform validate
```

Ensures syntax is correct.

---

### Step 3: Preview Execution Plan

```
terraform plan
```

Shows resources Terraform will create.

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

Terraform will now create the EC2 instance.

---

## 🌐 Retrieve Instance Public IP

After deployment completes:

```
terraform output instance_public_ip
```

Example output:

```
instance_public_ip = 13.xx.xx.xx
```

---

## 🔐 Connect to EC2 Instance

Use SSH:

```
ssh ec2-user@<instance_public_ip>
```

Example:

```
ssh ec2-user@13.xx.xx.xx
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

| Variable         | Description            | Default          |
| ---------------- | ---------------------- | ---------------- |
| aws_region       | AWS region             | ap-south-1       |
| ami_id           | Amazon Linux 2 AMI     | Provided         |
| instance_type    | EC2 instance type      | t2.micro         |
| key_name         | Existing key pair name | terraform-key    |
| instance_name    | EC2 instance tag       | Terraform-EC2    |
| sg_name          | Security group name    | terraform-ec2-sg |
| allowed_ssh_cidr | Allowed SSH IP range   | 0.0.0.0/0        |

---

## 🎯 Learning Outcomes

By completing this project, you demonstrate:

* Terraform provider configuration
* Variable-based infrastructure deployment
* Security group creation
* EC2 provisioning using IaC
* Output value usage
* AWS CLI integration with Terraform workflow

---

## 👨‍💻 Author

Balaji B
DevOps Engineer 
AWS | Terraform | Docker | CI/CD | Kubernetes (Basics)

---

## ⭐ Future Improvements

Possible enhancements:

* Add remote backend (S3 + DynamoDB)
* Create reusable Terraform modules
* Attach IAM role to EC2
* Install Nginx using user_data
* Add VPC and subnet configuration
* Automate deployment using CI/CD pipeline
