require_relative "base_service"

class Equipos_service < Base_service

    def create_equipo(equipo, user_id)
        return self.class.post(
            "/equipos",
            body: equipo,
            headers: {
                "user_id": user_id
            } 
        )
    end


end