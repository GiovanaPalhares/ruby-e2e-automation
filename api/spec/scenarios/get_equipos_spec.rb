describe "get_equipo" do 

    before(:all) do 
        login_payload = { email: "giovana@hotmail.com", password: "123456" }
        login = Sessions.new.login(login_payload)
        @user_id = login.parsed_response["_id"]  
    end

    def get_name()
        thumbnail = Helpers::get_thumb("slash.jpg") #implementado no helpers a busca pelo arquivo de imagem
        payload = { thumbnail: thumbnail, name: "Microfone", category: "Cordas", price: 100 }
        Mongodb.new.remove_equipo(payload[:name], @user_id)
        Post_equipo.new.post_equipo(payload, @user_id)
        return payload[:name]
    end

    context "obter equipos de usuário" do
        before(:all) do 
            @get_equipo = Get_equipo.new.get_equipos(get_name(), @user_id)
        end

        it "deve retornar 200" do 
            expect(@get_equipo.code).to eql 200
        end 
    end

end