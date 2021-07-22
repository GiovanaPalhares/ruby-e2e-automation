Before do
    @alert = Alert.new 
    @login = Login.new
    @cadastro = Cadastro.new
    @dash = Dashboard.new
    @equipamentos = Equipamentos.new

    page.current_window.resize_to(1440, 900)
end 