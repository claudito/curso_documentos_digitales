<?php 

Route::middleware('auth','role:admin')->group(function(){//Seguridad

	Route::prefix('mantenimientos')->group(function(){//Visual/Organización

		//Documentos
		Route::get('documentos','DocumentoController@index')->name('documentos.index');

		//Usuario
		Route::resource('usuario','UserController');

	});

});

