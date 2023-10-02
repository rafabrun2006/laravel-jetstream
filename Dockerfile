FROM laravelsail/php82-composer:latest

WORKDIR /var/www/html

RUN apt-get update && apt-get install -y ca-certificates gnupg
RUN mkdir -p /etc/apt/keyrings
RUN curl -fsSL https://deb.nodesource.com/gpgkey/nodesource-repo.gpg.key | gpg --dearmor -o /etc/apt/keyrings/nodesource.gpg
RUN echo "deb [signed-by=/etc/apt/keyrings/nodesource.gpg] https://deb.nodesource.com/node_18.x nodistro main" | tee /etc/apt/sources.list.d/nodesource.list

RUN apt-get update && apt-get install -y nodejs \
    nginx \
    # apache2 \
    nano \
    screen

RUN docker-php-ext-install sockets

RUN pecl install swoole && docker-php-ext-enable swoole

# install pm2
RUN npm install pm2@latest -g

COPY . /var/www/html
COPY entrypoint.sh /

RUN chmod +x /entrypoint.sh

EXPOSE 8000 1215 5173

CMD /entrypoint.sh