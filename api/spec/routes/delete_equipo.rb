require_relative "base_api"

class Delete_equipo < Base_api 

    def delete_equipo(equipo_id, user_id) 
        self.class.delete(
            "/equipos/#{equipo_id}",
            headers: {
                "user_id": user_id
            }
        )
    end

end