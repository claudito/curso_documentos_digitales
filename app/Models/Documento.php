<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Documento extends Model
{
    //
	protected $table = "documentos";

	protected $guarded = ['id'];
	#Guarded solo inserta los registros requeridos por la tabla ( not null)

}
