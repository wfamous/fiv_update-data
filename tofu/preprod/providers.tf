# ===================================
# Author: @wfamous / famousinvogue.com
# Providers script
# ===================================

terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.81"
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
      project                     = var.gcp_project_id
      region                      = var.gcp_region
      credentials = file("../../external/sa-key.json")
      impersonate_service_account = "${var.gcp_sa_name}@${var.gcp_project_id}.${var.gcp_sa_host}" # for workload
}