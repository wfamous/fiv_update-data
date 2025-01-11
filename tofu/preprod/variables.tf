# ===================================
# Author: @wfamous / famousinvogue.com
# Variables
# ===================================

# environment
variable "environment" {
  description = "Environment of deployment"
  type        = string
}

# environment
variable "aws_region"{
  description = "AWS Region"
  type        = string
}

# buckets
variable "private_buckets"{
  description = "List of private buckets"
  type        = list(string)
}



