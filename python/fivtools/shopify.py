# ===================================
# Author: @wfamous / famousinvogue.com
# Shopify tools
# Docs : https://shopify.dev/docs/api/admin-rest
# ===================================

import shopify
from python.fivtools.config import shop_url, shopify_api_token, shopify_api_key, s3

class MyShopify:

    def __init__(self, shopify_url: str, api_key: str, api_token: str):
        """
        Initialise a connection to a Shopify shop.
        :param shopify_url: (ex: 'my-cute-store-name.shopify.com')
        :param api_key: Shopify API key
        :param api_token: Shopify API token
        """
        self.shopify_url = shopify_url
        self.api_key = api_key
        self.api_token = api_token

        # constructed base url for connection
        base_url = f'https://{api_key}:{api_token}@{shopify_url}/admin'

        # connect to Shopify
        shopify.ShopifyResource.set_site(base_url)

        try:
            shop = shopify.Shop.current()
            print(f"Successfully connected to {shop.name} shop")
        except Exception as e:
            print(f"Connection to shop failed {e}")


    def get_products(self):
        products_list = shopify.Product.find(limit=250) # if more products, needs pagination handling
        products_all = []

        for product in products_list:
            products_all.append({
                "id": getattr(product, "id"),
                "name": getattr(product, "title"),
                "created_at": getattr(product, "created_at"),
                "updated_at": getattr(product, "updated_at"),
                "description": getattr(product, "body_html"),
                "product_type": getattr(product, "product_type"),
                "status": getattr(product, "status")
            })
        return products_all
