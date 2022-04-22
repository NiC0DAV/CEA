<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class pago_aprendiz extends Model
{
    use HasFactory;
    protected $table = 'pago_aprendiz';

    public function pagoAprendizUser(){
        return $this->belongsTo('App\user', 'userId');
    }
}
