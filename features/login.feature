#language: pt

Funcionalidade: Login
    Sendo um usuário cadastrado
    Quero acessar o sistema
    Para alugar meus equipamentos musicais

    @login
    Cenario: Login do usuario

        Dado que acesso a página principal
        Quando submeto minhas credenciais com "gopalhares@hotmail.com" e "123456"
        Então sou redirecionado para o Dashboard

    Cenario: Senha incorreta

        Dado que acesso a página principal
        Quando submeto minhas credenciais com senha incorreta
        Então vejo a mensagem de alerta: Usuário e/ou senha inválidos

    Cenario: Email não cadastrado

        Dado que acesso a página principal
        Quando submeto minhas credenciais com email que não existe na Rocklov
        Então vejo a mensagem de alerta: Usuário e/ou senha inválidos

    Cenario: Email incorreto

        Dado que acesso a página principal
        Quando submeto minhas credenciais com email incorreto
        Então vejo a mensagem de alerta: Oops. Informe um email válido!#language: pt

