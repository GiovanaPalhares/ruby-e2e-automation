#language: pt

Funcionalidade: Cadastro de equipamento
    Sendo usuário cadastrado na Rocklov que possui equipamentos musicais
    Quero cadastrar meus equipamentos
    Para que eu possa disponibilizar para locação

    Contexto:
        * Login com "giovana@hotmail.com" e "123456"

    @novo
    Cenario: Novo equipamento

        Dado acesso a página de criar anúncio
        E que eu tenho o seguinte equipamento:
            | imagem    | baixo.jpg |
            | nome      | Baixo     |
            | categoria | Cordas    |
            | preco     | 100       |
        Quando submeto o cadastro desse item
        Então devo ver esse item no meu Dashboard



