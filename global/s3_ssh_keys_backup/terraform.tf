terraform {
  backend "s3" {
    bucket         = "tf-state-ujstor-cluster"
    key            = "global/s3_ssh_keys_backup/terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "terraform-state-locks-cluster"
    encrypt        = true
  }
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.50"
    }
  }
  required_version = ">= 1.0.0, < 2.0.0"
}

provider "aws" {
  region = "us-east-1"
}
