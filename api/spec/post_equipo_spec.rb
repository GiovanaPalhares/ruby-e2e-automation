# os arquivos require_relative estão no spec_helper

describe "post equipo" do

    before(:all) do
        login_payload = { email: "giovana@hotmail.com", password: "123456" }
        login = Sessions.new.login(login_payload)
        @user_id = login.parsed_response["_id"]
    end

    context "cadastrar equipamento com sucesso" do
        before(:all) do
            thumbnail = File.open(File.join(Dir.pwd, "spec/fixtures/images", "slash.jpg"), "rb")
            payload = { thumbnail: thumbnail, name: "Guitarra", category: "Cordas", price: 100 }
            Mongodb.new.remove_equipo(payload[:name], @user_id)
            @post_equipo = Post_equipo.new.post_equipo(payload, @user_id)

        end

        it "cadastro com sucesso deve retornar 200" do
            expect(@post_equipo.code).to eql 200
        end


    end

    # context "não informar dados obrigatórios" do
    #     before(:all) do
    #         @payload = [
    #             { thumbnail:"" , name: "Guitarra", category: "Cordas", price: 100 },
    #             { thumbnail: @thumbnail, name: "", category: "Cordas", price: 100 },
    #             { thumbnail: @thumbnail, name: "Guitarra", category: "", price: 100 },
    #             # { thumbnail: @thumbnail, name: "Guitarra", category: "Cordas", price: }
    #         ]
            
    #     end

    #     it "não deve ser possível realizar cadastro sem imagem - erro 412" do
    #         post_equipo = Post_equipo.new.post_equipo(@payload[0], @user_id)
    #         expect(@post_equipo.code).to eql 412
    #     end
        

    # end

end