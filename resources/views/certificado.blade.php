<!DOCTYPE html>
<html lang="es">
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>Certificado</title>
	<style>
		
		html{

		margin:0; 
		padding:0; 
		height:100%; 
		width: 100%;
		font-family: 'Arial Narrow','Arial','Helvetica','sans-serif';

		}


		body
		{
		font-family: Arial, Helvetica, sans-serif;
		margin: 4mm 2mm 3mm 3mm; 
		/*     top down izq der */
		font-size: 14px;

		}

	</style>

</head>
<body>

	<h1 style="text-align: center;">Certificado</h1>

	<p style="text-align: right;padding-right: 30px">Lima, 24 de Abril del 2021</p>

	<p  style="text-decoration: underline;padding-left: 40px">Por medio de la Presente certificamos:</p>

	<p style="padding-left: 40px;padding-left: 30px">Por medio de la presente {{ $value->empresa }} con ruc {{ $value->ruc }} certifica que el(ella) Señor(a). {{  $value->trabajador }}  laboró en la empresa desde {{ $value->fecha_ingreso }} hasta el {{ $value->fecha_cese }} desempeñado el cargo de {{ $value->cargo }}.</p>

	<p style="padding-left: 40px;padding-left: 30px">Durante ese tiempo, demostró eficiencia y puntualidad en el desempeño de sus funciones.</p>


	
</body>
</html>