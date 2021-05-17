<?php 
use Spatie\Permission\Models\Role;
use Spatie\Permission\Models\Permission;
use App\User;
use Illuminate\Support\Facades\Storage;
use Illuminate\Http\Request;
use Dompdf\Dompdf;
use Carbon\Carbon;
use Illuminate\Support\Facades\Mail;
use App\Mail\EnviarCertificado;
use Greenter\XMLSecLibs\Certificate\X509Certificate;
use Greenter\XMLSecLibs\Certificate\X509ContentType;
use Elibyy\TCPDF\Facades\TCPDF as PDFSignature;


Route::get('pruebas/roles_permisos',function(){

	//Crear Rol
	//$role = Role::create(['name' => 'invitado']);

	//Permiso
	//$permission = Permission::create(['name' => 'Reportes']);

	//Role - Permiso

	//$role = Role::where('name','admin')->first();

	//$role->givePermissionTo(2);
	//$role->givePermissionTo(2);

	//Permiso -  Role
	//$permission = Permission::where('name','Reportes')->first();
	//$permission->assignRole(1);


	//Asignacion Multiple Roles - Permisos
	//$permisos = [1,2,3];
	//$role = Role::where('name','usuario')->first();
	//$role->syncPermissions( $permisos );


	//Asignacion Multiple Permisos - Roles
	//$roles = [1,3];
	//$permission = Permission::where('name','Reportes')->first();
	//$permission->syncRoles($roles);

	//Eliminar Permisos
	//$role = Role::where('name','usuario')->first();
	//$role->revokePermissionTo(1);


	//Usuarios y Permisos
	//$user = User::where('id',1)->first();

	//Asignar Permiso
	//$user->givePermissionTo(3);

	//Asignar Permisos Multiples
	//$permisos = [1,3,2];
	//$user->givePermissionTo($permisos);


	//Eliminar Permisos
	//$user->revokePermissionTo(3);


	//Roles
	//$user = User::where('id',3)->first();
		
	//Asignacion
	//$user->assignRole('usuario');

	//Asignacion Multiple
	//$roles = [1,21,31,6];
	//$user->assignRole($roles);

	//validar si tiene el rol
	//dd( $user->hasRole($roles) );



	//Consultas
	//$user = User::where('id',3)->first();

	//Array de Objetos
	//$user->getPermissionNames();

	//Array Simple
	// $user->permissions; 
	
	//model_has_permissions
	//$user->getDirectPermissions();

	//role_has_permissions
	//$user->getPermissionsViaRoles();

	//Todos los permisos
	//return $user->getAllPermissions();
	//$users = User::role(2)->get();
	//$users = User::permission('Reportes')->get();

	/*$users = User::select(DB::raw("

		*
	"))
	->join('model_has_roles',function($join){

		$join->on('users.id','=','model_has_roles.model_id');

	})
	->where('model_has_roles.role_id',2)
	->get();
	*/
	//return $users;

});


Route::get('pruebas/spaces/test',function(){

	$ubicacion =  "imagenes/assets";

	$files 	  =  Storage::disk('spaces')->files( $ubicacion );

	foreach ($files as $key => $value) {
		
		echo env('DO_URL').'/'.$value."<br>";
	}

});


Route::get('pruebas/spaces/index',function(){

	return view('spaces');

});

Route::post('pruebas/spaces/subir',function(Request $request){

	$ubicacion = $request->ubicacion;

	$name      = $request->file('archivo')->getClientOriginalName();


	$path 	   = Storage::putFileAs(

	    $ubicacion, $request->file('archivo'), $name,'public'

	);


	dd( env('DO_URL').'/'.$path );


})->name('spaces.subir');


	Route::get('pruebas/dompdf',function(){

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
		->where('estado_pdf',0)->get();

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
			->update(['url_documento'=>$path,'updated_at'=>Carbon::now()]);

			echo "Documento Generado => ".$path."\n";



		}

	});


	Route::get('pruebas/correo',function(){

		$data = (object) [

			'trabajador'=>'Luis Claudio',
			'correo' => 'luis.claudio@perutec.com.pe'

		];

		//Enviar correo
		Mail::to( $data->correo  )->send( new EnviarCertificado( $data ) );


	});

	Route::get('pruebas/sitio_configuraciones',function(){


		$cc = explode(',', config('sitio.correos_copia') );

		dd( $cc );


	});


	Route::get('pruebas/pfx_a_pem',function(){

		$pfx = file_get_contents('firmas/46794282.pfx');
		$password = '********';

		$certificate = new X509Certificate($pfx, $password);
		$pem = $certificate->export(X509ContentType::PEM);
		    
		file_put_contents('certificate_46794282.pem', $pem);

		dd('okey');


	});


	Route::get('pruebas/firma_pdf',function(){

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

        // print a line of text

	    $texto_qr  = "NIF: Gerente - DNI 46794282"."\n";
	    $texto_qr .= "Código Pais: PE"."\n";
	    $texto_qr .= "Nombre Común: Luis Augusto Claudio Ponce"."\n";
	    $texto_qr .= "Número de Serie: 4FA147620A2810FD"."\n";
	    $texto_qr .= "Tipo de Certificado: DNI 46794282"."\n";
	    $texto_qr .= "Entidad Emisora: Llama.pe SHA256 Standard CA LLAMA.PE"."\n";
	    $texto_qr .= "Inicio: 14/05/2021"."\n";
	    $texto_qr .= "Fin: 14/05/2022"."\n";

	    $fecha_actual = Carbon::now()->format('Y-m-d H:i:s');
        $text = view('template_pdf',compact('texto_qr','firma','fecha_actual'));

        // add view content
        PDFSignature::writeHTML($text, true, 0, true, 0);

        // add image for signature
        //PDFSignature::Image('tcpdf.png', 180, 60, 15, 15, 'PNG');
        
        // define active area for signature appearance
        PDFSignature::setSignatureAppearance(180, 60, 15, 15);
        
        // save pdf file
        PDFSignature::Output(public_path('documento_prueba.pdf'), 'F');

        #Subir el archivo a Space DO
		//$file 	   = PDFSignature::Output('contrato.pdf','S');//PDF Firmado Digitalmente
		//$file_name =  "documento.pdf";
		//Storage::disk('spaces')->put($file_name, $file,'public');

        PDFSignature::reset();

        dd('pdf created');



	});


	Route::get('pruebas/qr',function(){

	    $texto_qr  = "NIF: Gerente - DNI 46794282"."\n";
	    $texto_qr .= "Código Pais: PE"."\n";
	    $texto_qr .= "Nombre Común: Luis Augusto Claudio Ponce"."\n";
	    $texto_qr .= "Número de Serie: 4FA147620A2810FD"."\n";
	    $texto_qr .= "Tipo de Certificado: DNI 46794282"."\n";
	    $texto_qr .= "Entidad Emisora: Llama.pe SHA256 Standard CA LLAMA.PE"."\n";
	    $texto_qr .= "Inicio: 14/05/2021"."\n";
	    $texto_qr .= "Fin: 14/05/2022"."\n";


	    return view('qr',compact('texto_qr'));

	});
