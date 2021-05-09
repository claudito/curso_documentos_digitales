<?php

namespace App\Exports;

use Maatwebsite\Excel\Concerns\FromCollection;
use Maatwebsite\Excel\Concerns\WithHeadings;
use Maatwebsite\Excel\Concerns\ShouldAutoSize;
use App\Empleado;
use DB;

class EmpleadoExport implements FromCollection,WithHeadings, ShouldAutoSize
{
    /**
    * @return \Illuminate\Support\Collection
    */

    public function headings(): array
    {
        return [
        	'id',
            'Name',
            'Position',
            'Office',
            'Age',
            'Start Date',
            'Salary'
        ];
    }


    public function collection()
    {	
    	$result = Empleado::select(DB::raw("  id,name,position,office,age,start_date,salary "))->get();

    	//dd( $result->toArray() );

        return $result;
    }
}
