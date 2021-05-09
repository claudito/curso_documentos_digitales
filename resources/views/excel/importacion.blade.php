@extends('layouts.app')
@section('title')
Importación
@endsection

@section('content')
	<div class="container-fluid">
		<div class="row">
			<div class="col-md-12">

				<div class="card">
					<div class="card-header">Importación</div>
					<div class="card-body">

						<button class="btn btn-sm btn-primary btn-importar"><i class="fa fa-upload"></i>  Importar</button>
						<a  class="btn btn-sm btn-success" target="_blank" href="{{ route('importacion.export') }}"><i class="fa fa-download"></i> Exportar</a>
						<br><br>

						<div class="table-responsive">
							<table class="table" id="consulta">
								<thead>
									<tr>
										<th>Name</th>
										<th>Position</th>
										<th>Office</th>
										<th>Age</th>
										<th>Start Date</th>
										<th>Salary</th>
									</tr>
								</thead>
							</table>
						</div>
						
					</div>
				</div>

			</div>
		</div>
	</div>

	<!-- Modal Importar-->
	<form id="importar" autocomplete="off">
		<div class="modal fade" id="modal-importar" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
		  <div class="modal-dialog">
		    <div class="modal-content">
		      <div class="modal-header">
		        <h5 class="modal-title" id="exampleModalLabel">Modal title</h5>
		        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
		          <span aria-hidden="true">&times;</span>
		        </button>
		      </div>
		      <div class="modal-body">

		      	@csrf
		       	
		       	<div class="form-group">
		       		<label>Archivo Excel</label>
		       		<input type="file" name="archivo" required class="form-control">
		       	</div>

		      </div>
		      <div class="modal-footer">
		        <button type="button" class="btn btn-secondary" data-dismiss="modal">Cerrar</button>
		        <button type="submit" class="btn btn-primary">Importar</button>
		      </div>
		    </div>
		  </div>
		</div>
	</form>

@endsection

@section('scripts')
    <script>

    	function loadData(){

    		$('#consulta').DataTable({

    			destroy:true,
    			ajax:{

    				url:'{{ route('importacion.index') }}',
    				type:'GET'
    			},
    			columns:[

    				{data:'name'},
    				{data:'position'},
    				{data:'office'},
    				{data:'age'},
    				{data:'start_date'},
    				{data:'salary'}

    			]

    		});


    	}

    	loadData();
        	
        //Cargar Modal Importar
        $(document).on('click','.btn-importar',function(e){

        	$('.modal-title').html('Importar Archivo');
        	$('#modal-importar').modal('show');
        });


        //Importacion
        $(document).on('submit','#importar',function(e){

        	parametros = new FormData(this);

        	$.ajax({

        		url:'{{ route('importacion.upload') }}',
        		type:'POST',
        		data:parametros,
        		dataType:'JSON',
				contentType: false,
				cache: false,
				processData:false,
        		beforeSend:function(){

				Swal.fire({

					title:'Importando Datos',
					text :'Espere un momento...',
					imageUrl:'{{ asset('img/loader.gif') }}',
					showConfirmButton:false

				});


        		},
        		success:function(data){

					Swal.fire({

						title : data.title,
						text  : data.text,
						icon  : data.icon,
						timer : 3000,
						showConfirmButton:false

					});

					loadData();
					$('#modal-importar').modal('hide');
					$('#importar')[0].reset();


        		}

        	});

        	e.preventDefault();
        })

    </script>
@endsection