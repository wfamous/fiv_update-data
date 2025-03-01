# ===================================
# Author: @wfamous, @aglorhythm / famousinvogue.com
# Main script to manage infrastructure that will update our website data
# ===================================


# ===================================
#  Storages creation
# ===================================

module "aws_buckets" {
  source                          = "./modules/aws_buckets"
  environment                     = var.environment
  aws_private_buckets             = var.aws_private_buckets
  aws_private_buckets_subfolders  = var.aws_private_buckets_subfolders

}

module "gcp_buckets" {
  source                          = "./modules/gcp_buckets"
  environment                     = var.environment
  gcp_buckets_location            = var.gcp_buckets_location
  gcp_private_buckets             = var.gcp_private_buckets
  gcp_private_bucket_subfolders   = var.gcp_private_bucket_subfolders
}