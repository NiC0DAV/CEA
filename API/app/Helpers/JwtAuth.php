<?php

namespace App\Helpers;

use Firebase\JWT\JWT;
use Illuminate\Support\Faccades\DB;
use App\Models\User;

Class JwtAuth{

    public $key;

    public function __construct(){
        $this->key = 'wP#IYxN5DlLj';
    }

    public function signUp($email, $password, $getToken = null){//primero crear service provider desde el cmd php artisan make:provider [nombreServiceProvider]
        //Buscar si existe el usuario con su credencial de logeo
        $user = User::where([
            'correo_electronico' => $email,
            'contrasena' => $password
        ])->first();

        //Si las hay comprobar si son correctas
        $signUp = false;

        if(is_object($user)){
            $signUp = true;
        }

        
        //Generar token con los datos del usuario identificado
        if ($signUp){
            $token = array(
                'userId' => $user->userId,
                'correo_electronico' => $user->correo_electronico,
                'nombres' => $user->nombres,
                'apellidos' => $user->apellidos,
                'iat' => time(),//Fecha de creacion del token
                'exp' => time()+(7*24*60*60)//tiempo de expiracion del token
            );

            $jwt = JWT::encode($token, $this->key, 'HS256' );

            $decodeJwt = JWT::decode($jwt, $this->key, ['HS256']);

            if(is_null($getToken)){
                $data = $jwt;
            }else{
                $data = $decodeJwt;
            }

        }else{
            $data = array(
                'status' => 'Error',
                'code' => 400,
                'message' => 'Intento de logeo incorrecto.'
            );
        }
        return $data;

    }

    public function checkToken($jwt, $getIdentity = false){
        $auth = false;

        try {
            $jwt = str_replace('"', '', $jwt);
            $decoded = JWT::decode($jwt, $this->key, ['HS256']);
        } catch (\UnexpectedValueException $e) {
            $auth = false;
        }catch(\DomainException $e){
            $auth = false;
        }

        if (!empty($decoded) && is_object($decoded) && isset($decoded->userId)){
            $auth = true;
        }else{
            $auth = false;
        }

        if($getIdentity){
            return $decoded;
        }

        return $auth;

    }



}