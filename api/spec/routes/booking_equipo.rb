require_relative "base_api"

class Booking < Base_api
    def booking(equipo_id, user_id)
        return self.class.post(
            "/equipos/#{equipo_id}/bookings",
            body: {
                "date": Time.now.strftime("%m/%d/%Y")
            }.to_json,
            headers: {
                "user_id": user_id
            }
        ) 
    end
end
