

  Dado('que acesso a página de cadastro') do
    visit "/signup"
  end

  Quando('submeto o seguinte formulário de cadastro:') do |table|

    user = table.hashes.first

    Mongodb.new.remove_user(user[:email])

    find("#fullName").set user[:nome]
    find("#email").set user[:email]
    find("#password").set user[:senha]

    click_button "Cadastrar"
  end
  


  Quando('submeto o meu cadastro sem a senha') do
    find("#fullName").set "Giovana"
    find("#email").set Faker::Internet.free_email
  
    click_button "Cadastrar"
  end
  


  
  