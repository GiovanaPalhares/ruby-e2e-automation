
  Dado('que acesso a página de cadastro') do
    @cadastro.cadastro_page
  end

  Quando('submeto o seguinte formulário de cadastro:') do |table|
    user = table.hashes.first

    Mongodb.new.remove_user(user[:email])

    @cadastro.cadastrar(user)
  end
  
  Quando('submeto o meu cadastro sem a senha') do
    @cadastro.cadastro_nome.set "Giovana"
    @cadastro.cadastro_email.set Faker::Internet.free_email
  
    @cadastro.cadastro_button
  end
  


  
  