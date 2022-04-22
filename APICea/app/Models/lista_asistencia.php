<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class lista_asistencia extends Model
{
    use HasFactory;
    protected $table = 'lista_asistencia';

    public function listaAsistUser(){
        return $this->belongsTo('App\user', 'userId');
    }
}
