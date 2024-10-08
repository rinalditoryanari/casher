<?php

namespace App\Http\Controllers;

use App\Models\Order;
use App\Models\OrderDetail;
use App\Models\Product;
use Illuminate\Http\Request;

class OrderDetailController extends Controller
{
    public function index()
    {

    }

    public function store(Order $orders, $ongoing_order)
    {
        foreach ($ongoing_order as $order_product){
            $order_detail = new OrderDetail();
            $order_detail->id_product = $order_product['id_product'];
            $order_detail->quantity = $order_product['quantity'];
            $order_detail->price_per_item = Product::find($order_product['id_product'])->price;
            $orders->order_detail()->save($order_detail);
        }
    }

    public function show($id)
    {
    }

    public function update(Request $request, $id)
    {
    }

    public function destroy($id)
    {
    }
}
