# Projeto desenvolvido durante curso de automação de testes *Automação 180*

Testes automatizados do sistema web *rocklov* e das APIs do sistema


### Tecnologias utilizadas
- [Ruby](https://www.ruby-lang.org/en/)
- [Ruby Gems](https://rubygems.org/)
- [Docker Compose](https://docs.docker.com/compose/)
- [Cucumber](https://cucumber.io/)
- [Capybara](https://teamcapybara.github.io/capybara/) 
- [RSpec](https://rspec.info/)
- [HTTParty](https://github.com/jnunemaker/httparty)
- [MongoDB](https://robomongo.org/)



### Configurações


 ##### Preparando o ambiente 
Clonar o repositório do projeto

```sh
https://gitlab.com/papito/rocklov-dc
```

Com o docker-compose instalado, rodar o comando na pasta da versão que deseja testar

```sh
docker-compose up -d
```
##### Acessando o sistema
- [web](http://rocklov-web:3000/)
- [swagger](http://rocklov-api:3333/api-docs#/)


## Execução dos testes web
- Acesse a pasta *web* 
- Execute o comando:
```sh
cucumber /features
```
## Execução dos testes API
- Acesse a pasta *api* 
- Execute o comando:
```sh
rspec
```
