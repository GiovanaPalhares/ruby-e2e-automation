require "httparty"

class Signup_sessions 
    include HTTParty
    base_uri "http://rocklov-api:3333"

    def sign_up(payload)
        return self.class.post(
            '/signup',
            body: payload.to_json,
            headers: {
                "Content-Type": "application/json"
            }
        ) 
    end

end