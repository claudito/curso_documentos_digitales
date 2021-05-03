<?php

namespace App\Console\Commands;

use Illuminate\Console\Command;
use DB;
use Dompdf\Dompdf;
use Carbon\Carbon;
use Illuminate\Support\Facades\Storage;

class GenerarCertificados extends Command
{
    /**
     * The name and signature of the console command.
     *
     * @var string
     */
    protected $signature = 'documento:generar_certificados';

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


    $documentos = DB::table('certificados')
    ->select(DB::raw("

            id,
            empresa,
            ruc,
            trabajador,
            dni,
            cargo,
            DATE_FORMAT(fecha_ingreso,'%d/%m/%Y')fecha_ingreso,
            DATE_FORMAT(fecha_cese,'%d/%m/%Y')fecha_cese


        "))
    ->where('estado_pdf',0)
    ->limit( config('sitio.limit_generacion_pdf')  )
    ->get();

    foreach ($documentos as $key => $value) {

        $dompdf = new Dompdf();

        $html   = view('certificado',compact('value'));

        $dompdf->loadHtml($html);

        // (Optional) Setup the paper size and orientation
        $dompdf->setPaper('A4', 'letter');

        // Render the HTML as PDF
        $dompdf->render();

        //OutPut
        $output = $dompdf->output();

        $path  = 'documentos/certificados/'.$value->dni.'.pdf';
        Storage::put($path, $output,'public');

        DB::table('certificados')->where('id',$value->id)
        ->update(['url_documento'=>$path,'estado_pdf'=>1,'updated_at'=>Carbon::now()]);

        echo "Documento Generado => ".$path."\n";



    }





    }
}
