<?php

namespace App;

use Illuminate\Contracts\Auth\MustVerifyEmail;
use Illuminate\Foundation\Auth\User as Authenticatable;
use Illuminate\Notifications\Notifiable;
use Illuminate\Support\Facades\Hash;
use Spatie\Permission\Traits\HasRoles;

class User extends Authenticatable
{
    use Notifiable;
    use HasRoles;

    /**
     * The attributes that are mass assignable.
     *
     * @var array
     */
    protected $fillable = [
        'nombres','apellidos','document_number','email', 'password',
    ];

    /**
     * The attributes that should be hidden for arrays.
     *
     * @var array
     */
    protected $hidden = [
        'password', 'remember_token',
    ];
    #User::all();
    #User::get();

    /**
     * The attributes that should be cast to native types.
     *
     * @var array
     */
    protected $casts = [
        'email_verified_at' => 'datetime',
    ];



    public static function registro($parametros){

        $parametros = (object)$parametros;

        $correo          = User::validacionCorreo( $parametros->correo );

        $document_number = User::validacionDocumento( $parametros->numero_documento );

        if(  $document_number  ){

            return [

                'title' => 'Atención',
                'text'  => 'El DNI ya se encuentrá registrado, intente con otro DNI',
                'icon'  => 'warning'

            ];    

             return false;  
        }


        if(  $correo  ){

            return [

                'title' => 'Atención',
                'text'  => 'El correo ya se encuentrá registrado, intente con otro correo.',
                'icon'  => 'warning'

            ];

            return false;    

        }

        User::create([

            'nombres' => $parametros->nombres,
            'apellidos' => $parametros->apellidos,
            'document_number' => $parametros->numero_documento,
            'email' => $parametros->correo,
            'password'=> Hash::make( $parametros->numero_documento )

        ]);

        return [

            'title' => 'Buen Trabajo',
            'text'  => 'Usuario Registrado',
            'icon'  => 'success'

        ];


    }

    public static function actualizacion($parametros){

        $parametros = (object)$parametros;

        $correo          = User::validacionCorreo( $parametros->correo );

        $document_number = User::validacionDocumento( $parametros->numero_documento );

        /*if(  $document_number AND $document_number !== $parametros->numero_documento  ){

            return [

                'title' => 'Atención',
                'text'  => 'El DNI ya se encuentrá registrado, intente con otro DNI',
                'icon'  => 'warning'

            ];    

             return false;  
        }


        if(  $correo AND $correo !==  $parametros->correo ){

            return [

                'title' => 'Atención',
                'text'  => 'El correo ya se encuentrá registrado, intente con otro correo.',
                'icon'  => 'warning'

            ];

            return false;    

        }*/



        User::where('id',$parametros->id)
        ->update([

            'nombres' => $parametros->nombres,
            'apellidos' => $parametros->apellidos,
            'document_number' => $parametros->numero_documento,
            'email' => $parametros->correo,

        ]);

        return [

            'title' => 'Buen Trabajo',
            'text'  => 'Usuario Actualizado',
            'icon'  => 'success'

        ];


    }


    public static function validacionCorreo($correo){

        $result = User::where('email',$correo)->first();

        if( $result ){

            return true;
        }else{

            return false;
        }

    }


    public static function validacionDocumento($numero_documento){

        $result = User::where('document_number',$numero_documento)->first();

        if( $result ){

            return true;
        }else{

            return false;
        }


    }





}
