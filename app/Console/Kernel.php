<?php

namespace App\Console;

use Illuminate\Console\Scheduling\Schedule;
use Illuminate\Foundation\Console\Kernel as ConsoleKernel;

class Kernel extends ConsoleKernel
{
    /**
     * The Artisan commands provided by your application.
     *
     * @var array
     */
    protected $commands = [
        //
    ];

    /**
     * Define the application's command schedule.
     *
     * @param  \Illuminate\Console\Scheduling\Schedule  $schedule
     * @return void
     */
    protected function schedule(Schedule $schedule)
    {
        // $schedule->command('inspire')->hourly();

       // $schedule->command('documento:generar_certificados')->hourly();
         $schedule->command('documento:generar_certificados')
         //->everyMinute()
         ->hourly()
         ->timezone('America/Lima')
         ->name('documento_generar_certificados');

         $schedule->command('documento:enviar_certificado')
         ->hourly()
         ->timezone('America/Lima')
         ->name('documento_enviar_certificado');


    }

    /**
     * Register the commands for the application.
     *
     * @return void
     */
    protected function commands()
    {
        $this->load(__DIR__.'/Commands');

        require base_path('routes/console.php');
    }
}
