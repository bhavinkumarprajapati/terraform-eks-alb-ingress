
terraform {
  # ⚠️ NOTE:
  # This project uses an S3 backend for remote state.
  # Before running `terraform init`, you must:
  # 1. Create an S3 bucket
  # 2. (Optional) Create a DynamoDB table for state locking
  # 3. Update bucket name, key, and region accordingly
  backend "s3" {
    bucket       = "bhpr-test-terraform-state"
    key          = "dev/terraform.tfstate"
    region       = "eu-central-1"
    encrypt      = true
    use_lockfile = true
  }

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.40"
    }
  }
}
