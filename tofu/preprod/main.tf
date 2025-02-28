# ===================================
# Author: @wfamous, @aglorhythm / famousinvogue.com
# Main script to manage infrastructure that will update our website data
# ===================================


# ===================================
#  Storages creation
# ===================================

module "aws_buckets" {
  source          = "./modules/aws_buckets"
  private_buckets = var.aws_private_buckets
  environment     = var.environment
}

module "gcp_buckets" {
  source          = "./modules/gcp_buckets"
  private_buckets = var.aws_private_buckets
  gcp_region      = var.gcp_region
  gcp_project_id =  var.gcp_project_id
  environment     = var.environment
}