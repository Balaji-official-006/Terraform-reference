# Terraform Application Load Balancer (ALB) Deployment (AWS)

This project provisions an AWS Application Load Balancer (ALB) using Terraform. It demonstrates Infrastructure as Code (IaC) best practices for deploying scalable and highly available traffic routing infrastructure in AWS.

This setup is suitable for DevOps learning, portfolio building, and interview preparation.

---

## 📌 Project Overview

This Terraform configuration:

* Creates a security group for ALB
* Deploys an Application Load Balancer
* Creates a target group
* Configures HTTP listener on port 80
* Enables health checks for backend targets
* Outputs ALB DNS name after deployment

Project structure:

```bash id="i6pjwd"
main.tf
values.tf
README.md
```

---

## 🧱 Project Structure

```bash id="gh5y6m"
terraform-alb/
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

```bash id="sbqmd3"
terraform -version
```

Download Terraform if needed:

https://developer.hashicorp.com/terraform/downloads

---

### 2️⃣ Install AWS CLI

Verify installation:

```bash id="7qu2qg"
aws --version
```

Install AWS CLI if required:

https://docs.aws.amazon.com/cli/latest/userguide/getting-started-install.html

---

### 3️⃣ Configure AWS Credentials

Run:

```bash id="3nt2sy"
aws configure
```

Provide:

```bash id="0h9wyc"
AWS Access Key
AWS Secret Key
Region: ap-south-1
Output format: json
```

---

## 🚀 Deployment Steps

Follow these steps to deploy the Application Load Balancer.

### Step 1: Update VPC and Subnet IDs

Edit `values.tf`:

Replace:

```bash id="rcr6zy"
vpc-xxxxxxxx
subnet-xxxxxxxx
subnet-yyyyyyyy
```

With actual IDs from:

```bash id="t40p33"
AWS Console → VPC
```

---

### Step 2: Initialize Terraform

```bash id="eh37bn"
terraform init
```

Downloads required provider plugins.

---

### Step 3: Validate Configuration

```bash id="ocpq8o"
terraform validate
```

Ensures syntax correctness.

---

### Step 4: Preview Execution Plan

```bash id="g4szod"
terraform plan
```

Displays resources Terraform will create.

---

### Step 5: Apply Configuration

```bash id="edq0h0"
terraform apply
```

Type:

```bash id="o4sjg1"
yes
```

when prompted.

Terraform will now create the ALB infrastructure.

---

## 📦 Verify ALB Creation

Open:

```bash id="c06e3n"
AWS Console → EC2 → Load Balancers
```

You should see:

```bash id="6j1nyh"
balaji-alb
```

---

## 📤 Terraform Outputs

Retrieve ALB DNS:

```bash id="r3dbxq"
terraform output alb_dns_name
```

Example:

```bash id="p0j8b0"
balaji-alb-123456789.ap-south-1.elb.amazonaws.com
```

Open in browser:

```bash id="rcf5t6"
http://<alb_dns_name>
```

---

## 🌐 Architecture Created

This configuration deploys:

* Application Load Balancer
* Security Group (HTTP access)
* Target Group
* Listener (port 80)
* Health check configuration

This architecture supports:

* EC2 Auto Scaling deployments
* ECS services
* EKS ingress routing
* High availability web applications

---

## 🧹 Destroy Resources (Cleanup)

To avoid AWS charges:

```bash id="l7t9q4"
terraform destroy
```

Type:

```bash id="7l9v3x"
yes
```

when prompted.

---

## 📘 Variables Used

| Variable            | Description         | Default             |
| ------------------- | ------------------- | ------------------- |
| aws_region          | AWS region          | ap-south-1          |
| alb_name            | ALB name            | balaji-alb          |
| alb_sg_name         | ALB security group  | balaji-alb-sg       |
| target_group_name   | Target group name   | balaji-target-group |
| vpc_id              | VPC ID              | user provided       |
| subnet_ids          | Public subnet IDs   | user provided       |
| allowed_cidr_blocks | Allowed access CIDR | 0.0.0.0/0           |
| environment         | Environment tag     | dev                 |

---

## 🎯 Learning Outcomes

By completing this project, you demonstrate:

* ALB provisioning using Terraform
* Target group configuration
* Listener configuration
* Health check setup
* Security group configuration for load balancer
* Infrastructure as Code best practices

---

## 👨‍💻 Author

Balaji B
DevOps Engineer 
AWS | Terraform | Docker | CI/CD | Kubernetes (Basics)

---

## ⭐ Future Improvements

Possible enhancements:

* Add HTTPS listener with ACM certificate
* Attach EC2 instances to target group
* Integrate with Auto Scaling Group
* Connect ECS service with ALB
* Configure path-based routing
* Add WAF integration
