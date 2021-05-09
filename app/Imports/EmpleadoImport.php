<?php

namespace App\Imports;

use Maatwebsite\Excel\Concerns\ToModel;
use Maatwebsite\Excel\Concerns\WithStartRow;
use Carbon\Carbon;
use App\Empleado;

class EmpleadoImport implements ToModel, WithStartRow
{


    public function startRow(): int
    {
        return 2;
    }


    public function model(array $row)
    {
    	$a = $row[0];
    	$b = $row[1];
    	$c = $row[2];
    	$d = $row[3];
    	$e = Carbon::parse( $row[4] )->format('Y-m-d');
    	$f = $row[5];

    	Empleado::updateOrCreate(

    		[
    			'name'=>$a,
    		],
    		[

	    		'position'=>$b,
	    		'office'=>$c,
	    		'age'=>$d,
	    		'start_date'=>$e,
	    		'salary'=>$f

    		]
    );
    	

    }


}
