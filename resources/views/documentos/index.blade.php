<!DOCTYPE html>
<html lang="es">
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>Documentos</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css" integrity="sha384-B0vP5xmATw1+K9KRQjQERJvTumQW0nPEzvF6L/Z6nronJ3oUOFUFpCjEUQouq2+l" crossorigin="anonymous">

<!-- Bootstrap 4 -->
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-Piv4xVNRyMGpqkS2by6br4gNJ7DXjqk09RmUpJ8jgGtD7zP9yug3goQfGII0yAns" crossorigin="anonymous"></script>

<!-- DataTable -->
<script src="https://cdn.datatables.net/1.10.24/js/jquery.dataTables.min.js"></script>
<script src="https://cdn.datatables.net/1.10.24/js/dataTables.bootstrap4.min.js"></script>

<link rel="stylesheet" href="https://cdn.datatables.net/1.10.24/css/dataTables.bootstrap4.min.css">

</head>
<body>
	
	<div class="container">
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

<script>
	
	$('#consulta').DataTable({

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
</body>
</html>