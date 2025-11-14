terraform {
  backend "s3" {
    bucket       = "jenkins-s3-4429"
    key          = "eks/terraform.tfstate"
    region       = "eu-east-1"
    encrypt      = true
    use_lockfile = true
  }
}

