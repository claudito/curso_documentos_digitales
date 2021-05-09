<!DOCTYPE html>
<html lang="es">
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>Document</title>
</head>
<body>
	
	<table >
		<thead>
			<tr>
				<th colspan="6">Lista de Empleados</th>
			</tr>
		</thead>
		<thead>
			<tr>
				<th style="background-color: blue;color:white" >Name</th>
				<th style="background-color: blue;color:white" >Position</th>
				<th style="background-color: blue;color:white" >Office</th>
				<th style="background-color: blue;color:white" >Age</th>
				<th style="background-color: blue;color:white" >Start Date</th>
				<th style="background-color: blue;color:white" >Salary</th>
			</tr>
		</thead>
		<tbody>
			@foreach( $result as $key => $value )
				<tr>
					<td>{{ $value->name  }}</td>
					<td>{{ $value->position  }}</td>
					<td>{{ $value->office  }}</td>
					<td>{{ $value->age  }}</td>
					<td>{{ $value->start_date  }}</td>
					<td>{{ $value->salary  }}</td>
				</tr>
			@endforeach
		</tbody>
	</table>


</body>
</html>