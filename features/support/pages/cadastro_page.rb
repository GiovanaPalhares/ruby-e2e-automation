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

end