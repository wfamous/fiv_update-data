#!/usr/bin/env python3

from dotenv import load_dotenv
import os
import boto3

# load environment variables
load_dotenv()

# shopify setup
shop_url = os.getenv("SHOPIFY_SHOP_URL")
shopify_name = os.getenv("SHOPIFY_NAME")
shopify_api_version  = os.getenv("SHOPIFY_VERSION")
shopify_api_key = os.getenv("SHOPIFY_API_KEY")
shopify_api_secret = os.getenv("SHOPIFY_API_SECRET")
shopify_api_token = os.getenv("SHOPIFY_API_TOKEN")

# aws setup
aws_access_key_id = os.getenv("AWS_ACCESS_KEY_ID")
aws_secret_access_key = os.getenv("AWS_SECRET_ACCESS_KEY")
s3 = boto3.resource('s3')