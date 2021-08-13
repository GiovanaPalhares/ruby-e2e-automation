require_relative 'routes/sessions'

describe "POST/sessions" do 
    context "login com sucesso" do 
        before(:all) do
            @result = Sessions.new.login("giovana@hotmail.com", "123456")
        end

        it "status code 200" do
            expect(@result.code).to eql 200
        end

        it "id com 24 caracteres" do
            expect(@result.parsed_response["_id"].length).to eql 24
        end
    end

    context "login com senha invalida" do 
        before(:all) do
            @result = Sessions.new.login("giovana@hotmail.com", "648961651651561")
        end

        it "status code 401" do
            expect(@result.code).to eql 401
        end

        it "id com 24 caracteres" do
            expect(@result.parsed_response["error"]).to eql "Unauthorized"
        end
    end
end