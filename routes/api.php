<?php

use Illuminate\Http\Request;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| is assigned the "api" middleware group. Enjoy building your API!
|
*/


Route::middleware('auth:api')->get('/contacts', 'ContactController@index');
Route::middleware('auth:api')->get('/contacts/{id}', 'ContactController@show');
Route::middleware('auth:api')->post('/contacts', 'ContactController@store');
Route::middleware('auth:api')->put('/contacts/{id}', 'ContactController@update');
Route::middleware('auth:api')->delete('/contacts/{id}', 'ContactController@destroy');