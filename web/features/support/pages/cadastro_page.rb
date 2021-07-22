class Cadastro 
    include Capybara::DSL

    def cadastro_page
        visit "/signup"
    end

    def cadastro_nome
        return find("#fullName")
    end

    def cadastro_email
        return find("#email")
    end
        
    def cadastro_password
        return find("#password")
    end

    def cadastro_button
        click_button "Cadastrar"
    end

    def cadastrar(user)
        cadastro_nome.set user[:nome]
        cadastro_email.set user[:email]
        cadastro_password.set user[:senha]
        click_button "Cadastrar"
    end

end