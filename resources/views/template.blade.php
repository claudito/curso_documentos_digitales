<!DOCTYPE html>
<html lang="es">
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>Pdf de Prueba</title>
</head>
<body>

	<h1>Este es un pdf firmado digitalmente</h1>
	<p>Lorem, ipsum dolor sit amet consectetur adipisicing elit. Alias inventore quos neque eos dignissimos nam, natus quibusdam, labore consectetur at voluptatem culpa temporibus sequi, corrupti et corporis? Sit, ratione, pariatur.</p>
	<p>Lorem ipsum dolor sit amet consectetur adipisicing, elit. Perferendis, dolor aliquam. Voluptates fugiat animi iste minus ut tempora quaerat id impedit asperiores ipsum dolorum qui, dolorem, consectetur neque minima architecto.</p>
	<p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Saepe repellendus, laborum corrupti vero eligendi quaerat, placeat quos dolorum voluptatem ipsa veritatis dolor a beatae natus, quasi rerum laboriosam alias. Ullam?</p>

	<br>
	<br>



	<p>Firnado digitalmente por<br>{{ $firma->nombre_comun }}<br>{{ $firma->cargo }}<br>Fecha: {{ $fecha_actual  }}</p>
	
</body>
</html>