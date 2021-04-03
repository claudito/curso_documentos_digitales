<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Message extends Model
{

    protected $hidden = [
        'id', 'created_at','updated_at'
    ];


	public static function getMessage($id){

		$result = Message::where('id',$id)->first()->toArray();

		return $result;

	}


}
