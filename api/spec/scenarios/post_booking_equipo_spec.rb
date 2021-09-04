describe "/equipos/{equipo_id}/bookings" do

    before(:all) do
        cliente_login_payload = { email: "giovana10@hotmail.com", password: "123456" }
        cliente_login = Sessions.new.login(cliente_login_payload)
        @cliente_user_id = cliente_login.parsed_response["_id"]
    end

    context "booking equipo" do
        before(:all) do 
            anunciante_login_payload = { email: "giovana@hotmail.com", password: "123456" }
            anunciante_login = Sessions.new.login(anunciante_login_payload)
            anunciante_user_id = anunciante_login.parsed_response["_id"]
    
            thumbnail = Helpers::get_thumb("slash.jpg")
            payload = { thumbnail: thumbnail, name: "Guitarra", category: "Cordas", price: 100 }
            Mongodb.new.remove_equipo(payload[:name], anunciante_user_id)
            post_equipo = Post_equipo.new.post_equipo(payload, anunciante_user_id)

            @equipo_id = post_equipo.parsed_response["_id"]

            @response = Booking.new.booking(@equipo_id, @cliente_user_id)

        end

        it "deve retornar 200" do
            expect(@response.code).to eql 200
        end
    end

end