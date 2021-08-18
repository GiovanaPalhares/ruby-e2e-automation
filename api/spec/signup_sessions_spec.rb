require_relative 'routes/signup_sessions'
require_relative 'libs/mongo'

describe "signup sessions" do

    context "cadastro de usuário com sucesso" do 
        before(:all) do
            payload = {name: "joao", email: "joao@hotmail.com", password: "123456"}
            Mongodb.new.remove_user(payload[:email])
            @result = Signup_sessions.new.sign_up(payload)
        end
    
        it "status code 200" do
            expect(@result.code).to eql 200
        end
    end

    context "usuário duplicado" do

        before(:all) do 
            payload = {name: "maria1", email: "maria1@hotmail.com", password: "123456"} 
            Mongodb.new.remove_user(payload[:email])
            Signup_sessions.new.sign_up(payload)
            @signup = Signup_sessions.new.sign_up(payload)
        end

        it "status code 409" do
            expect(@signup.code).to eql 409
            puts @signup.message
        end

        it "valida mensagem de erro" do
            expect(@signup.message).to eql "Conflict"
        end

        it "valida erro retornado pela API" do
            expect(@signup.parsed_response["error"]).to eql "Email already exists :("

        end
    end
end