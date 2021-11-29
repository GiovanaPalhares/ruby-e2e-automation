#language: pt

Funcionalidade: Excluir anuncios
    Sendo usuário do sistema que possui anúncios
    Quero poder realizar a exclusão de anúncio
    Para manter meu dashboard atualizado

    Contexto:
        * Login com "maria@hotmail.com" e "123456"

    Cenario: Realizar a exclusão de um anúncio
        Dado que possuo um anúncio:
            | imagem    | baixo.jpg |
            | nome      | Baixo     |
            | categoria | Cordas    |
            | preco     | 100       |
        Quando solicito a exclusão de um anúncio
            E confirmo a exclusão
        Então não devo mais ver o anúncio no Dashboard

    @teste_novo
    Cenario: Não confirmar a exlcusão de um anúncio
        Dado que possuo um anúncio:
            | imagem    | baixo.jpg |
            | nome      | Baixo     |
            | categoria | Cordas    |
            | preco     | 100       |
        Quando solicito a exclusão de um anúncio
            Mas não confirmo a exclusão
        Então devo ver o anúncio no Dashboard



