#!/usr/bin/env python3

#######
# Automation for Shopify product listing
#######
import sys
import os

from fivtools import MyShopify
from fivtools.config import shopify_api_key, shopify_api_token, shop_url

# main function (locale)
if __name__ == "__main__":
    print(f"hello")

    shop = MyShopify(shop_url, shopify_api_key, shopify_api_token)
    products = shop.get_products()
    print('end')