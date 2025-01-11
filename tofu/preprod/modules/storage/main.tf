# ===================================
# Author: @wfamous / famousinvogue.com
# Manage storages
# ===================================


# create buckets
resource "aws_s3_bucket" "private_buckets" {
  count  = length(var.private_buckets) 
  bucket = "${var.private_buckets[count.index]}-${var.environment}"

  tags   = {
    Name  = "${var.private_buckets[count.index]}-${var.environment}"
  }
}


