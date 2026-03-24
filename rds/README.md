# Terraform RDS PostgreSQL Deployment (AWS)

This project provisions an Amazon RDS PostgreSQL instance using Terraform. It demonstrates Infrastructure as Code (IaC) best practices for deploying managed relational databases securely and efficiently in AWS.

This setup is suitable for DevOps learning, portfolio building, and interview preparation.

---

## 📌 Project Overview

This Terraform configuration:

* Creates a security group for database access
* Creates an RDS subnet group
* Deploys PostgreSQL RDS instance
* Configures database credentials
* Enables public accessibility (for learning/demo access)
* Outputs database endpoint and database name after deployment

Project structure:

```
main.tf
values.tf
README.md
```

---

## 🧱 Project Structure

```
terraform-rds-postgresql/
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

Follow these steps to create the RDS instance.

### Step 1: Update Subnet IDs

Edit `values.tf`:

Replace:

```
subnet-xxxxxxxx
subnet-yyyyyyyy
```

With your actual subnet IDs from AWS Console:

```
AWS Console → VPC → Subnets
```

---

### Step 2: Initialize Terraform

```
terraform init
```

Downloads required provider plugins.

---

### Step 3: Validate Configuration

```
terraform validate
```

Ensures configuration syntax correctness.

---

### Step 4: Preview Execution Plan

```
terraform plan
```

Displays resources Terraform will create.

---

### Step 5: Apply Configuration

```
terraform apply
```

Type:

```
yes
```

when prompted.

RDS instance creation typically takes **5–10 minutes**.

---

## 📦 Verify RDS Instance Creation

Open:

```
AWS Console → RDS → Databases
```

You should see:

```
balaji-rds-instance
```

---

## 📤 Terraform Outputs

Retrieve database endpoint:

```
terraform output rds_endpoint
```

Example:

```
balaji-rds-instance.xxxxxx.ap-south-1.rds.amazonaws.com:5432
```

Retrieve database name:

```
terraform output rds_db_name
```

---

## 🔗 Connect to PostgreSQL Database

Example connection command:

```
psql -h <endpoint> -U postgres -d balajidb
```

Example:

```
psql -h balaji-rds-instance.xxxxxx.ap-south-1.rds.amazonaws.com \
-U postgres \
-d balajidb
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

| Variable             | Description         | Default                 |
| -------------------- | ------------------- | ----------------------- |
| aws_region           | AWS region          | ap-south-1              |
| db_identifier        | RDS instance name   | balaji-rds-instance     |
| engine               | Database engine     | postgres                |
| engine_version       | PostgreSQL version  | 15                      |
| instance_class       | Instance type       | db.t3.micro             |
| allocated_storage    | Storage size        | 20 GB                   |
| db_name              | Initial DB name     | balajidb                |
| db_username          | DB username         | postgres                |
| db_password          | DB password         | ChangeMe123!            |
| parameter_group_name | Parameter group     | default.postgres15      |
| subnet_group_name    | Subnet group name   | balaji-rds-subnet-group |
| subnet_ids           | Subnet IDs list     | user provided           |
| sg_name              | Security group name | balaji-rds-sg           |
| db_port              | Database port       | 5432                    |
| allowed_cidr_blocks  | Allowed access CIDR | 0.0.0.0/0               |
| environment          | Environment tag     | dev                     |

---

## 🎯 Learning Outcomes

By completing this project, you demonstrate:

* RDS provisioning using Terraform
* PostgreSQL managed database deployment
* Security group configuration for DB access
* Subnet group configuration
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

* Store DB password securely in AWS Secrets Manager
* Enable Multi-AZ deployment
* Add automated backups configuration
* Enable storage autoscaling
* Deploy RDS inside private subnet
* Use Terraform remote backend (S3 + DynamoDB)
