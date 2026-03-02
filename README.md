# 🚀 Terraform EKS Cluster with AWS Load Balancer Controller

This project provisions a **production-ready Amazon EKS cluster** using Terraform and deploys the **AWS Load Balancer Controller** to expose applications via Kubernetes Ingress.

---

## 📌 Overview

This setup includes:

* ✅ Amazon EKS cluster (Terraform)
* ✅ Managed Node Groups (EC2)
* ✅ Multi-AZ VPC with public & private subnets
* ✅ IAM Roles for Service Accounts (IRSA)
* ✅ AWS Load Balancer Controller (via Helm)
* ✅ Kubernetes Ingress support (ALB-based)

---

## 🏗️ Architecture

* EKS control plane managed by AWS
* Worker nodes deployed in private subnets
* NAT Gateway for outbound traffic
* Public subnets used for ALB
* IRSA used for secure IAM access from pods

---

## 📂 Project Structure

```
.
├── eks.tf          # EKS cluster configuration
├── vpc.tf          # VPC, subnets, networking
├── sg.tf           # Security groups
├── iam.tf          # IRSA role for ALB controller
├── alb.tf          # Helm deployment of ALB controller
├── providers.tf    # Kubernetes & Helm providers
├── variables.tf    # Input variables
├── outputs.tf      # Outputs
├── versions.tf     # Provider & backend config
```

---

## ⚙️ Prerequisites

Make sure you have:

* Terraform >= 1.5
* AWS CLI configured (`aws configure`)
* kubectl installed
* Helm installed
* IAM permissions to create EKS, VPC, IAM resources

---

## 🚀 Deployment Steps

### 1. Initialize Terraform

```bash
terraform init
```

### 2. Plan the deployment

```bash
terraform plan
```

### 3. Apply the infrastructure

```bash
terraform apply
```

---

## 🔐 Configure kubectl

```bash
aws eks update-kubeconfig \
  --region eu-central-1 \
  --name deno-cluster
```

---

## ✅ Verify Cluster

```bash
kubectl get nodes
```

---

## 🚀 Deploy Sample Application

```bash
kubectl apply -f hello-world.yaml
```

---

## 🌐 Access Application

```bash
kubectl get ingress
```

* Copy the **ALB DNS URL**
* Open it in browser

---

## 🔑 Key Concepts Used

### 1. Amazon EKS

* Managed Kubernetes service
* Multi-AZ control plane

### 2. IRSA (IAM Roles for Service Accounts)

* Secure AWS access for pods
* No static credentials

### 3. AWS Load Balancer Controller

* Watches Kubernetes Ingress
* Automatically provisions ALB

### 4. Terraform Modules

* `terraform-aws-modules/eks`
* `terraform-aws-modules/vpc`
* `terraform-aws-modules/iam`

---

## 🔄 How It Works

1. Terraform provisions VPC and EKS cluster
2. IRSA role is created for ALB controller
3. Helm installs AWS Load Balancer Controller
4. Kubernetes Ingress is deployed
5. Controller creates AWS ALB automatically
6. Traffic flows:

```
User → ALB → Target Group → Node → Pod
```

---

## ⚠️ Common Issues

* ❌ Cannot access cluster → Check endpoint access
* ❌ ALB not created → Check subnet tags
* ❌ Permission issues → Verify IRSA role
* ❌ Terraform errors → Import existing resources

---

## 🧹 Cleanup

```bash
terraform destroy
```

---

## 🧠 Learnings

This project demonstrates:

* Infrastructure as Code (Terraform)
* Kubernetes on AWS (EKS)
* Secure IAM integration (IRSA)
* Ingress-based traffic routing
* Real-world DevOps practices

---

## 📌 Future Improvements

* Add HTTPS (ACM + TLS)
* Use Karpenter instead of node groups
* Add monitoring (Prometheus + Grafana)
* GitOps (ArgoCD)

---

## 👨‍💻 Author

Bhavinkumar Prajapati
MSc Electrical Engineering & Information Technology

---

## ⭐ If you like this project

Give it a star ⭐ on GitHub!
