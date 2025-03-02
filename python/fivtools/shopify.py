# ===================================
# Author: @wfamous / famousinvogue.com
# Shopify tools
# ===================================

import shopify
from python.fivtools.config import shop_url, shopify_api_token, shopify_api_key, s3

class MyShopify:

    def __init__(self, shopify_url: str, api_key: str, api_token: str):
        """
        Initialise a connection to a Shopify shop.
        :param shopify_url: (ex: 'my-cute-store-name.shopify.com')
        :param api_key: Shopify API key
        :param token: Shopify API token
        """
        self.shopify_url = shopify_url
        self.api_key = api_key
        self.api_token = api_token

        # constructed base url for connection
        base_url = f'https://{api_key}:{api_token}@{shopify_url}/admin'

        # connect to Shopify
        connection = shopify.ShopifyResource.set_site(base_url)
        shop = shopify.Shop.current()

        if shop and shop.name:
            print(f"Successfully connected to {shop.name} shop")
