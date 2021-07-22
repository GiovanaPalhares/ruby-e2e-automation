Dado('que acesso a página principal') do
    @login.abrir
end
  
Quando('submeto minhas credenciais com {string} e {string}') do |string, string2|
    @login.logar(string, string2)
end

