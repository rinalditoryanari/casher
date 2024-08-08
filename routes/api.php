<?php

use App\Http\Controllers\OrderController;
use App\Http\Controllers\ProductController;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;

Route::get('/user', function (Request $request) {
    return $request->user();
})->middleware('auth:sanctum');

Route::get('/', function () {
    return response()->json('asd');
});


Route::controller(ProductController::class)->group(function () {
    Route::get('/menu', 'index');
});


Route::controller(OrderController::class)->group(function () {
    Route::post('/order', 'create');
});
