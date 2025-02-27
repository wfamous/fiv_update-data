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

    google = {
      source  = "hashicorp/google"
      version = "~> 6.23.0"
    }
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