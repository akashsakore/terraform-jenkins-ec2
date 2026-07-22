terraform {
  backend "s3" {
    bucket         = "akash-terraform-state-2026-8173"
    key            = "dev/terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "terraform-lock-table"
    encrypt        = true
  }
}
