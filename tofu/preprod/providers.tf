# ===================================
# Author: @wfamous / famousinvogue.com
# Providers script
# ===================================

terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.83.1"
    }
  }

  backend "s3" {
      bucket         = "tfstate-fiv-backend-${var.environment}"
      key            = "state/terraform.tfstate"
      region         = "eu-west-3"
  }
}

# === providers configs

provider "aws" {
  region  = var.aws_region
}

provider "google" {
      project     = var.gcp_project_id
      region      = var.gcp_region
}