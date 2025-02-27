# ===================================
# Author: @wfamous, @aglorhythm / famousinvogue.com
# Backend script
# ===================================

# Terraform initial config
terraform {
  backend "gcs" {
    bucket  = "tfstate-fiv-backend-${var.environment}"
    prefix  = "terraform/state"
  }
}