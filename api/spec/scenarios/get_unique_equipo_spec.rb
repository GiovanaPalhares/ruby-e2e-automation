describe "get unique equipo" do 

    before(:all) do 
        login_payload = { email: "giovana@hotmail.com", password: "123456" }
        login = Sessions.new.login(login_payload)
        @user_id = login.parsed_response["_id"]  
        puts @user_id
    end

    context "obter equipamento pelo id" do 

        before(:all) do 
            thumbnail = Helpers::get_thumb("sanfona.jpg")
            @payload = { thumbnail: thumbnail, name: "Sanfona", category: "Cordas", price: 100 }
            Mongodb.new.remove_equipo(@payload[:name], @user_id)

            post_equipo = Post_equipo.new.post_equipo(@payload, @user_id)
            equipo_id = post_equipo.parsed_response["_id"]
            @response = Get_equipo.new.get_unique_equipo(equipo_id, @user_id)
        end

        it "deve retornar 200" do
            expect(@response.code).to eql 200
        end
    
        it "validar nome do equipo" do
            expect(@response.parsed_response).to include("name" => @payload[:name])      
        end
    end

    context "equipo_id invalido" do 
        before(:all) do 
            @response = Get_equipo.new.get_unique_equipo(Mongodb.new.cria_equipo_id, @user_id)
        end

        it "deve retornar 404" do
           expect(@response.code).to eql 404 
        end
        
    end

end