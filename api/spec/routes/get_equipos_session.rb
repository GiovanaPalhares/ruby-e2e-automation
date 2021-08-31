require_relative "base_api"

class Get_equipo < Base_api

    def get_equipos(equipo_name, user_id)
        return self.class.get(
            '/equipos',
            query: equipo_name,
            headers: {
                "user_id": user_id
            }
        ) 
    end
    
end