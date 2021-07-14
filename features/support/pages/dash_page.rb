class Dashboard 
    include Capybara::DSL

    def criar_anuncio
        click_button "Criar anúncio"
    end

    def equipo_list
        return find(".equipo-list")
    end

    def on_dash?
        return page.has_css?(".dashboard")
    end
end