# ===================================
# Author: @wfamous / famousinvogue.com
# Main script to manage infrastructure that will update our website data
# ===================================

# Terraform initial config
terraform {
  required_providers {

    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.83.1"
    }
  }

  backend "s3" {
    bucket   = "tfstate-fiv-backend"
    key      = "state/terraform.tfstate"
    region   = "eu-west-3"
  }
}


# AWS config
provider "aws" {
  region  = var.aws_region
}

