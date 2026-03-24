# Terraform EKS Cluster Deployment (AWS)

This project provisions an Amazon EKS (Elastic Kubernetes Service) cluster using Terraform. It demonstrates Infrastructure as Code (IaC) best practices for deploying Kubernetes infrastructure on AWS in a structured and reusable way.

This project is suitable for DevOps learning, portfolio building, and interview preparation.

---

## 📌 Project Overview

This Terraform configuration:

* Creates a custom VPC
* Creates two public subnets across multiple Availability Zones
* Configures Internet Gateway and routing
* Creates IAM role for EKS cluster
* Deploys EKS Control Plane
* Outputs cluster name and endpoint after deployment

Project structure:

```
main.tf
values.tf
```

---

## 🧱 Project Structure

```
terraform-eks-cluster/
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

Download if needed:

https://developer.hashicorp.com/terraform/downloads

---

### 2️⃣ Install AWS CLI

Verify installation:

```
aws --version
```

Install if required:

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

### 4️⃣ Install kubectl (Optional but Recommended)

Verify installation:

```
kubectl version --client
```

Install if needed:

https://kubernetes.io/docs/tasks/tools/

---

## 🚀 Deployment Steps

Follow these steps to create the EKS cluster.

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

Ensures syntax correctness.

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

Terraform will now create the EKS cluster.

Cluster creation typically takes **10–15 minutes**.

---

## 📦 Verify Cluster Creation

Open:

```
AWS Console → EKS → Clusters
```

You should see:

```
balaji-eks-cluster
```

---

## 📤 Terraform Outputs

Retrieve cluster name:

```
terraform output eks_cluster_name
```

Retrieve cluster endpoint:

```
terraform output eks_cluster_endpoint
```

---

## 🔗 Configure kubectl Access

Run:

```
aws eks update-kubeconfig --region ap-south-1 --name balaji-eks-cluster
```

Verify:

```
kubectl get nodes
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

| Variable             | Description          | Default                 |
| -------------------- | -------------------- | ----------------------- |
| aws_region           | AWS region           | ap-south-1              |
| cluster_name         | EKS cluster name     | balaji-eks-cluster      |
| cluster_role_name    | IAM role for cluster | balaji-eks-cluster-role |
| vpc_cidr             | VPC CIDR block       | 10.0.0.0/16             |
| public_subnet_1_cidr | Subnet AZ-1          | 10.0.1.0/24             |
| public_subnet_2_cidr | Subnet AZ-2          | 10.0.2.0/24             |

---

## 🎯 Learning Outcomes

By completing this project, you demonstrate:

* Kubernetes infrastructure provisioning using Terraform
* EKS cluster deployment
* Custom VPC networking setup
* IAM role configuration for EKS
* Multi-AZ subnet architecture
* Infrastructure as Code best practices

---

## 👨‍💻 Author

Balaji B
DevOps Engineer 
AWS | Terraform | Docker | CI/CD | Kubernetes (Basics)

---

## ⭐ Future Improvements

Possible enhancements:

* Add managed node group
* Deploy sample Kubernetes application
* Configure ALB ingress controller
* Add private subnets + NAT gateway
* Store Terraform remote state in S3 backend
* Convert configuration into reusable modules
