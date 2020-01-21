terraform {
  backend "s3" {
    bucket         = "bv-terraform-state-dev"
    dynamodb_table = "terraform-state-lock"
    encrypt        = true
    key            = "bv-sandbox/slate/terraform.tfstate"
    profile        = "bv-sandbox"
    region         = "us-east-1"
  }
}

