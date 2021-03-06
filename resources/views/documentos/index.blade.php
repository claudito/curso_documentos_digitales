@extends('layouts.app')

@section('title')
Documentos
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
								<th>Descripcion</th>
								<th>Tipo</th>
								<th>Estado</th>
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

			url:'{{ route('documentos.index') }}',
			type:'GET'

		},
		columns:[

			{ data:'id' },
			{ data:'descripcion'},
			{ data:'tipo'},
			{ data:'estado'},
			{ data:'fecha_creacion'}

		]


	});


    </script>

@endsection