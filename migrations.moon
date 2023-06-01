import create_table, drop_table, types from require "lapis.db.schema"
import insert from require "lapis.db"
{
    =>
        drop_table "products"
        
        create_table "products", {
            {"id", types.serial}
            {"product_name", types.text}
            {"price", types.integer}
            {"category", types.text}
            
            "PRIMARY KEY (id)"
        }
        
        insert "products", {product_name: "pasztet", price: 10, category: "podroby"}
        insert "products", {product_name: "szynka", price: 23, category: "mieso"}

}
