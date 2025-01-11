#!/usr/bin/env python3

#######
# Automation for Shopify product listing
#######

import os
import shopify
from config import shop_url, shopify_api_token, shopify_api_key 


# main function (prod)
#def lambda_handler(event, context):

# main function (locale)
if __name__ == "__main__":
    print(f"hello")

    # set up shopify store data to access api
    shop_url = f'https://{shopify_api_key}:{shopify_api_token}@{shop_url}/admin'
    shopify.ShopifyResource.set_site(shop_url)

    # API calls
    products = shopify.Product.find()

    # products
    for product in products:
        print(f'Product name:', product.title)

    print(f'shop:', product.title)
