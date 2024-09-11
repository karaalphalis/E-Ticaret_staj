<?php

use Illuminate\Support\Facades\Route;
use \App\Http\Controllers\FrontController;
Route::get('/', [FrontController::class , "index"]);
Route::get('/product-list', [FrontController::class , "productList"]);
Route::get('/product-detail', [FrontController::class , "productDetail"]);
Route::get('/my-orders', [FrontController::class , "myOrders"]);
Route::get('/my-order-detail', [FrontController::class , "myOrderDetail"]);
Route::get('/card', [FrontController::class , "card"]);
Route::get('/check-out', [FrontController::class , "checkOut"]);
