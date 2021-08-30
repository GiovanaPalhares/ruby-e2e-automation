# os arquivos require_relative estão no spec_helper

describe "post equipo" do

    before(:all) do
        login_payload = { email: "giovana@hotmail.com", password: "123456" }
        login = Sessions.new.login(login_payload)
        @user_id = login.parsed_response["_id"]
        puts "USERIDDDDDDDDDD:: #{@user_id}"
    end

    context "cadastrar equipamento com sucesso" do
        before(:all) do
            thumbnail = Helpers::get_thumb("slash.jpg") #implementado no helpers a busca pelo arquivo de imagem
            payload = { thumbnail: thumbnail, name: "Guitarra", category: "Cordas", price: 100 }
            Mongodb.new.remove_equipo(payload[:name], @user_id)
            @post_equipo = Post_equipo.new.post_equipo(payload, @user_id)
        end

        it "cadastro com sucesso deve retornar 200" do
            expect(@post_equipo.code).to eql 200
        end

    end

    context "não informar dados obrigatórios" do

        def create_equipo(payload, user) 
            Post_equipo.new.post_equipo(payload, user)
        end

        before(:all) do
            thumbnail = Helpers::get_thumb("baixo.jpg")
            @payload = [
                { thumbnail:"" , name: "Guitarra", category: "Cordas", price: 100 },
                { thumbnail: thumbnail, name: "", category: "Cordas", price: 100 },
                { thumbnail: thumbnail, name: "Guitarra", category: "", price: "30" },
                { thumbnail: thumbnail, name: "Bateria", category: "Cordas", price: "50" },

            ]            
        end

        it "não deve ser possível realizar cadastro sem imagem - erro 412" do
            equipo = create_equipo(@payload[0], @user_id)
            expect(equipo.code).to eql 412
        end

        it "não deve ser possível realizar cadastro sem nome - erro 412" do
            equipo = create_equipo(@payload[1], @user_id)
            expect(equipo.code).to eql 412
        end

        it "não deve ser possível realizar cadastro sem categoria - erro 412" do
            equipo = create_equipo(@payload[2], @user_id)
            expect(equipo.code).to eql 412
        end

        # it "não deve ser possível realizar cadastro sem preço - erro 412" do
        #     equipo = create_equipo(@payload[3], @user_id)
        #     expect(equipo.code).to eql 412
        # end

        it "não deve ser possível realizar cadastro sem autorização" do 
            equipo = create_equipo(@payload[3], nil)
            expect(equipo.code).to eql 401
        end
     
    end

end