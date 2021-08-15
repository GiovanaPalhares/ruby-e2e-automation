require_relative 'routes/sessions'
require_relative 'helpers'

describe "POST/sessions" do 
    context "login com sucesso" do 
        before(:all) do
            payload = {email: "giovana@hotmail.com", password: "123456"}
            @result = Sessions.new.login(payload)
        end

        it "status code 200" do
            expect(@result.code).to eql 200
        end

        it "id com 24 caracteres" do
            expect(@result.parsed_response["_id"].length).to eql 24
        end
    end

    examples = Helpers::get_fixture("login")

    # esse json era usado para passar a massa de testes antes de implementar o YML
    # examples = [
    #     {
    #         nome: "senha inválida",
    #         payload: { email: "giovana@hotmail.com", password: "648961651651561" },
    #         code: 401,
    #         response: "Unauthorized"
    #     },
    #     {
    #         nome: "e-mail não existe",
    #         payload: { email: "nao_existe@hotmail.com", password: "123456" },
    #         code: 401,
    #         response: "Unauthorized"
    #     },
    #     {
    #         nome: "não informar e-mail",
    #         payload: { email: "", password: "123456" },
    #         code: 412,
    #         response: "required email"
    #     },
    #     {
    #         nome: "não informar senha",
    #         payload: { email: "giovana@hotmail.com", password: "" },
    #         code: 412,
    #         response: "required password"
    #     }
    # ]


    examples.each do |e|

        context e[:nome] do 
            before(:all) do
                @result = Sessions.new.login(e[:payload])
            end
    
            it "status code #{e[:code]}" do
                expect(@result.code).to eql e[:code]
            end
    
            it "valida id do usuário" do
                expect(@result.parsed_response["error"]).to eql e[:response]
            end
        end

    end


end