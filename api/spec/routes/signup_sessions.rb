require_relative "base_api"

class Signup_sessions < Base_api

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