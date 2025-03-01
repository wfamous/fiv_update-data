# ===================================
# Author: @wfamous / famousinvogue.com
# Manage storages
# ===================================


# create bucket for dataset
resource "google_storage_bucket" "private_dataset_buckets" {
  count     = length(var.gcp_private_buckets)
  location  = var.gcp_buckets_location
  name      = var.gcp_private_buckets[count.index]

  labels   = {
    name = var.gcp_private_buckets[count.index]
    env  = var.environment
  }
}

# create bucket object (folders)
resource "google_storage_bucket_object" "private_buckets_subfolders" {
  count     = length(var.gcp_private_bucket_subfolders)
  name      = "${var.gcp_private_bucket_subfolders[count.index]}/readme.txt"
  content = " "
  bucket    =  google_storage_bucket.private_dataset_buckets[0].name

  depends_on = [google_storage_bucket.private_dataset_buckets]
}