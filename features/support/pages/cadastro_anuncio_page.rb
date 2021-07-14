class Equipamentos
    include Capybara::DSL

    def submeter_cadastro_anuncio(equipamento)
        page.has_css?("#equipoForm")

        image = Dir.pwd + '/features/support/images/' + equipamento[:imagem]

        find("#thumbnail input[type=file]", visible: false).set image
        find("input[placeholder$='equipamento']").set equipamento[:nome]
        find("#category").find('option', text: equipamento[:categoria]).select_option
        find("#price").set equipamento[:preco]

        click_button "Cadastrar"
    end
end