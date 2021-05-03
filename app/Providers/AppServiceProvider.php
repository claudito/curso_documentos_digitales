<?php

namespace App\Providers;

use Illuminate\Support\ServiceProvider;
use DB;

class AppServiceProvider extends ServiceProvider
{
    /**
     * Register any application services.
     *
     * @return void
     */
    public function register()
    {

        // Guardar valores de las configuraciones del sitio
        $configuraciones = DB::table('sitio_configuraciones')->get();


        foreach ($configuraciones as $key => $value) {

           \Config::set('sitio.' . $value->nombre, $value->valor);
           
        }



    }

    /**
     * Bootstrap any application services.
     *
     * @return void
     */
    public function boot()
    {
        //
    }
}
