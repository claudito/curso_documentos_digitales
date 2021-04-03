<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class LogError extends Model
{
    //
	protected $table = "log_errors";
	protected $guarded = ['id'];

	public static function insert($code,$message){

		LogError::create([

			'code' => $code,
			'message' => $message

		]);

	}

}
