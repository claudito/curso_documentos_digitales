<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Documento;
use DB;
use Auth;

class DocumentoController extends Controller
{
    //
	public function index(Request $request){

		$user = Auth::user();

		//Auth::user()->id

		//dd( $user->id );
		//return $user->id;

		if( $request->ajax() ){

			$result = Documento::select(DB::raw("

				id,
				descripcion,
				tipo,
				estado,
				DATE_FORMAT(created_at,'%d/%m/%Y %H:%i:%s') fecha_creacion

			"))
			->where('user_id',$user->id)
			->get();

			return [ 'data' => $result ];

		}

		return view('documentos.index');

	}



}
