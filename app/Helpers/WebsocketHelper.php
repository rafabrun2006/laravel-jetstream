<?php

namespace App\Helpers;

use GuzzleHttp\Client;
use Illuminate\Support\Facades\Http;
use Illuminate\Support\Facades\Request;
use Illuminate\Support\Facades\Route;

class WebsocketHelper
{
    public static function send(string $message)
    {
        $host = env('SWOOLE_HTTP_HOST');
        $port = env('SWOOLE_HTTP_PORT');

        $response = Http::get("{$host}:{$port}/send", ['message' => $message]);

        return $response->getBody();
    }
}