<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;

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

Route::group(['prefix' => 'users', 'middleware' => 'cors'], function($route) {

    Route::post('/register', '\App\Http\Controllers\UsersController@register');
    Route::post('/login', '\App\Http\Controllers\UsersController@login');
    Route::post('/logout', '\App\Http\Controllers\UsersController@logout');
    Route::get('/lists', '\App\Http\Controllers\UsersController@userslist');
    Route::post('/transactions', '\App\Http\Controllers\UsersController@transactions');
    Route::post('/credit', '\App\Http\Controllers\UsersController@credit');
    Route::post('/debit', '\App\Http\Controllers\UsersController@debit');
});
