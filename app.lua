local lapis = require("lapis")
local Model
Model = require("lapis.db.model").Model
local respond_to
respond_to = require("lapis.application").respond_to
local json_params
json_params = require("lapis.application").json_params
local OrderedPaginator
OrderedPaginator = require("lapis.db.pagination").OrderedPaginator
local Products
do
  local _class_0
  local _parent_0 = Model
  local _base_0 = { }
  _base_0.__index = _base_0
  setmetatable(_base_0, _parent_0.__base)
  _class_0 = setmetatable({
    __init = function(self, ...)
      return _class_0.__parent.__init(self, ...)
    end,
    __base = _base_0,
    __name = "Products",
    __parent = _parent_0
  }, {
    __index = function(cls, name)
      local val = rawget(_base_0, name)
      if val == nil then
        local parent = rawget(cls, "__parent")
        if parent then
          return parent[name]
        end
      else
        return val
      end
    end,
    __call = function(cls, ...)
      local _self_0 = setmetatable({}, _base_0)
      cls.__init(_self_0, ...)
      return _self_0
    end
  })
  _base_0.__class = _class_0
  if _parent_0.__inherited then
    _parent_0.__inherited(_parent_0, _class_0)
  end
  Products = _class_0
end
do
  local _class_0
  local _parent_0 = lapis.Application
  local _base_0 = {
    ["/products"] = respond_to({
      GET = function(self)
        local product = Products:select()
        return {
          json = product
        }
      end,
      POST = json_params(function(self)
        local product = Products:create({
          product_name = self.params.product_name,
          price = self.params.price,
          category = self.params.category
        })
        return {
          json = product
        }
      end)
    }),
    ["/products/:index"] = respond_to({
      GET = function(self)
        local product = Products:find({
          id = self.params.index
        })
        return {
          json = product
        }
      end,
      PUT = json_params(function(self)
        local product = Products:find({
          id = self.params.index
        })
        product.product_name = self.params.product_name
        product.price = self.params.price
        product.category = self.params.category
        Product:update("product_name")
        return {
          json = product
        }
      end),
      DELETE = function(self)
        local product = Products:find({
          id = self.params.index
        })
        product:delete()
        return "Deleted product: " .. tostring(product.product_name)
      end
    }),
    ["/products_category/:category"] = respond_to({
      GET = function(self)
        local products = Products:select("where category = ? limit 10", self.params.category)
        return {
          json = products
        }
      end
    }),
    ["/products_create"] = function(self)
      local product = Products:create({
        product_name = self.params.product_name,
        price = self.params.price,
        category = self.params.category
      })
      return {
        json = product
      }
    end,
    ["/products_get"] = function(self)
      local product = Products:find({
        id = self.params.id
      })
      return {
        json = product
      }
    end,
    ["/products_update"] = function(self)
      local product = Products:find({
        id = self.params.id
      })
      product.product_name = self.params.product_name
      product.price = self.params.price
      product.category = self.params.category
      product:update("product_name")
      return {
        json = product
      }
    end,
    ["/products_delete"] = function(self)
      local product = Products:find({
        id = self.params.id
      })
      product:delete()
      return "Deleted product: " .. tostring(product.product_name)
    end,
    ["/products_get_all"] = function(self)
      local products = Products:select()
      return {
        json = products
      }
    end
  }
  _base_0.__index = _base_0
  setmetatable(_base_0, _parent_0.__base)
  _class_0 = setmetatable({
    __init = function(self, ...)
      return _class_0.__parent.__init(self, ...)
    end,
    __base = _base_0,
    __name = nil,
    __parent = _parent_0
  }, {
    __index = function(cls, name)
      local val = rawget(_base_0, name)
      if val == nil then
        local parent = rawget(cls, "__parent")
        if parent then
          return parent[name]
        end
      else
        return val
      end
    end,
    __call = function(cls, ...)
      local _self_0 = setmetatable({}, _base_0)
      cls.__init(_self_0, ...)
      return _self_0
    end
  })
  _base_0.__class = _class_0
  if _parent_0.__inherited then
    _parent_0.__inherited(_parent_0, _class_0)
  end
  return _class_0
end
