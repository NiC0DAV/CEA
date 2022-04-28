<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\User;

class PruebasController extends Controller
{

    public function test(){

        echo 'Hola';
        
    }

    public function testOrm(){

        $users = User::all();

        foreach ($users as $user){
            echo "<h1>".$user -> Nombres."</h1>";
        }

        // die();      
    }
}
