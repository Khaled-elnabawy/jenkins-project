#  ============================================================================
# PROJECT CONFIGURATION
# ============================================================================
project_name = "my-eks-project"
environment  = "dev"
aws_region   = "us-east-1"

# ============================================================================
# VPC CONFIGURATION
# ============================================================================
vpc_cidr             = "10.0.0.0/16"
availability_zones   = ["us-east-1a", "us-east-1b"]
public_subnet_cidrs  = ["10.0.1.0/24", "10.0.2.0/24"]
private_subnet_cidrs = ["10.0.11.0/24", "10.0.12.0/24"]
enable_nat_gateway   = true
single_nat_gateway   = false
enable_dns_hostnames = true
enable_dns_support   = true

# ============================================================================
# EKS CONFIGURATION
# ============================================================================
cluster_version           = "1.30"

# 👉 أهم قيم لضمان تشغيل ArgoCD بدون Pending
node_group_desired_size   = 2
node_group_min_size       = 1
node_group_max_size       = 4

# ❗ تم تعديل النوع فقط — باقي القيم كما هي
node_instance_types       = ["t3.medium"]   # كان t2.micro وتم تغييره للحد الأدنى القابل للتشغيل
node_disk_size            = 20

enable_cluster_encryption = true
cluster_log_types         = ["api", "audit", "authenticator", "controllerManager", "scheduler"]

# ============================================================================
# SECURITY CONFIGURATION
# ============================================================================
allowed_ssh_ips = ["0.0.0.0/0"]  # كما هو

# ============================================================================
# IAM ACCESS CONFIGURATION
# ============================================================================
additional_iam_users = [
  {
    userarn  = "arn:aws:iam::742674388365:user/cli-user"
    username = "cli-user"
    groups   = ["system:masters"]
  }
]

additional_iam_roles = [
  # لم يتم تعديل أي شيء هنا
]

# ============================================================================
# TAGS
# ============================================================================
tags = {
  Project     = "EKS-Infrastructure"
  Environment = "dev"
  ManagedBy   = "Terraform"
  Owner       = "DevOps-Team"
}
