@extends('layouts.app')

@section('title')
Usuarios
@endsection

@section('content')
	<div class="container-fluid">
		<div class="row">
			<div class="col-md-12">
				<div class="table-responsive">
					<table id="consulta" class="table">
						<thead>
							<tr>
								<th>Id</th>
								<th>Nombres</th>
								<th>Apellidos</th>
								<th>N° de Documento</th>
								<th>Fecha de Creación</th>
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
		ajax:{

			url:'{{ route('usuario.index') }}',
			type:'GET'

		},
		columns:[

			{ data:'id' },
			{ data:'nombres' },
			{ data:'apellidos' },
			{ data:'document_number' },
			{ data:'created_at' }

		]


	});


    </script>

@endsection