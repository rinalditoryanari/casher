<?php

namespace App\Http\Controllers;

use App\Http\Requests\OrderRequest;
use App\Models\Order;
use App\Models\Product;
use App\Models\Table;
use Illuminate\Http\Request;

class OrderController extends Controller
{
    /**
     * Show the form for creating a new resource.
     */
    public function create(OrderRequest $request)
    {
        try {
            //Assign Value
            $table = Table::find((int)$request['id_table']);
            $ongoing_order = $request['order'];

            $orders = $this->store($table, $ongoing_order);

            $orderDetailController = new OrderDetailController();
            $orderDetailController->store($orders, $ongoing_order);

            $printerController = new PrinterController();
            $response = $printerController->orderResponse($orders);

            return response()->json([
                'message'   => 'Order Succesfull',
                'data'      => $response,
                'status'    => 201,
            ]);

        } catch (\Throwable $th) {
            return response()->json([
                'message'=> 'Error Occured',
                'error'  => $th->getMessage(),
                'status' => 402,
            ]);
        }
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(Table $table, $ongoing_order)
    {
        // Check and Calculate The Prices
        $total_price = 0;
        foreach ($ongoing_order as $i => $order_product) {
            $product = Product::find($order_product['id_product']);
            $price_item = $product->price;
            $price = $price_item * $order_product['quantity'];

            $ongoing_order[$i]['price_per_item'] = $price_item;
            $total_price += $price;
        }

        $orders = new Order(['total_price' => $total_price]);
        $table->order()->save($orders);

        return $orders;
    }

    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        //
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
