<?php

namespace App\Services;

use DB;

class Helper 
{
    
	public function configCorreo($id = 1){

		 $configuracion_correo = DB::table('configuracion_correo')->where('id',$id)->first();

          $config = [

              'driver' => $configuracion_correo->driver,
              'host' => $configuracion_correo->host,
              'port' => $configuracion_correo->port,
              'username' => $configuracion_correo->username,
              'password' => $configuracion_correo->password,
              'encryption'=> $configuracion_correo->encryption,
              'from' => [

                  'address' => $configuracion_correo->address,
                  'name' =>  $configuracion_correo->name
              ],
              'email_reply' => $configuracion_correo->email_reply,
              'email_cc'    => $configuracion_correo->email_cc

          ];

          return $config;

	}


}
