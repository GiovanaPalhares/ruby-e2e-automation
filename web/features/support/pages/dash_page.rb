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

    def nao_tem_equipo?(nome)
        return page.has_no_css?(".equipo-list li", text: nome)
    end

    def remover_anuncio(nome)
        @equipamnto = find(".equipo-list li", text: nome)
        @equipamnto.find(".delete-icon").click
    end

    def confirmar_exclusao
        click_button "Sim"
    end
end