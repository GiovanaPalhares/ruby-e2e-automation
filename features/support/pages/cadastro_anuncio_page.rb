class Equipamentos
    include Capybara::DSL

    def submeter_cadastro_anuncio(equipamento)
        page.has_css?("#equipoForm")

        update_image(equipamento[:imagem]) if equipamento[:imagem].length > 0 
        find("input[placeholder$='equipamento']").set equipamento[:nome]
        select_categoria(equipamento[:categoria]) if equipamento[:categoria].length > 0 
        find("#price").set equipamento[:preco]

        click_button "Cadastrar"
    end

    def select_categoria(categoria)
        find("#category").find('option', text: categoria).select_option
    end

    def update_image(file_name)
        image = Dir.pwd + '/features/support/images/' + file_name

        find("#thumbnail input[type=file]", visible: false).set image
    end
    
end