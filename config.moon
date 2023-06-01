import config from require "lapis.config"

config "moonrest", ->
    num_workers 8
    code_cache "on"
    
config "moonrest", ->
    postgres ->
        host "127.0.0.1"
        user "postgres"
        password "postgres"
        database "postgres"
    num_workers 1
    code_cache "off"
    postgresql_url "postgres://postgres:postgres@127.0.0.1/postgres"
