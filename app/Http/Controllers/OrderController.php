<?php

namespace App\Http\Controllers;

use App\Http\Requests\OrderRequest;
use App\Models\Order;
use App\Models\Product;
use App\Models\Table;
use Illuminate\Http\Request;

class OrderController extends Controller
{
    public function create(OrderRequest $request)
    {
        try {
            $orders = Order::find(26);

            $printerController = new PrinterController();
            $response = $printerController->orderResponse($orders);

            return response()->json([
                'message' => 'Order Succesfull',
                'status' => 'success',
                'id_order' => $orders->id,
                'total_prize' => $orders->total_price,
                'printer_task' => $response,
            ], 201);

        } catch (\Throwable $th) {
            return response()->json([
                'message' => 'Error Occured',
                'error' => $th->getMessage(),
                'status' => 'error',
            ], 402);
        }
    }

    public function store(Table $table, $ongoing_order)
    {
        // List The Product
        $products = [];
        foreach ($ongoing_order as $i => $order_product) {
            $product = Product::find($order_product['id_product']);
            $product->quantity = $order_product['quantity'];
            $products[] = $product;
        }

        $calculate = $this->calculatePrize($products);

        //Save the order and total prize
        $orders = new Order(['total_price' => $calculate['total_price']]);
        $table->order()->save($orders);

        return $orders;
    }

    public function calculatePrize($products)
    {
        $total_price = 0;
        foreach ($products as $i => $product) {
            $product->prices = $product->price * $product->quantity;
            $total_price += $product->prices;
        }
        $calculate = [
            'total_price' => $total_price,
            'products' => $products
        ];

        return $calculate;
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
