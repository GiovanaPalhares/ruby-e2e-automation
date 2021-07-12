Dado('que acesso a página principal') do
    @login = Login.new
    @login.abrir
end
  
Quando('submeto minhas credenciais com {string} e {string}') do |string, string2|
    @login.email_field.set string 
    @login.password_field.set string2
    
    @login.entrar
end

