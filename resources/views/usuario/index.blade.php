@extends('layouts.app')

@section('title')
Usuarios
@endsection

@section('content')
	<div class="container-fluid">
		<div class="row">
			<div class="col-md-12">

				<button class="btn btn-primary btn-agregar"><i class="fa fa-plus"></i> Agregar</button> <br><br>

				<div class="table-responsive">
					<table id="consulta" class="table">
						<thead>
							<tr>
								<th>Id</th>
								<th>Nombres</th>
								<th>Apellidos</th>
								<th>Correo</th>
								<th>N° de Documento</th>
								<th>Fecha de Creación</th>
								<th>Acciones</th>
							</tr>
						</thead>
					</table>
				</div>
			</div>
		</div>
	</div>

	<!-- Modal Agregar/Actualizar -->
	<form id="registro" autocomplete="off">
		<div class="modal fade" id="modal-registro" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
		  <div class="modal-dialog modal-lg">
		    <div class="modal-content">
		      <div class="modal-header">
		        <h5 class="modal-title" id="exampleModalLabel">Modal title</h5>
		        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
		          <span aria-hidden="true">&times;</span>
		        </button>
		      </div>
		      <div class="modal-body">

		      	<input type="hidden" name="_token" value="{{ csrf_token() }}">

		      	<input type="hidden" name="id" class="id">

		      	<div class="form-row">

			     	<div class="form-group col-md-6">
			     		<label>Nombres</label>
			     		<input type="text" name="nombres" class="nombres form-control" required>
			     	</div>

			     	<div class="form-group col-md-6">
			     		<label>Apellidos</label>
			     		<input type="text" name="apellidos" class="apellidos form-control" required>
			     	</div>

		      	</div>

		      	<div class="form-row">

			     	<div class="form-group col-md-6">
			     		<label>N° de Documento</label>
			     		<input type="number" name="numero_documento" class="numero_documento form-control" required>
			     	</div>

			     	<div class="form-group col-md-6">
			     		<label>Correo</label>
			     		<input type="email" name="correo" class="correo form-control" required>
			     	</div>

		      	</div>

		      </div>
		      <div class="modal-footer">
		        <button type="button" class="btn btn-secondary" data-dismiss="modal">Cerrar</button>
		        <button type="submit" class="btn btn-primary btn-submit">Save changes</button>
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
				{ data:'email' },
				{ data:'document_number' },
				{ data:'created_at' },
				{ data:null,render:function(data){

					if( data.active == 1 ){

						btn_active = `<button 
						data-id = "${data.id}"
						data-active = "${data.active}";
						class="btn btn-success btn-sm btn-delete"><i class="fa fa-thumbs-up"></i></button>`;

					}else{

						btn_active = `<button 
						data-id = "${data.id}"
						data-active = "${data.active}";
						class="btn btn-danger btn-sm btn-delete"><i class="fa fa-thumbs-down"></i></button>`;
					}


					return `

						<button 
						data-id = "${data.id}"
						class="btn btn-primary btn-sm btn-edit"><i class="fa fa-pencil"></i></button>

						${btn_active}
				
					`;

				}}

			]


		});

	}


	loadData();


	//Cargar Modal Agregar
	$(document).on('click','.btn-agregar',function(){

		$('#registro')[0].reset();

		$('.modal-title').html('Agregar Usuario');
		$('.btn-submit').html('Agregar');
		$('#modal-registro').modal('show');

	});


	//Cargar Modal Actualizar
	$(document).on('click','.btn-edit',function(){

		$('#registro')[0].reset();

		id =  $(this).data('id');

		var url_edit = '{{ route("usuario.edit", ":id") }}';
		url_edit 	 = url_edit.replace(':id', id);

		//Cargar Datos
		$.ajax({

			url:url_edit,
			type:'GET',
			data:{},
			dataType:'JSON',
			success:function(result){

				$('.nombres').val('').val( result.nombres );
				$('.apellidos').val('').val( result.apellidos );
				$('.correo').val('').val( result.email );
				$('.numero_documento').val('').val( result.document_number);
				$('.id').val('').val( result.id );



			}


		});



		$('.modal-title').html('Actualizar Usuario');
		$('.btn-submit').html('Actualizar');
		$('#modal-registro').modal('show');

	});


	//Registro
	$(document).on('submit','#registro',function(e){

		parametros = $(this).serialize();

		$.ajax({

			url:'{{ route('usuario.store')  }}',
			type:'POST',
			data:parametros,
			dataType:'JSON',
			beforeSend:function(){

				Swal.fire({

					title:'Cargando',
					text :'Espere un momento...',
					imageUrl:'{{ asset('img/loader.gif') }}',
					showConfirmButton:false

				});

			},
			success:function(result){

				if( result.icon == 'success' ){

					loadData();
					$('#modal-registro').modal('hide');

				}


				Swal.fire({

					title : result.title,
					text  : result.text,
					icon  : result.icon,
					timer : 3000,
					showConfirmButton:false

				});


			}


		});



		e.preventDefault();
	});



	//Cargar Modal Eliminar
	$(document).on('click','.btn-delete',function(){

		id =  $(this).data('id');
		active = $(this).data('active');

		Swal.fire({
		  title: 'Activar/Desactivar',
		  text: "Está opción cambiará el estado del Usuario ",
		  icon: 'warning',
		  showCancelButton: true,
		  confirmButtonColor: '#3085d6',
		  cancelButtonColor: '#d33',
		  confirmButtonText: 'Confirmar',
		  cancelButtonText : 'Cancelar',
		}).then((result) => {
		  if (result.isConfirmed) {

			var url_destroy = '{{ route("usuario.destroy", ":id") }}';
			url_destroy 	= url_destroy.replace(':id', id);

		  	$.ajax({

		  		url:url_destroy,
		  		type:'DELETE',
		  		data:{'id':id,'active':active,'_token':'{{ csrf_token() }}'},
		  		dataType:'JSON',
		  		beforeSend:function(){

					Swal.fire({

						title:'Cargando',
						text :'Espere un momento...',
						imageUrl:'{{ asset('img/loader.gif') }}',
						showConfirmButton:false

					});


		  		},
		  		success:function(result){


				if( result.icon == 'success' ){

					loadData();

				}


				Swal.fire({

					title : result.title,
					text  : result.text,
					icon  : result.icon,
					timer : 3000,
					showConfirmButton:false

				});


		  		}


		  	});


		  }

		});



	});


    </script>

@endsection