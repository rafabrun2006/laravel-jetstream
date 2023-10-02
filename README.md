## O que foi feito
1. Fiz somente uma instalação simples, do laravel + jetstream, que já entrega um dashboard com controle de conta de usuário, e fiz alterações pontuais nas classes de evento do jetstream *App\Actions\Fortfy\CreateNewUser.php* e *App\Actions\Fortfy\UpdateUserProfileInformation.php* que chamam a WebsocketHelper para solicitar ao servidor socket a emissão da mensagem.

2. Criei uma pagina bem simples, que acompanha os eventos emit do server socket, e mostra na página a mensagem emitida pelo server após uma modificação do perfil do usuário ou criação de uma nova conta.

## Plataforma utilizada

Docker container com imagem [laravelsail/php82-composer](https://hub.docker.com/r/laravelsail/php82-composer)

## Pacotes utilizados

- [Laravel 10](https://laravel.com/docs/10.x)

- [Swooletw](https://github.com/swooletw/laravel-swoole)

- [Jetstream + livewire](https://jetstream.laravel.com)


## Como executar

Dentro da raiz do projeto tem um arquivo docker-compose.yml que já utiliza um Dockerfile e compila uma imagem com as dependencias necessárias para executar a aplicação e na sequencia inicia a aplicação.

- docker compose up -d

## Ambientes de validação

1. A aplicação vai subir na porta **100** e poderá ser visualizado em http://localhost:100

2. O serviço de socket vai subir na porta 1215 e poderá ser visualizado em http://localhost:1215

3. A pagina http://localhost:100/websocket somente visualiza as comunicações que foram emitidas pelo server em broadcast para todos os clientes.

## Como validar

1. Acessar o ambiente http://localhost:100/websocket para acompanhar as mensagens que serão emitidas pelo server.

2. Acessar o ambiente http://localhost:100/register e criar uma conta

3. Verificar se a mensagem emitida aparece no ambiente http://localhost:100/websocket

4. No ambiente logado também é possível fazer somente alteração de dados, e o server também emitirá uma mensagem.