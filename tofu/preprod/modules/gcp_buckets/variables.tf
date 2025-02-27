# ===================================
# Author: @wfamous / famousinvogue.com
# Variables
# ===================================


# environment
variable "environment" {
  description = "Environment of deployment"
  type        = string
}

# buckets
variable "gcp_private_buckets"{
  description = "List of private buckets"
  type        = list(string)
}

variable "gcp_private_bucket_subfolders"{
  description = "List of private buckets"
  type        = list(string)
}

variable "gcp_buckets_location"{
  description = "Region of GCP buckets"
  type        = "string"
}