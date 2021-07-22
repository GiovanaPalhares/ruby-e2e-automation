require 'httparty'

describe "POST/sessions" do 
    context "login com sucesso" do 
        before(:all) do
            payload = { email: "giovana@hotmail.com", password: "123456"}
            @result = HTTParty.post(
            'http://rocklov-api:3333/sessions',
            body: payload.to_json,
            headers: {
                "Content-Type": "application/json"
            }
        ) 
        end

        it "status code 200" do
            expect(@result.code).to eql 200
        end

        it "id com 24 caracteres" do
            expect(@result.parsed_response["_id"].length).to eql 24
        end
    end
end