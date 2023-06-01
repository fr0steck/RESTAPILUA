local create_table, drop_table, types
do
  local _obj_0 = require("lapis.db.schema")
  create_table, drop_table, types = _obj_0.create_table, _obj_0.drop_table, _obj_0.types
end
local insert
insert = require("lapis.db").insert
return {
  function(self)
    drop_table("products")
    create_table("products", {
      {
        "id",
        types.serial
      },
      {
        "product_name",
        types.text
      },
      {
        "price",
        types.integer
      },
      {
        "category",
        types.text
      },
      "PRIMARY KEY (id)"
    })
    insert("products", {
      product_name = "pasztet",
      price = 10,
      category = "podroby"
    })
    return insert("products", {
      product_name = "szynka",
      price = 23,
      category = "mieso"
    })
  end
}
