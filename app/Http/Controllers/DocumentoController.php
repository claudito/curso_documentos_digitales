<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Documento;
use Illuminate\Support\Facades\DB;

class DocumentoController extends Controller
{
    //
	public function index(Request $request){

		if( $request->ajax() ){

			$result = Documento::select(DB::raw("

				id,
				descripcion,
				tipo,
				estado,
				DATE_FORMAT(created_at,'%d/%m/%Y %H:%i:%s') fecha_creacion

			"))
			->get();

			return [ 'data' => $result ];

		}

		return view('documentos.index');

	}



}
