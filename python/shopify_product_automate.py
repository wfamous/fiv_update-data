#!/usr/bin/env python3

#######
# Automation for Shopify product listing
#######

import os
import shopify
from config import shop_url, shopify_api_token, shopify_api_key, s3 

# main function (prod)
#def lambda_handler(event, context):

# main function (locale)
if __name__ == "__main__":
    print(f"hello")
    
    # set up shopify store data to access api
    fiv_shop_url = f'https://{shopify_api_key}:{shopify_api_token}@{shop_url}/admin'
    shopify.ShopifyResource.set_site(fiv_shop_url)

    # API calls
    products = shopify.Product.find()

    # shopify products
    for product in products:
        print('Product name:', product.title)

    # s3 buckets 
    for bucket in s3.buckets.all():
        print('Bucket name:', bucket.name)