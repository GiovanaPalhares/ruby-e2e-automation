#language: pt

Funcionalidade: Login
    Sendo um usuário cadastrado
    Quero acessar o sistema
    Para alugar meus equipamentos musicais

    
    Cenario: Login do usuario

        Dado que acesso a página principal
        Quando submeto minhas credenciais com "gopalhares2@hotmail.com" e "123456"
        Então sou redirecionado para o Dashboard

    @login
    Esquema do Cenario: Tentar logar

        Dado que acesso a página principal
        Quando submeto minhas credenciais com "<login_input>" e "<password_input>"
        Então vejo a mensagem de alerta: "<message_output>"

        Exemplos:
            | login_input            | password_input | message_output                   |
            | gopalhares@hotmail.com | 0000           | Usuário e/ou senha inválidos.    |
            | teste@hotmail.com      | 0000           | Usuário e/ou senha inválidos.    |
            | gopalhares2hotmail.com | 123456         | Oops. Informe um email válido!   |
            | gopalhares@hotmail.com |                | Oops. Informe sua senha secreta! |



