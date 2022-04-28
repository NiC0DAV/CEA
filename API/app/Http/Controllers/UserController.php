<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\User;

class UserController extends Controller
{

    public function userRegister(Request $request){

    // Recopilacion de la informacion ingresada 
        $jsonData = $request->input('json', null);
        $paramsObj = json_decode($jsonData); 
        $paramsArray = json_decode($jsonData, true);
        $paramsArray = array_map('trim', $paramsArray);

        if(!empty($paramsArray) && !empty($paramsObj)){

            	$validateData = \Validator::make($paramsArray,[
                    'userId' => ['required', 'unique:users'],
                    'tipo_documento' => ['required'],
                    'nombres' => ['required'],
                    'apellidos' => ['required'],
                    'direccion' => ['required'],
                    'correo_electronico' => ['required', 'email', 'unique:users'],//Validar existencia del usuario
                    'telefono' => ['required'],
                    'celular' => ['required'],
                    'tipo_usuario' => ['required'],
                    'contrasena' => ['required']
                ]);

                if($validateData->fails()){

                    $data = array(
                        'status' => 'Error',
                        'code' => 400,
                        'message' => 'No ha sido posible registrar al usuario, por favor intentelo de nuevo',
                        'errors' => $validateData -> errors()
                    );

                    return response()->json($data, $data['code']);

                }else{
                    
                    $hashPass = hash('sha256', $paramsObj->contrasena);

                    $user = new User();
                    $user->userId = $paramsArray['userId'];
                    $user->tipo_documento = $paramsArray['tipo_documento'];
                    $user->nombres = $paramsArray['nombres'];
                    $user->apellidos = $paramsArray['apellidos'];
                    $user->direccion = $paramsArray['direccion'];
                    $user->correo_electronico = $paramsArray['correo_electronico'];
                    $user->telefono = $paramsArray['telefono'];
                    $user->celular = $paramsArray['celular'];
                    $user->tipo_usuario = $paramsArray['tipo_usuario'];
                    $user->ultima_act = $paramsArray['ultima_act'];
                    $user->contrasena = $hashPass;
                    
                    $user->save();

                    $data = array(
                        'status' => 'Success',
                        'code' => 200,
                        'message' => 'El usuario se ha creado correctamente',
                        'user' => $user
                    );

                    return response()->json($data, $data['code']);

                }

        }else{
            $data = array(
                'status' => 'error',
                'code' => 400,
                'message' => 'Los datos enviados no son correctos'
            );

            return response()->json($data, $data['code']);
        }


        
    }

    public function userLogin(Request $request){
        $jwtValidator = new \JwtAuth();
        
        $jsonData = $request->input('json', null);
        $paramsObj = json_decode($jsonData);
        $paramsArray= json_decode($jsonData, true);

        $validateData = \Validator::make($paramsArray,[
            'correo_electronico' => ['required', 'email'],
            'contrasena' => ['required']
        ]);

        if($validateData->fails()){
            $data = array(
                'status' => 'Error',
                'code' => 404,
                'message' => 'El usuario no se ha podido identificar',
                'errors' => $validate->errors()
            );

        }else{
            $hashPass = hash('sha256', $paramsObj->contrasena);

            $signUp = $jwtValidator->signUp($paramsObj->correo_electronico, $hashPass);

            if(!empty($paramsObj->getToken)){
                $signUp = $jwtAuth->signUp($params->email, $hashPass, true); 
            }

        }


        return response()->json($signUp, 200);
    }
}
