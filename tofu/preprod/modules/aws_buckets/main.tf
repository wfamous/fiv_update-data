terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.81.0"
    }
  }
}
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

resource "aws_s3_object" "private_buckets_subfolders" {
  count  = length(var.aws_private_buckets_subfolders)
  bucket = aws_s3_bucket.private_content_buckets[0].id
  key    = "${var.aws_private_buckets_subfolders[count.index]}/readme.txt"

  tags   = {
    Name  = var.aws_private_buckets_subfolders[count.index]
    Environment = var.environment
  }
}
