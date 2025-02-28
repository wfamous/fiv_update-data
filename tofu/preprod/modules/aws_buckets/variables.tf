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
variable "aws_private_buckets"{
  description = "List of private buckets"
  type        = list(string)
}

variable "aws_private_buckets_subfolders"{
  description = "List of private buckets"
  type        = list(string)
}