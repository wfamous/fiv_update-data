# ===================================
# Author: @wfamous / famousinvogue.com
# Manage storages
# ===================================


# create buckets
resource "google_storage_bucket" "private_dataset_buckets" {
  count     = length(var.gcp_private_buckets)
  location  = var.gcp_buckets_location
  name      = var.gcp_private_buckets[count.index]

  labels   = {
    Name        = var.gcp_private_buckets[count.index]
    Environment = var.environment
  }
}

# create bucket object (folders)
resource "google_storage_bucket_object" "private_buckets_subfolders" {
  count     = length(var.gcp_private_bucket_subfolders)
  name      = "${var.gcp_private_bucket_subfolders[count.index]}/}"
  bucket    =  google_storage_bucket.private_dataset_buckets

  depends_on = [google_storage_bucket.private_dataset_buckets]
}