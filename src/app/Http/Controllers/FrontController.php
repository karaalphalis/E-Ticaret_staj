<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

class FrontController extends Controller
{
    public function index()
    {
        return view("front.index");
    }
    public function productList(){
        return view("front.product-list");
    }
    public function productDetail(){
        return view("front.product-detail");
    }
    public function myOrders(){
        return view("front.my-orders");
    }
    public function myOrderDetail(){
        return view("front.my-order-detail");
    }
    public function card(){
        return view("front.card");
    }
    public function checkOut(){
        return view("front.checkout");
    }
}
