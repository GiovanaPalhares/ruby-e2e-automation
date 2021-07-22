class Login
    include Capybara::DSL

    def abrir
        visit "/"
    end

    def logar(email, password)
        find("#user_email").set email
        find("#user_password").set password
        click_button "Entrar"
    end

    def email_field
        return find("#user_email")
    end

    def password_field
        return find("#user_password")
    end

    def entrar
        click_button "Entrar"
    end


end