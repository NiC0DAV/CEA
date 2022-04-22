<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class doc_aprendiz extends Model
{
    use HasFactory;

    protected $table = 'doc_aprendiz';

    public function user(){
        return $this->belongsTo('App\user', 'userId');
    }
}
