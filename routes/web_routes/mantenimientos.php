<?php 

Route::middleware('auth','role:admin')->group(function(){//Seguridad

	Route::prefix('mantenimientos')->group(function(){//Visual/Organización

		//Certificados
		Route::resource('certificados','CertificadoController');

		//Documentos
		Route::get('documentos','DocumentoController@index')->name('documentos.index');

		//Usuario
		Route::resource('usuario','UserController');

		//Import
		Route::get('importacion/export','ImportacionController@export')->name('importacion.export');
		Route::post('importacion/upload','ImportacionController@upload')->name('importacion.upload');
		Route::get('importacion','ImportacionController@index')->name('importacion.index');


		//Backup
		Route::resource('backup','BackupController');


	});

});

