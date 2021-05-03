<?php

namespace App\Console\Commands;

use Illuminate\Console\Command;
use App\Mail\EnviarCertificado as EnviarCertificadoCorreo;
use DB;
use Illuminate\Support\Facades\Mail;
use App\Services\Helper;

class EnviarCertificado extends Command
{
    /**
     * The name and signature of the console command.
     *
     * @var string
     */
    protected $signature = 'documento:enviar_certificado';

    /**
     * The console command description.
     *
     * @var string
     */
    protected $description = 'Command description';

    /**
     * Create a new command instance.
     *
     * @return void
     */
    public function __construct()
    {
        parent::__construct();
    }

    /**
     * Execute the console command.
     *
     * @return int
     */
    public function handle()
    {

        $certificados = DB::table('certificados')
        ->where('estado_pdf',1)
        ->where('estado_correo',0)
        ->whereRaw(" IFNULL(url_documento,'')!=''  ")
        ->limit( config('sitio.limit_envio_correo')  )
        ->get();

        if( count($certificados) == 0  ){

            echo "La lista esta vacía no hay documentos pendientes de envío"."\n";

            return false;
        }

        $helper = new Helper();

        foreach ($certificados as $key => $value) {
                
            //Enviar correo
            \Config::set('mail', $helper->configCorreo() );
            Mail::to( $value->correo  )->send( new EnviarCertificadoCorreo( $value ) );
            echo "Correo Enviado: =>".$value->trabajador."\n";

            DB::table('certificados')->where('id',$value->id)->update(['estado_correo'=>1]);

        }



    }
}
