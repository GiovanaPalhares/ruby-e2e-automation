Dado('que estou logado no Rocklov com {string} e {string}') do |string, string2|
    @email = string
    @login = Login.new
    @login.abrir
    @login.email_field.set string
    @login.password_field.set string2

    @login.entrar
end
  
Dado('acesso a página de criar anúncio') do
    click_button "Criar anúncio"
    expect(page).to have_css "#equipoForm"
end

Dado('que eu tenho o seguinte equipamento:') do |table|
    @anuncio = table.rows_hash

    Mongodb.new.remove_equipo(@anuncio[:nome], @email)

end
  
Quando('submeto o cadastro desse item') do

    image = Dir.pwd + '/features/support/images/' + @anuncio[:imagem]

    find("#thumbnail input[type=file]", visible: false).set image
    find("input[placeholder$='equipamento']").set @anuncio[:nome]
    find("#category").find('option', text: @anuncio[:categoria]).select_option
    find("#price").set @anuncio[:preco]

    click_button "Cadastrar"

end
  
Então('devo ver esse item no meu Dashboard') do
    anuncios = find(".equipo-list")
    expect(anuncios).to have_content @anuncio[:nome]
    expect(anuncios).to have_content "R$#{@anuncio[:preco]}/dia"
end