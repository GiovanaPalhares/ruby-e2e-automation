#language: pt

Funcionalidade: Login
    Sendo um usuário cadastrado
    Quero acessar o sistema
    Para alugar meus equipamentos musicais
    
    
    Cenario: Login do usuario

        Dado que acesso a página principal
        Quando submeto minhas credenciais com "gopalhares@hotmail.com" e "123456"
        Então sou redirecionado para o Dashboard

    Cenario: Senha incorreta

        Dado que acesso a página principal
        Quando submeto minhas credenciais com "gopalhares@hotmail.com" e "0000"
        Então vejo a mensagem de alerta: "Usuário e/ou senha inválidos."

    Cenario: Email não cadastrado

        Dado que acesso a página principal
        Quando submeto minhas credenciais com "teste@hotmail.com" e "0000"
        Então vejo a mensagem de alerta: "Usuário e/ou senha inválidos."

    Cenario: Email incorreto

        Dado que acesso a página principal
        Quando submeto minhas credenciais com "gopalhares2hotmail.com" e "0000"
        Então vejo a mensagem de alerta: "Oops. Informe um email válido!"

