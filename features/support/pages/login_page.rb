class Login
    include Capybara::DSL

    def abrir
        visit "/"
    end

    def email_field
        return find("#email")
    end

    def password_field
        return find("#password")
    end

    def entrarg
        click_button "Entrar"
    end


end