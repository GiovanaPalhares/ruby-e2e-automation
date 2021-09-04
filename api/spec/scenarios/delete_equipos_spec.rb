#encoding: utf-8
describe "delete equipo" do 

    before(:all) do
        login_payload = { email: "giovana@hotmail.com", password: "123456" }
        login = Sessions.new.login(login_payload)
        @user_id = login.parsed_response["_id"]
    end

    context "deletar equipo" do 
        before(:all) do 
            thumbnail = Helpers::get_thumb("pedais.jpg") 
            payload = { thumbnail: thumbnail, name: "Pedais", category: "Áudio e Tecnologia".force_encoding("ASCII-8BIT"), price: 50 }
            Mongodb.new.remove_equipo(payload[:name], @user_id)
            post_equipo = Post_equipo.new.post_equipo(payload, @user_id)
            equipo_id = post_equipo.parsed_response["_id"]

            @response = Delete_equipo.new.delete_equipo(equipo_id, @user_id)
        end

        it "deve retornar 204" do
            expect(@response.code).to eql 204
        end
    end
end