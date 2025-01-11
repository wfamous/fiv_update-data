#!/usr/bin/env python3

from dotenv import load_dotenv
import os
import binascii 

# load environment variables
load_dotenv()

# shopify set up

shop_url = os.getenv("SHOPIFY_SHOP_URL")
api_version  = os.getenv("SHOPIFY_VERSION")
shopify_api_key = os.getenv("SHOPIFY_API_KEY")
shopify_name = os.getenv("SHOPIFY_NAME")
shopify_api_secret = os.getenv("SHOPIFY_API_SECRET")
shopify_api_token = os.getenv("SHOPIFY_API_TOKEN")
api_version  = os.getenv("SHOPIFY_VERSION")