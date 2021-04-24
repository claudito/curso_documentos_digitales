<!DOCTYPE html>
<html lang="es">
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>Spaces</title>
</head>
<body>

	<form action="{{ route('spaces.subir') }}"  method="POST" enctype="multipart/form-data" >
			
		@csrf

		<label>Archivo</label>
		<input type="file" name="archivo" required> <br>

		<label>Ubicación</label>
		<input type="text" name="ubicacion" required> <br>

		<button>Subir</button>


	</form>
	
</body>
</html>