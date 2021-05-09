<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use DB;
use Auth;
use Carbon\Carbon;
use Maatwebsite\Excel\Facades\Excel;
use App\Imports\EmpleadoImport;
use App\Exports\EmpleadoExport;
use App\Exports\EmpleadoViewExport;
use App\Empleado;

class ImportacionController extends Controller
{
    function index(Request $request){

    	if( $request->ajax() ){

    		$empleado = Empleado::all();

    		return ['data'=>$empleado];
    	}

    	return view('excel.importacion');
    }

    function upload(Request $request){

    	//dd( $request->all() );
    	Excel::import(new EmpleadoImport, request()->file('archivo'));

    	return [

    		'title'=>'Buen Trabajo',
    		'text' =>'Imformación Actualizada',
    		'icon' =>'success'

    	];


    }

    function export(Request $request){

    	return Excel::download(new EmpleadoViewExport, 'empleado.xlsx');

    }



}
