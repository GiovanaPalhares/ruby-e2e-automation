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

    @tentativa_cadastro
    Esquema do Cenario: Tentativa de cadastro

        Dado acesso a página de criar anúncio
            E que eu tenho o seguinte equipamento:
            | imagem    | <imagem>    |
            | nome      | <nome>      |
            | categoria | <categoria> |
            | preco     | <valor>     |
        Quando submeto o cadastro desse item
        Então é exibido uma mensagem com o texto: "<mensagem>"

        Exemplos:
            | imagem        | nome    | categoria | valor | mensagem                          |
            |               | Baixo   | Cordas    | 100   | Adicione uma foto no seu anúncio! |
            | clarinete.jpg |         | Cordas    | 200   | Informe a descrição do anúncio!   |
            | sanfona.jpg   | Sanfona |           | 100   | Informe a categoria               |
            | pedais.jpg    | Pedais  | Outros    |       | Informe o valor da diária         |





