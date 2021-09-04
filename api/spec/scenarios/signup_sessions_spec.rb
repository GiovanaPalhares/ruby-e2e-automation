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

    context "não informar dados obrigatórios" do
        before(:all) do
            @payload = [
                {name: "", email: "joao@hotmail.com", password: "123456"},
                {name: "joao", email: "", password: "123456"},
                {name: "joao", email: "", password: ""}
             ]       
        end

        it "não informar nome - status code 412" do
            cadastrar = Signup_sessions.new.sign_up(@payload[0])
            expect(cadastrar.code).to eql 412
            expect(cadastrar.parsed_response["error"]).to eql "required name"
        end

        it "não informar email - status code 412" do
             cadastrar = Signup_sessions.new.sign_up(@payload[1])
             expect(cadastrar.code).to eql 412
             expect(cadastrar.parsed_response["error"]).to eql "required email"
        end
        
        it "não informar senha - status code 412" do
            cadastrar = Signup_sessions.new.sign_up(@payload[1])
            expect(cadastrar.code).to eql 412
            expect(cadastrar.parsed_response["error"]).to eql "required email"
       end
    end
end