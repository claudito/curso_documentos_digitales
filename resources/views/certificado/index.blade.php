@extends('layouts.app')

@section('title')
Certificados
@endsection

@section('content')
	<div class="container-fluid">
		<div class="row">
			<div class="col-md-12">

				<button class="btn btn-primary btn-sm btn-generar">Generar Certificados</button>
				<br><br>

				<div class="table-responsive">
					<table id="consulta" class="table" style="font-size: 12px">
						<thead>
							<tr>
								<th>Id</th>
								<th>Empresa</th>
								<th>Ruc</th>
								<th>Trabajador</th>
								<th>Dni</th>
								<th>Cargo</th>
								<th>Fecha de Ingreso</th>
								<th>Fecha de Cese</th>
								<th>Correo</th>
								<th>PDF</th>
								<th>Correo</th>
								<th></th>
							</tr>
						</thead>
					</table>
				</div>
			</div>
		</div>
	</div>
@endsection

@section('scripts')

    <script>
        
    	function loadData(){

			$('#consulta').DataTable({

				language:{

					url:'{{ asset('js/spanish.json')  }}'

				},
				destroy:true,
				bAutoWidth: false,
				deferRender:true,
				bProcessing: true,
				iDisplayLength: 25,
				ajax:{

					url:'{{ route('certificados.index') }}',
					type:'GET'
				},
				columns:[

					{data:'id','className':'style_td'},
					{data:'empresa','className':'style_td'},
					{data:'ruc','className':'style_td'},
					{data:'trabajador','className':'style_td'},
					{data:'dni','className':'style_td'},
					{data:'cargo','className':'style_td'},
					{data:'fecha_ingreso','className':'style_td'},
					{data:'fecha_cese','className':'style_td'},
					{data:'correo','className':'style_td'},
					{data:null,render:function(data){

						if( data.estado_pdf == 0 ){

							return `<i data-toggle="tooltip" data-placement="bottom" title="Pendiente de Envio" class="fa fa-check-circle fa-2x"></i>`;
						}else{
							return `<i data-toggle="tooltip" data-placement="bottom" title="Generado" class="fa fa-check-circle fa-2x text-success"></i>`;
						}

					}},
					{data:null,render:function(data){

						if( data.estado_correo == 0 ){

							return `<i data-toggle="tooltip" data-placement="bottom" title="Pendiente de Envio" class="fa fa-check-circle fa-2x"></i>`;
						}else{
							return `<i data-toggle="tooltip" data-placement="bottom" title="Enviado" class="fa fa-check-circle fa-2x text-success"></i>`;
						}

					}},
					{data:null,render:function(data){

						if( data.estado_pdf == 1 ){

							return `<a href="{{ env('DO_URL') }}/${data.url_documento}" target="_blank"><i class="fa fa-search fa-2x"></i></a>`;
						}else{
							return ``;
						}

					}}

				]

			});

    	}

    	loadData();

    	//Cargar Modal Generar Certificados
    	$(document).on('click','.btn-generar',function(e){

			Swal.fire({
			  title: 'Generar Certificados Digitales',
			  text: "...",
			  imageUrl: '{{ asset('img/tcpdf_signature.png') }}',
			  showCancelButton: true,
			  confirmButtonColor: '#3085d6',
			  cancelButtonColor: '#d33',
			  confirmButtonText: 'Confirmar',
			  cancelButtonText:'Cancelar',
			}).then((result) => {
			  if (result.isConfirmed) {

			  	$.ajax({

			  		url:'{{ route('certificados.store') }}',
			  		type:'POST',
			  		data:{'_token':'{{ csrf_token() }}'},
			  		dataType:'JSON',
			  		beforeSend:function(){

			  			Swal.fire({

			  				title:'Generando Certificados',
			  				text :'Espere un momento',
			  				imageUrl:'{{ asset('img/loader.gif') }}',
			  				showConfirmButton:false
								  				
			  			});

			  		},
			  		success:function(data){

			  			loadData();

			  			Swal.fire({

			  				title:data.title,
			  				text:data.text,
			  				icon:data.icon,
			  				showConfirmButton:true

			  			});

			  		}

			  	});


			  }
			});


    		e.preventDefault();
    	})

    </script>

@endsection