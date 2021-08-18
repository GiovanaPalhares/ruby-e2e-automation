require "httparty"

class Base_api
    include HTTParty
    base_uri "http://rocklov-api:3333"
end
