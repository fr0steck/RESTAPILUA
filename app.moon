lapis = require "lapis"

import Model from require "lapis.db.model"
import respond_to from require "lapis.application"
import json_params from require "lapis.application"
import OrderedPaginator from require "lapis.db.pagination"

class Products extends Model

class extends lapis.Application

  "/products": respond_to {
        GET: =>
            product = Products\select!
            json: product
        POST: json_params =>
            product = Products\create product_name: @params.product_name, price: @params.price, category: @params.category
            json: product
  }
  
  "/products/:index": respond_to {
        GET: =>
            product = Products\find id: @params.index
            json: product  
        PUT: json_params =>
            product = Products\find id: @params.index
            product.product_name = @params.product_name
            product.price = @params.price
            product.category = @params.category
            Product\update "product_name"
            json: product
        DELETE: =>
            product = Products\find id: @params.index
            product\delete!
            "Deleted product: #{product.product_name}"
    }
    
  "/products_category/:category": respond_to {
        GET: =>
            products = Products\select "where category = ? limit 10", @params.category
            json: products
    }   
    
  "/products_create": =>
    product = Products\create product_name: @params.product_name, price: @params.price, category: @params.category
    json: product
    
  "/products_get": =>
    product = Products\find id: @params.id
    json: product
    
  "/products_update": =>
    product = Products\find id: @params.id
    product.product_name = @params.product_name
    product.price = @params.price
    product.category = @params.category
    product\update "product_name"
    json: product
    
  "/products_delete": =>
    product = Products\find id: @params.id
    product\delete!
    "Deleted product: #{product.product_name}"
    
  "/products_get_all": =>
    products = Products\select!
    json: products
