<?php

namespace App\Models;

use Illuminate\Contracts\Auth\MustVerifyEmail;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Foundation\Auth\User as Authenticatable;
use Illuminate\Notifications\Notifiable;
use Laravel\Sanctum\HasApiTokens;

class User extends Authenticatable
{
    use HasApiTokens, HasFactory, Notifiable;

    /**
     * The attributes that are mass assignable.
     *
     * @var array<int, string>
     */
    protected $fillable = [
        'userId',
        'id',
        'tipo_documento',
        'nombres',
        'apellidos',
        'direccion',
        'Correo_Electronico',
        'contrasena',
        'telefono',
        'celular',
        'tipo_Usuario',
        'ultima_act'
    ];

    /**
     * The attributes that should be hidden for serialization.
     *
     * @var array<int, string>
     */
    protected $hidden = [
        'password',
        'remember_token',
    ];

    /**
     * The attributes that should be cast.
     *
     * @var array<string, string>
     */
    protected $casts = [
        'email_verified_at' => 'datetime',
    ];

    public function docAprendiz(){
        return $this->hasMany('App\doc_aprendiz');
    }

    public function horario(){
        return $this->hasMany('App\horario');
    }

    public function listaAsistencia(){
        return $this->hasMany('App\lista_asistencia');
    }

    public function pagoAprendiz(){
        return $this->hasMany('App\pago_aprendiz');
    }
}
