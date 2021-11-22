Dado('Login com {string} e {string}') do |email, senha|
    @email = email
    @login.abrir
    @login.email_field.set email
    @login.password_field.set senha

    @login.entrar
    expect(@dash.on_dash?).to be true
end

Dado('acesso a página de criar anúncio') do
    @dash.criar_anuncio
end

Dado('que eu tenho o seguinte equipamento:') do |table|
    @anuncio = table.rows_hash

    Mongodb.new.remove_equipo(@anuncio[:nome], @email)
end
  
Quando('submeto o cadastro desse item') do
    @equipamentos.submeter_cadastro_anuncio(@anuncio)
end
  
Então('devo ver esse item no meu Dashboard') do
    anuncios = @dash.equipo_list
    expect(anuncios).to have_content @anuncio[:nome]
    expect(anuncios).to have_content "R$#{@anuncio[:preco]}/dia"
end

Então('é exibido uma mensagem com o texto: {string}') do |string|
    expect(@alert.dark).to include(string)
end
  