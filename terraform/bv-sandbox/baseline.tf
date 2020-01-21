provider "aws" {
  version = "~> 2.40"

  region  = "us-east-1"
  profile = var.profile
}

terraform {
  required_version = ">= 0.12"
}

variable "managedby" {
  default = "terraform"
}

variable "profile" {
  default = "bv-sandbox"
}

variable "repo_name" {
  default = "validityhq/slate"
}
