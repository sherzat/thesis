<?php

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| This file is where you may define all of the routes that are handled
| by your application. Just tell Laravel the URIs it should respond
| to using a Closure or controller method. Build something great!
|
*/

Route::get('/', 'PagesController@getIndex');

Route::get('about', 'PagesController@getAbout');

Route::get('contact', 'PagesController@getContact');
Route::get('/storedata', 'QuestionController@store');

Route::resource('self_assessment', 'Self_assessmentController');


Route::get('databaseTest', function(){
	if (DB::connection()->getDatabaseName())
	{
		echo 'connection successfully to database '.DB::connection()->getDatabaseName();
	}
});

Auth::routes();

Route::get('/home', 'HomeController@index');
