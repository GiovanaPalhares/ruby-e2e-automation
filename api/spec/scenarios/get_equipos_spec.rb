describe "get_equipo" do 

    before(:all) do 
        login_payload = { email: "giovana10@hotmail.com", password: "123456" }
        login = Sessions.new.login(login_payload)
        @user_id = login.parsed_response["_id"]  
    end

    context "obter equipos de usuário" do
        before(:all) do 
            payloads = [
                { 
                    thumbnail: Helpers::get_thumb("sanfona.jpg"),
                    name: "Guitarra",
                    category: "Cordas",
                    price: 100 
                },
                { 
                    thumbnail: Helpers::get_thumb("trompete.jpg"),
                    name: "Baixo",
                    category: "Cordas",
                    price: 100 
                },
                { 
                    thumbnail: Helpers::get_thumb("slash.jpg"),
                    name: "Violao",
                    category: "Cordas",
                    price: 500 
                }
            ]

            payloads.each do |payload|
                Mongodb.new.remove_equipo(payload[:name], @user_id)
                Post_equipo.new.post_equipo(payload, @user_id)
            end

            @get_equipo = Get_equipo.new.get_equipos(@user_id)
        end

        it "deve retornar 200" do 
            expect(@get_equipo.code).to eql 200
        end 

        # it "deve retornar uma lista de equipos" do  
        #     expect(@get_equipo.parsed_response).not_to be_empty    
        # end
    end

end