<?php

namespace App\Console\Commands;

use Illuminate\Console\Command;
use PDF as PDFSignature;
use Carbon\Carbon;
use DB;
use Illuminate\Support\Facades\Storage;
use App\Models\FirmaDigital;

class GenerarCertificadosDigitales extends Command
{
    /**
     * The name and signature of the console command.
     *
     * @var string
     */
    protected $signature = 'documento:generar_certificados_digitales';

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

            $firma =  DB::table('firmas_digitales')->where('id',1)->first();

            // set certificate file
            $certificate = $firma->pem;

            // set additional information in the signature
            $info = array(
                'Name' => 'TCPDF',
                'Location' => 'Lima,Perú '.Carbon::now()->format('Y-m-d H:i:s'),
                'Reason' => 'Prueba de Firma de digital',
                'ContactInfo' => 'http://www.tcpdf.org',
            );

            // set document signature
            PDFSignature::setSignature($certificate, $certificate, 'tcpdfdemo', '', 2, $info);
            PDFSignature::SetFont('helvetica', '', 12);
            PDFSignature::SetTitle('Documento de Prueba');
            PDFSignature::AddPage();

            $fecha_actual = Carbon::now()->format('Y-m-d H:i:s');
            $text = view('certificado',compact('firma','fecha_actual','value'));

            // add view content
            PDFSignature::writeHTML($text, true, 0, true, 0);

            // add image for signature
            //PDFSignature::Image(public_path('img/tcpdf_signature.png'), 15, 5, 15, 15, 'PNG');
            
            // define active area for signature appearance
            PDFSignature::setSignatureAppearance(15, 5, 15, 15);

            // Add QRCODE,L
            $texto_qr = FirmaDigital::getDatosFirma(1);
                                                             // Left,Top,Ancho,largo 
            PDFSignature::write2DBarcode($texto_qr, 'QRCODE,L', 15, 5, 30, 30, [], 'N');

            // save pdf file
            #Subir el archivo a Space DO
            $file      = PDFSignature::Output($value->dni.'.pdf','S');//PDF Firmado Digitalmente
            $file_name =  "documentos/certificados/".$value->dni.".pdf";
            Storage::put($file_name, $file,'public');

            DB::table('certificados')->where('id',$value->id)
            ->update(['url_documento'=>$file_name,'estado_pdf'=>1,'updated_at'=>Carbon::now()]);

            //Reset
            PDFSignature::reset();

           // echo "PDF Generado".$value->trabajador."\n";


        }

    }
}
