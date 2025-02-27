# ===================================
# Author: @wfamous, @aglorhythm / famousinvogue.com
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
      bucket         = "tfstate-fiv-backend-${var.environment}"
      key            = "state/terraform.tfstate"
      region         = "eu-west-3"
  }
}

# ===================================
#  Storages creation
# ===================================

module "aws_buckets" {
  source          = "modules/aws_buckets"
  private_buckets = var.private_buckets
  environment     = var.environment
}

module "gcp_buckets" {
  source          = "modules/gcp_buckets"
  private_buckets = var.private_buckets
  gcp_region      = var.gcp_region
  gcp_project_id =  var.gcp_project_id
  environment     = var.environment
}