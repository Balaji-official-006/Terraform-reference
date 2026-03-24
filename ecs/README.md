# Terraform ECS Cluster Deployment (AWS)

This project provisions an Amazon ECS Cluster and Task Definition using Terraform. It demonstrates Infrastructure as Code (IaC) best practices for deploying container-ready environments on AWS using reusable and parameterized configuration files.

This setup is suitable for DevOps learning, portfolio building, and interview preparation.

---

## 📌 Project Overview

This Terraform configuration:

* Creates an ECS Cluster
* Enables Container Insights monitoring
* Creates IAM execution role for ECS tasks
* Deploys an ECS Task Definition using Nginx container
* Uses parameterized variables for reusable infrastructure deployment
* Outputs cluster name and task definition ARN after deployment

The project structure follows:

```
main.tf
values.tf
```

---

## 🧱 Project Structure

```
terraform-ecs-cluster/
│
├── main.tf        # ECS cluster, IAM role, task definition resources
├── values.tf      # Variable declarations
└── README.md      # Project documentation
```

---

## ⚙️ Prerequisites

Ensure the following tools are installed before running this project.

### 1. Install Terraform

Verify installation:

```
terraform -version
```

Download Terraform:

https://developer.hashicorp.com/terraform/downloads

---

### 2. Install AWS CLI

Verify installation:

```
aws --version
```

Download AWS CLI:

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

Follow these steps to deploy the ECS cluster.

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

Terraform will create the ECS cluster and task definition.

---

## 📦 Verify ECS Cluster Creation

Open AWS Console:

```
AWS Console → ECS → Clusters
```

You should see:

```
balaji-ecs-cluster
```

---

## 📦 Verify Task Definition

Navigate to:

```
AWS Console → ECS → Task Definitions
```

Locate:

```
nginx-task
```

---

## 📊 Container Insights Enabled

This configuration enables:

```
CloudWatch Container Insights
```

Which helps monitor:

* CPU utilization
* Memory utilization
* Task-level metrics
* Cluster-level performance

---

## 📤 Terraform Outputs

Retrieve deployment outputs:

```
terraform output ecs_cluster_name
```

Example:

```
balaji-ecs-cluster
```

Retrieve task definition ARN:

```
terraform output task_definition_arn
```

---

## 🧹 Destroy Resources (Cleanup)

To remove infrastructure and avoid AWS charges:

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

| Variable            | Description                | Default                     |
| ------------------- | -------------------------- | --------------------------- |
| aws_region          | AWS region                 | ap-south-1                  |
| cluster_name        | ECS cluster name           | balaji-ecs-cluster          |
| execution_role_name | IAM execution role name    | ecsTaskExecutionRole-balaji |
| task_family         | ECS task definition family | nginx-task                  |
| task_cpu            | Task CPU units             | 256                         |
| task_memory         | Task memory                | 512                         |
| environment         | Resource environment tag   | dev                         |

---

## 🎯 Learning Outcomes

By completing this project, you demonstrate:

* ECS cluster provisioning using Terraform
* IAM role creation for ECS tasks
* Container task definition deployment
* CloudWatch Container Insights configuration
* Parameterized Terraform configuration design
* Infrastructure as Code best practices

---

## 👨‍💻 Author

Balaji B
DevOps Engineer 
AWS | Terraform | Docker | CI/CD | Kubernetes (Basics)

---

## ⭐ Future Improvements

Possible enhancements:

* Deploy ECS Service with Fargate launch type
* Attach Application Load Balancer (ALB)
* Add VPC networking configuration
* Use ECR instead of Docker Hub images
* Configure autoscaling policies
* Store Terraform remote state in S3 backend
