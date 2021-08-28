require_relative "base_api"

class Post_equipo < Base_api

    def post_equipo(payload, user_id)
        return self.class.post(
            '/equipos',
            body: payload,
            headers: {
                "user_id": user_id
            }
        ) 
    end
    
end