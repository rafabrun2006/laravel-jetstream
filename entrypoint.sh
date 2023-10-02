#!/bin/bash

if [ ! -f .env ]
then
    cp .env.example .env
fi

pm2 start npm -- run dev

composer install &

/usr/local/bin/php artisan serve --host 0.0.0.0 &

/usr/local/bin/php artisan swoole:http start

