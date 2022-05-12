<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\PruebasController;
use App\Http\Controllers\UserController;
use App\Http\Middleware\ApiAuthMiddleware;

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/

Route::Post('api/login', [UserController::class, 'userLogin']);

Route::Post('api/dashboard/users', [UserController::class, 'fetchUser'])->middleware(ApiAuthMiddleware::class);

Route::Post('api/dashboard/users/register', [UserController::class, 'userRegister'])->middleware(ApiAuthMiddleware::class);

Route::Put('api/dashboard/users/edit/{id}', [UserController::class, 'userEdit'])->middleware(ApiAuthMiddleware::class);

Route::Delete('api/dashboard/users/delete/{id}', [UserController::class, 'userDelete'])->middleware(ApiAuthMiddleware::class);



