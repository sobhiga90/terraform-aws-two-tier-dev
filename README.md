# Terraform AWS Two-Tier DEV Infrastructure

## Project Overview

This project provisions a complete AWS two-tier application infrastructure using Terraform.

The infrastructure includes:

* Custom VPC
* Public and Private Subnets
* Internet Gateway
* Route Tables
* Security Groups
* EC2 Instance (Application Tier)
* Amazon RDS MySQL (Database Tier)
* S3 Remote Backend for Terraform State
* GitHub Actions CI/CD Pipeline

---

## Architecture

```text
Internet
    |
    v
Internet Gateway
    |
Public Subnet
    |
EC2 Instance (Apache Web Server)
    |
Security Group
    |
Private Subnets
    |
Amazon RDS MySQL
```

---

## Project Structure

```text
terraform-aws-two-tier-dev/
│
├── bootstrap-backend/
│   └── main.tf
│
├── .github/
│   └── workflows/
│       └── terraform.yml
│
├── backend.tf
├── providers.tf
├── variables.tf
├── main.tf
├── outputs.tf
├── terraform.tfvars
├── user-data.sh
│
└── modules/
    ├── vpc/
    ├── security-group/
    ├── ec2/
    └── rds/
```

---

## Prerequisites

Before starting, install:

* Terraform
* AWS CLI
* Git
* Git Bash or Linux Terminal
* AWS Account

Verify installation:

```bash
terraform -version
aws --version
git --version
```

---

## Step 1: Clone Repository

```bash
git clone https://github.com/sobhiga90/terraform-aws-two-tier-dev.git

cd terraform-aws-two-tier-dev
```

---

## Step 2: Configure AWS Credentials

```bash
aws configure
```

Provide:

```text
AWS Access Key ID
AWS Secret Access Key
Region: ap-south-1
Output format: json
```

---

## Step 3: Create Terraform Backend

Navigate to backend bootstrap directory:

```bash
cd bootstrap-backend
```

Initialize Terraform:

```bash
terraform init
```

Apply configuration:

```bash
terraform apply
```

Terraform creates:

* S3 Bucket
* Versioning
* Server-side Encryption

Copy the generated bucket name.

---

## Step 4: Configure Backend

Update:

```hcl
backend.tf
```

Example:

```hcl
terraform {
  backend "s3" {
    bucket = "your-generated-bucket-name"
    key    = "dev/terraform.tfstate"
    region = "ap-south-1"
  }
}
```

Reinitialize:

```bash
terraform init -reconfigure
```

---

## Step 5: Review Configuration

Format Terraform files:

```bash
terraform fmt -recursive
```

Validate configuration:

```bash
terraform validate
```

---

## Step 6: Preview Infrastructure

```bash
terraform plan
```

Review resources before deployment.

---

## Step 7: Deploy Infrastructure

```bash
terraform apply
```

Confirm:

```text
yes
```

Terraform provisions:

* VPC
* Subnets
* Route Tables
* Internet Gateway
* Security Groups
* EC2 Instance
* RDS Database

---

## Step 8: Verify EC2 Web Server

Get public IP:

```bash
terraform output
```

Open:

```text
http://<public-ip>
```

Expected output:

```html
Terraform Two Tier App - DEV
```

---

## Step 9: GitHub Actions CI/CD

Workflow file:

```text
.github/workflows/terraform.yml
```

GitHub Actions automatically runs:

* terraform fmt
* terraform validate
* terraform plan

on every push to main branch.

### Required GitHub Secrets

Repository Settings → Secrets and Variables → Actions

Add:

```text
AWS_ACCESS_KEY_ID
AWS_SECRET_ACCESS_KEY
```

---

## Terraform Commands

Initialize:

```bash
terraform init
```

Validate:

```bash
terraform validate
```

Format:

```bash
terraform fmt -recursive
```

Plan:

```bash
terraform plan
```

Apply:

```bash
terraform apply
```

Destroy:

```bash
terraform destroy
```

---

## Security Notes

For production use:

* Store database passwords in AWS Secrets Manager
* Restrict SSH access to trusted IPs
* Use HTTPS
* Enable RDS encryption
* Use IAM Roles instead of long-term credentials

---

## Author

Sobhiga

GitHub:
https://github.com/sobhiga90

```
```
