terraform {
  backend "s3" {
    bucket       = "bucket-4429 "
    key          = "eks/terraform.tfstate"
    region       = "us-east-1"
    encrypt      = true
    use_lockfile = true
  }
}

