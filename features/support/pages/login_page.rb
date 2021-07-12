class Login
    include Capybara::DSL

    def abrir
        visit "/"
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