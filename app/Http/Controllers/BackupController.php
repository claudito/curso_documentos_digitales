<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Storage;
use Carbon\Carbon;

class BackupController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index(Request $request)
    {
        if( $request->ajax() ){

            $directorio = "backup";
            $files      = Storage::files($directorio);

            $data       = [];

            foreach ($files as $key => $value) {

                $fecha_backup = str_replace(['.zip','backup/'], ['',''], $value);
                $fecha        = substr($fecha_backup, 0,10);
                $hora         = substr($fecha_backup,11,8);
                $hora         = str_replace(['-'], [':'], $hora);
                $formato      = Carbon::parse($fecha.' '.$hora )->format('d/m/Y H:i:s');
                
                $data[] = [

                    'id'    =>$key+1,
                    'nombre'=>$value,
                    'fecha' =>$formato

                ];
            }

            return ['data'=>$data ];
        }

        return view('backup.index');
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        //
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        $nombre =  $request->nombre;
        Storage::setVisibility($nombre,'public');

        return [

            'title' => 'Backup Generado',
            'text'  => '',
            'url'   => env('DO_URL').'/'.$nombre,
            'icon'  =>'success'

        ];

    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        //
    }
}
