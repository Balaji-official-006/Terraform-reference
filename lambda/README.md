# Terraform Lambda Function Deployment (AWS)

This project provisions an AWS Lambda function using Terraform. It demonstrates Infrastructure as Code (IaC) best practices for deploying serverless compute resources in AWS using reusable configuration files.

This setup is suitable for DevOps learning, portfolio building, and interview preparation.

---

## 📌 Project Overview

This Terraform configuration:

* Creates an IAM execution role for Lambda
* Attaches AWS Lambda basic execution policy
* Deploys a Lambda function using ZIP package
* Configures runtime and handler settings
* Applies tagging for resource management
* Outputs Lambda function name and ARN after deployment

Project structure:

```
main.tf
values.tf
README.md
lambda_function.zip
```

---

## 🧱 Project Structure

```
terraform-lambda-function/
│
├── main.tf
├── values.tf
├── lambda_function.zip
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

## 🧪 Sample Lambda Code (Python)

Create a file named:

```
lambda_function.py
```

Example content:

```python
def lambda_handler(event, context):
    return {
        "statusCode": 200,
        "body": "Hello from Terraform Lambda 🚀"
    }
```

Zip the file:

```
zip lambda_function.zip lambda_function.py
```

Place the ZIP inside the project folder.

---

## 🚀 Deployment Steps

Follow these steps to deploy the Lambda function.

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

Terraform will now create the Lambda function.

---

## 📦 Verify Lambda Deployment

Open:

```
AWS Console → Lambda → Functions
```

You should see:

```
balaji-terraform-lambda
```

---

## 📤 Terraform Outputs

Retrieve Lambda function name:

```
terraform output lambda_function_name
```

Retrieve Lambda ARN:

```
terraform output lambda_function_arn
```

---

## ▶️ Test Lambda Function

Go to:

```
AWS Console → Lambda → Test
```

Create a test event and execute the function.

Expected output:

```
Hello from Terraform Lambda 🚀
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

| Variable             | Description          | Default                        |
| -------------------- | -------------------- | ------------------------------ |
| aws_region           | AWS region           | ap-south-1                     |
| lambda_function_name | Lambda function name | balaji-terraform-lambda        |
| lambda_role_name     | IAM role name        | balaji-lambda-role             |
| runtime              | Lambda runtime       | python3.11                     |
| handler_name         | Handler function     | lambda_function.lambda_handler |
| filename             | Deployment ZIP file  | lambda_function.zip            |
| environment          | Environment tag      | dev                            |
| project_name         | Project tag          | terraform-lambda-project       |

---

## 🎯 Learning Outcomes

By completing this project, you demonstrate:

* Lambda deployment using Terraform
* IAM role configuration for serverless workloads
* ZIP-based Lambda packaging workflow
* Runtime and handler configuration
* Infrastructure as Code best practices

---

## 👨‍💻 Author

Balaji B
DevOps Engineer 
AWS | Terraform | Docker | CI/CD | Kubernetes (Basics)

---

## ⭐ Future Improvements

Possible enhancements:

* Add API Gateway trigger
* Add S3 trigger integration
* Deploy Lambda using container image (ECR)
* Add environment variables support
* Configure CloudWatch log retention
* Store Terraform state in S3 backend
