<?php

use Illuminate\Support\Facades\Route;

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/


Route::get('/', function () {
    return view('welcome');
});

/*
GET
POST
PUT
DELETE
*/

//Home
Route::get('/home', 'HomeController@index')->name('home');

Auth::routes();


//Documentos
Route::get('documentos','DocumentoController@index')->name('documentos.index')->middleware('auth');

Route::resource('usuario','UserController')->middleware('auth');//usuario.index


