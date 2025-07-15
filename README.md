# Final Project - Rede Social Simples em Rails

## Funcionalidades

- Autenticação de usuários com Devise (login, cadastro, logout)
- Restrições de acesso: apenas a página de login/cadastro é pública
- Perfil de usuário com nome e foto (Gravatar ou personalizada)
- Solicitações de acompanhamento (seguir outros usuários)
- Aceitar e rejeitar solicitações de acompanhamento
- Página de índice de usuários com botões para seguir, aceitar ou rejeitar
- Criação de postagens de texto
- Curtir e descurtir postagens
- Comentar em postagens
- Feed: exibe posts do usuário e de quem ele segue
- Página de perfil do usuário com informações e postagens

## Rotas Principais

- `/` - Feed de postagens (posts#index)
- `/users/sign_up` - Cadastro de novo usuário
- `/users/sign_in` - Login
- `/users` - Lista de usuários para seguir
- `/users/:id` - Perfil do usuário
- `/posts` - Lista de postagens do feed
- `/posts/new` - Criar nova postagem
- `/posts/:id` - Visualizar postagem (curtir, comentar)

## Como rodar o projeto

1. **Instale as dependências:**
   ```bash
   bundle install
   ```
2. **Configure o banco de dados:**
   - Ajuste o arquivo `config/database.yml` com seu usuário e senha do PostgreSQL.
   - Crie e migre o banco:
     ```bash
     rails db:create db:migrate
     ```
3. **Inicie o servidor:**
   ```bash
   rails server
   ```
4. **Acesse no navegador:**
   - [http://localhost:3000](http://localhost:3000)

## Observações
- O sistema exige login para acessar qualquer funcionalidade.
- Para seguir outro usuário, acesse `/users` e utilize os botões disponíveis.
- O feed mostra apenas postagens do usuário logado e de quem ele segue.
- As postagens podem ser curtidas e comentadas diretamente na página do post.

---

Projeto desenvolvido para fins didáticos, seguindo requisitos básicos de uma rede social simples em Ruby on Rails.
