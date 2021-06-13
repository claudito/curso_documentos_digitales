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
								<th>Backup</th>
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

			{ data:null }

		]


	});


    </script>

@endsection