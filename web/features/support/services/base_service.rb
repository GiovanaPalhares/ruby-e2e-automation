require "httparty"

class Base_service
    include HTTParty
    base_uri "http://rocklov-api:3333"
end

