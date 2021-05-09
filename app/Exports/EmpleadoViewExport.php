<?php

namespace App\Exports;

use Illuminate\Contracts\View\View;
use Maatwebsite\Excel\Concerns\FromView;
use Maatwebsite\Excel\Concerns\ShouldAutoSize;
use App\Empleado;
use DB;

class EmpleadoViewExport implements FromView,ShouldAutoSize
{

    public function view(): View
    {   
        $result = Empleado::select(DB::raw("  id,name,position,office,age,start_date,salary "))->get();

        return view('excel.plantilla', [
            'result' => $result
        ]);
    }


}
