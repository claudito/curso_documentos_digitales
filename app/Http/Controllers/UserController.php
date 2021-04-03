<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\User;
use DB;
use Illuminate\Support\Facades\Hash;
use App\LogError;
use App\Message;

class UserController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index(Request $request)
    {
        
        if( $request->ajax() ){

            $result = User::select(DB::raw("

                id,
                nombres,
                apellidos,
                document_number,
                email,
                active,
                DATE_FORMAT(created_at,'%d/%m/%Y %H:%i:%s')fecha_creacion
            "))
            ->get();

            return ['data'=>$result];
        }

        return view('usuario.index');


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

        try {
            
            $user = User::where('id',$request->id)->first();

            if( $user ){

                //Validación de Correo
                $validacion_correo = ($user->email == $request->correo) ? false : true;

                if( $validacion_correo ){

                    $existe = User::where('email',$request->correo)->first();

                    if( $existe ){

                        return Message::getMessage(3);

                        return false;
                    }

                }

                //Validación de Documento
                $validacion_documento = ($user->document_number == $request->numero_documento) ? false : true;

                if( $validacion_documento ){

                    $existe = User::where('document_number',$request->numero_documento)->first();

                    if( $existe ){

                        return Message::getMessage(4);

                        return false;
                    }

                }

                $user->update([

                    'nombres' => $request->nombres,
                    'apellidos'=> $request->apellidos,
                    'numero_documento'=> $request->numero_documento,
                    'email' => $request->correo

                ]);

            return Message::getMessage(2);

            }else{


            $validacion_correo = User::where('email',$request->correo)->first();

            //dd( $validacion_correo );

            if( $validacion_correo ){

                return Message::getMessage(3);

                return false;
            }

           $validacion_documento = User::where('document_number',$request->numero_documento)->first();

            if( $validacion_documento ){

                return Message::getMessage(4);
                return false;
            }

                User::create([

                    'nombres' => $request->nombres,
                    'apellidos' => $request->apellidos,
                    'document_number' => $request->numero_documento,
                    'email' => $request->correo,
                    'password'=> Hash::make( $request->numero_documento )

                ]);

                return Message::getMessage(1);

            }


        } catch (\Illuminate\Database\QueryException $e) {

                LogError::insert($e->getCode(),$e->getMessage());

                return [

                    'title' => 'Error',
                    'text'  => $e->getCode(),
                    'icon'  => 'error'

                ];
            
        }catch(Exception $e){

                LogError::insert($e->getCode(),$e->getMessage());

                return [

                    'title' => 'Error',
                    'text'  => $e->geCode(),
                    'icon'  => 'error'

                ];

        }


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
    
        $result = User::where('id',$id)->first();

        return $result;

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
    public function destroy(Request $request,$id)
    {
        $active = ( $request->active == 0 ) ? 1 : 0 ;

        User::where('id',$id)->update(['active'=>$active]);

        return [

            'title' => 'Buen Trabajo',
            'text'  => 'Estado Actualizado',
            'icon'  => 'success'

        ];


    }
}
