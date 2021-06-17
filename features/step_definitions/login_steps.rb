Dado('que acesso a página principal') do
    visit "/"
end
  
Quando('submeto minhas credenciais com {string} e {string}') do |string, string2|
    find("#email").set string 
    find("#password").set string2
    
    click_button "Entrar"
end

