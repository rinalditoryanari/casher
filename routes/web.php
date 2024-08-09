<?php

use App\Http\Controllers\OrderController;
use App\Http\Controllers\ProductController;
use App\Models\Product;
use App\Models\Promo;
use Illuminate\Support\Facades\Route;

 Route::get('/', function () {
     return view('welcome');
 });
