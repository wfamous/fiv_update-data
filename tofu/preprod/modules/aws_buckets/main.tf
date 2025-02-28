# ===================================
# Author: @wfamous / famousinvogue.com
# Manage storages
# ===================================


# create buckets
resource "aws_s3_bucket" "private_content_buckets" {
  count  = length(var.aws_private_buckets)
  bucket = var.aws_private_buckets[count.index]

  tags   = {
    Name  = var.aws_private_buckets[count.index]
    Environment = var.environment
  }
}

# can't create empty folder on aws

