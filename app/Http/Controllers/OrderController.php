<?php

namespace App\Http\Controllers;

use App\Http\Requests\OrderRequest;
use App\Models\Order;
use App\Models\OrderDetail;
use App\Models\Product;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;

class OrderController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        //
    }

    /**
     * Show the form for creating a new resource.
     */
    public function create(OrderRequest $request)
    {
        try {
            //Assign Value
            $id_table = $request['id_table'];
            $ongoing_order = $request['order'];

            $orders = $this->create($id_table, $ongoing_order);

            OrderDetailController::store($orders->id, $ongoing_order);

            dd($ongoing_order);
        } catch (\Throwable $th){
            return response()->json([
                'error' => $th->getMessage(),
                'status' => 402,
            ]);
        }
    }


    /**
     * Store a newly created resource in storage.
     */
    public function store($id_table, $ongoing_order)
    {
        //Check and Calculate The Prices
        $total_price = 0;

        foreach ($ongoing_order as $i => $order_product) {
            $price_item = Product::find($order_product['id_product'])->price;
            $price = $price_item * $order_product['quantity'];

            $ongoing_order[$i]['price_per_item'] = $price;
            $total_price += $price;
        }

        $orders = new Order();
        $orders->id_table = $id_table;
        $orders->total_price = $total_price;
//            $orders->save();
        dd($orders);

        return $orders;
    }

    /**
     * Display the specified resource.
     */
    public function show(string $id)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     */
    public function edit(string $id)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request, string $id)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(string $id)
    {
        //
    }
}
