require_relative 'routes/signup_sessions'

describe "signup sessions" do
    context "cadastro de usuário com sucesso" do 
        before(:all) do
            payload = {name: "joao", email: "joao@hotmail.com", password: "123456"}
            @result = Signup_sessions.new.sign_up(payload)
        end
    
        it "status code 200" do
            expect(@result.code).to eql 200
        end
    
        # it "id com 24 caracteres" do
        #     expect(@result.parsed_response["_id"].length).to eql 24
        # end
    end
end