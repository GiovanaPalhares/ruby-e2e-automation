Dado('que possuo um anúncio:') do |table|

  #script em java script que pega o dado armazenado na variável 'user', no storage do navegador
  user_id = page.execute_script("return localStorage.getItem('user')")

  thumbnail = File.open(File.join(Dir.pwd, "features/support/images", table.rows_hash[:imagem]), "rb")
  
  @equipo = {
  thumbnail: thumbnail,
  name: table.rows_hash[:nome],
  category: table.rows_hash[:categoria],
  price: table.rows_hash[:preco]
}

  Equipos_service.new.create_equipo(@equipo, user_id)
  #Mongodb.new.remove_equipo(@anuncio[:nome], @email)
  #@equipamentos.submeter_cadastro_anuncio(@anuncio)
  visit current_url

  end
  
  Quando('solicito a exclusão de um anúncio') do
    Dashboard.new.remover_anuncio(@equipo[:name])
  end
  
  Quando('confirmo a exclusão') do
    Dashboard.new.confirmar_exclusao
  end
  
  Então('não devo mais ver o anúncio no Dashboard') do
    #expect(page).not_to have_content(@equipamnto)
    expect(Dashboard.new.nao_tem_equipo?(@equipo[:name])).to be true
  end
  
  Quando('não confirmo a exclusão') do
    pending # Write code here that turns the phrase above into concrete actions
  end
  
  Então('devo ver o anúncio no Dashboard') do
    pending # Write code here that turns the phrase above into concrete actions
  end