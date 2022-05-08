<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use DB;

class FirmaDigital extends Model
{
    
    public static function getDatosFirma($id){

        $certificado = DB::table('firmas_digitales')->where('id',$id)->first();

        $texto  = "";
        $texto .= "Nif: ".$certificado->nif."\n";
        $texto .= "Código País: ".$certificado->codigo_pais."\n";
        $texto .= "Nombre Común: ".$certificado->nombre_comun."\n";
        $texto .= "Cargo: ".$certificado->cargo."\n";
        $texto .= "Número de Serie: ".$certificado->numero_serie."\n";
        $texto .= "Tipo de Certificado: ".$certificado->tipo_certificado."\n";
        $texto .= "Entidad Emisora: ".$certificado->entidad_emisora."\n";
        $texto .= "Fecha de Inicio:".$certificado->fecha_inicio."\n";
        $texto .= "Fecha de Fin: ".$certificado->fecha_fin."\n";

        return $texto;

    }

}
