# 🚀 Deploy AWS EC2 Instance Using Terraform & GitHub Actions

This project demonstrates how to deploy AWS infrastructure using **Terraform** in combination with **GitHub Actions** for CI/CD automation.
Each push to the `main` branch triggers a workflow that runs:

* `terraform init`
* `terraform fmt`
* `terraform validate`
* `terraform plan`
* `terraform apply`

The workflow automatically provisions an **EC2 instance** on AWS.

---

## 📌 Features

* Infrastructure-as-Code using **Terraform**
* CI/CD pipeline using **GitHub Actions**
* Automatic provisioning of **AWS EC2 instance**
* Uses GitHub Secrets for secure AWS authentication
* Clean, minimal, beginner-friendly setup

---

## 📁 Project Structure

```
infra-github-actions/
│
├── .github/
│   └── workflows/
│       └── terraform.yml         # GitHub Actions workflow
│
├── provider.tf                   # AWS provider config
├── main.tf                       # EC2 instance resource
├── variables.tf                  # Terraform variables
├── outputs.tf                    # Terraform outputs
└── README.md                     # Project documentation
```

---

## 🧩 Terraform Configuration

### **main.tf**

Creates an EC2 instance:

```hcl
resource "aws_instance" "my_ec2" {
  ami           = "ami-0c02fb55956c7d316" # Ubuntu 22.04 AMI (update per region)
  instance_type = var.instance_type

  tags = {
    Name = "GitHubActions-EC2"
  }
}
```

---

## 🔐 GitHub Secrets Required

Go to:
**GitHub → Repository → Settings → Secrets → Actions**

Create the following secrets:

| Secret Name      | Description           |
| ---------------- | --------------------- |
| `AWS_ACCESS_KEY` | IAM user's access key |
| `AWS_SECRET_KEY` | IAM user's secret key |

IAM User Policy Requirements:

* `AmazonEC2FullAccess`
* `AmazonVPCFullAccess`
* `IAMFullAccess` (optional, only needed if creating IAM resources)

---

## ⚙️ GitHub Actions Workflow

Located at:

```
.github/workflows/terraform.yml
```

### Contents:

```yaml
name: Terraform Deploy

on:
  push:
    branches:
      - main

jobs:
  terraform:
    name: Deploy Infra
    runs-on: ubuntu-latest

    steps:
      - name: Checkout repository
        uses: actions/checkout@v3

      - name: Setup Terraform
        uses: hashicorp/setup-terraform@v2

      - name: Configure AWS Credentials
        uses: aws-actions/configure-aws-credentials@v2
        with:
          aws-access-key-id: ${{ secrets.AWS_ACCESS_KEY }}
          aws-secret-access-key: ${{ secrets.AWS_SECRET_KEY }}
          aws-region: ap-south-1

      - name: Terraform Init
        run: terraform init

      - name: Terraform Format Check
        run: terraform fmt -check

      - name: Terraform Validate
        run: terraform validate

      - name: Terraform Plan
        run: terraform plan

      - name: Terraform Apply
        run: terraform apply -auto-approve
```

---

## 🚀 How to Use

### **1️⃣ Clone the repository**

```
git clone <repo-url>
cd infra-github-actions
```

### **2️⃣ Initialize Terraform locally (optional)**

```
terraform init
terraform validate
```

### **3️⃣ Push to GitHub**

```
git add .
git commit -m "Setup infra deployment pipeline"
git push origin main
```

### **4️⃣ GitHub Actions will:**

* Authenticate to AWS
* Initialize Terraform
* Validate & Plan
* Deploy infrastructure automatically

---

## 🎉 Output

After deployment, Terraform prints:

* EC2 Public IP
* EC2 Instance ID

You can view it in:

* **GitHub Actions Logs**
* **Terraform Output** section

---

## 🛠️ Future Enhancements

You can extend this project to deploy:

* VPC + Subnets + NAT + Internet Gateway
* ALB + Auto Scaling Group
* EKS Cluster deployment
* Lambda + API Gateway
* S3 + CloudFront serverless website
* Slack notifications
* Multi-environment setup (dev/stage/prod)

---

## 💡 Need Help Expanding This?

I can help you create:

* A full DevOps pipeline
* Production-grade infrastructure
* Helm + EKS deployments
* Monitoring + alerting
* Logging + cost-optimization

