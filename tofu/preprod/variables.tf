# ===================================
# Author: @wfamous / famousinvogue.com
# Variables
# ===================================


# ====
# COMMON
# ====

# environment
variable "environment" {
  description = "Environment of deployment"
  type        = string
}



# ============
# PROVIDERS
# ===========

# === AWS
variable "aws_region"{
  description = "AWS Region"
  type        = string
}

variable "aws_private_buckets"{
  description = "List of private buckets"
  type        = list(string)
}

variable "private_buckets_subfolders"{
  description = "List of private buckets"
  type        = list(string)
}

# === GCP
variable "gcp_region"{
  description = "GCP Region"
  type        = string
}

variable "gcp_project_id"{
  description = "GCP project id"
  type        = string
}

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
  type        = string
}





