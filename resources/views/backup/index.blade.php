@extends('layouts.app')

@section('title')
Backups
@endsection

@section('content')
	<div class="container-fluid">
		<div class="row">
			<div class="col-md-12">
				<div class="table-responsive">
					<table id="consulta" class="table" style="font-size: 12px;">
						<thead>
							<tr>
								<th>Id</th>
								<th>Nombre</th>
								<th>Fecha de Creación</th>
								<th>Acciones</th>
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
        
	$('#consulta').DataTable({

		language:{

			url:'{{ asset('js/spanish.json')  }}'

		},
		order:[[0,'asc']],
		destroy:true,
		bAutoWidth: false,
		deferRender:true,
		iDisplayLength: 25,
		bProcessing: true,
		ajax:{

			url:'{{ route('backup.index') }}',
			type:'GET'

		},
		columns:[

			{ data:'id' },
			{ data:'nombre'},
			{ data:'fecha'},
			{ data:null,render:function(data){


				return `<button data-nombre="${data.nombre}" type="button" class="btn btn-primary btn-sm btn-export"><i class="fa fa-download" aria-hidden="true"></i></button>`;

			}}

		]


	});

	//Exportar
	$(document).on('click','.btn-export',function(e){

		nombre = $(this).data('nombre');
		
		$.ajax({

			url:'{{ route('backup.store') }}',
			type:'POST',
			data:{'nombre':nombre,'_token':'{{ csrf_token() }}' },
			dataType:'JSON',
			beforeSend:function(){

				Swal.fire({

					title:'Generando Archivo',
					text :'Espere un momento...',
					imageUrl:'{{ asset('img/loader.gif') }}',
					showConfirmButton:false

				});

			},
			success:function(data){

				Swal.fire({

					title:data.title,
					icon :data.icon,
					html :`<a href="${data.url}">Descargar Backup</a>`,
					showConfirmButton:false


				});


			}


		});

	});


    </script>

@endsection