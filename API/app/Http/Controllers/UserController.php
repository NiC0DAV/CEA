<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\User;
use Illuminate\Support\Facades\Validator;

class UserController extends Controller{

    public function fetchUser(Request $request){

        $users = User::select
        ('id','userId', 'tipo_documento', 'nombres', 'apellidos', 'direccion', 'correo_electronico', 'telefono', 'celular', 'tipo_usuario', 'ultima_act')
        ->get();

        return $users;
    }

    public function userRegister(Request $request){
        // Recopilacion de la informacion ingresada 
        $jwtValidator = new \JwtAuth();
        $tokenAuth = $request->header('Authorization');
        $checkToken = $jwtValidator->checkToken($tokenAuth);

        $jsonData = $request->input('json', null);
        $paramsObj = json_decode($jsonData); 
        $paramsArray = json_decode($jsonData, true);

        return $paramsArray;
        
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

        $paramsArray = json_decode($jsonData, true);
        
        $validateData = Validator::make($paramsArray,[
            'correo_electronico' => 'required|email',
            'contrasena' => 'required'
        ]);

        if($validateData->fails()){
            $signUp = array(
                'status' => 'Error',
                'code' => 404,
                'message' => 'El usuario no se ha podido identificar',
                'errors' => $validateData->errors()
            );

        }else{
            $hashPass = hash('sha256', $paramsObj->contrasena);
 
            $signUp = $jwtValidator->signUp($paramsObj->correo_electronico, $hashPass);

            if(!empty($paramsObj->getToken)){
                $signUp = $jwtValidator->signUp($paramsObj->correo_electronico, $hashPass, true); 
            }

        }

        return response()->json($signUp, 200);
    }


    public function userEdit(Request $request, $id){
        $tokenAuth = $request->header('Authorization');

        $jwtValidator = new \JwtAuth();
        $checkToken = $jwtValidator->checkToken($tokenAuth);

        $jsonData = $request->input('json', null);
        $paramsArray = json_decode($jsonData, true);

        if($checkToken){
            $userCheck = $jwtValidator->checkToken($tokenAuth, true);
            
            $validate = \Validator::make($paramsArray, [
                'nombres' => ['required','alpha'],
                'apellidos' => ['required', 'alpha'],
                'direccion' => ['required', 'alpha'],
                'correo_electronico' => ['required', 'email', 'unique:users'.$userCheck->userId],
                'telefono' => ['required', 'numeric|max:15'],
                'celular' => ['required', 'numeric|max:15'],
                'tipo_usuario' => ['numeric'],
                'ultima_act' => ['required','alpha']
            ]);

            unset($paramsArray['userId']);
            unset($paramsArray['tipo_documento']);
            unset($paramsArray['contrasena']);
            unset($paramsArray['created_at']);
            
            $user = User::where('userId', $id)->update($paramsArray);

            if ($user == 1){
                $data = array(
                    'code' => 200,
                    'status' => 'Success',
                    'user' => $userCheck,
                    'update State' => $user,
                    'changes' => $paramsArray
                );
            }else{
                $data = array(
                    'code' => 400,
                    'status' => 'Error',
                    'update State' => $user,
                    'message' => 'Ha ocurrido un error alterando la informacion del usuario'
                );
            }

            return response()->json($data, $data['code']);

        }else{

            $data = array(
                'code' => 400,
                'status' => 'Error',
                'message' => 'Error el usuario no esta identificado'
            );
        }

        return response()->json($data, $data['code']);


    }

    public function userDelete(Request $request, $id){

        $tokenAuth = $request->header('Authorization');
        $jwtValidator = new \JwtAuth();
        $checkToken = $jwtValidator->checkToken($tokenAuth);

        if($checkToken){

            // $userData = User::find($i);
            // $userData = User::select('ID')->whereColumn('userId', $id);
            $user = User::where('userId',$id);
            $user->delete();
            $data = array(
                'code' => 200,
                'status' => 'Success',
                'message' => 'Usuario eliminado de manera exitosa'
            );

            return response()->json($data, $data['code']);
        
        }else{

            $data = array(
                'code' => 400,
                'status' => 'Error',
                'message' => 'El usuario no pudo ser eliminado intentelo nuevamente'
            );

        }

        return response()->json($data, $data['code']);
    }

}