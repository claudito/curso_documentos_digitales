<?php

namespace App\Mail;

use Illuminate\Bus\Queueable;
use Illuminate\Contracts\Queue\ShouldQueue;
use Illuminate\Mail\Mailable;
use Illuminate\Queue\SerializesModels;

class EnviarCertificado extends Mailable
{
    use Queueable, SerializesModels;

    protected $data;

    /**
     * Create a new message instance.
     *
     * @return void
     */
    public function __construct( $data )
    {
        $this->data = $data;
    }

    /**
     * Build the message.
     *
     * @return $this
     */
    public function build()
    {   

        $cc = explode(',', config('sitio.correos_copia') );

        return $this->subject('Doc. Certificado.')
        ->from(config('sitio.from_correo'),'Perutec Academy')
        ->cc($cc)
        ->attachFromStorageDisk('spaces', $this->data->url_documento )
        ->view('mails.enviar_certificado',[

            'data'=>$this->data

        ]);


    }
}
