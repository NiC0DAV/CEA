<?php

namespace App\Http\Middleware;

use Closure;
use Illuminate\Http\Request;

class ApiAuthMiddleware
{
    /**
     * Handle an incoming request.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \Closure(\Illuminate\Http\Request): (\Illuminate\Http\Response|\Illuminate\Http\RedirectResponse)  $next
     * @return \Illuminate\Http\Response|\Illuminate\Http\RedirectResponse
     */
    public function handle(Request $request, Closure $next)
    {
        
        $tokenAuth = $request->header('Authorization');
        $jwtValidator = new \JwtAuth();
        $checkToken = $jwtValidator->checkToken($tokenAuth);

        if($checkToken){
            return $next($request);
        }else{

            $data = array(
                'code' => 400,
                'status' => 'Error',
                'message' => 'Error el usuario no esta identificado'
            );

            return response()->json($data, $data['code']);
        }
        
    }
}
