<?php

namespace App\Http\Controllers;

use App\Models\Order;
use App\Models\Printer;

class PrinterController extends Controller
{
    public function orderResponse(Order $orders)
    {
        //set the tempalte response
        $response = $this->generateTemplateOrder($orders);

        //get the non promo
        $edible = $orders->getNonPromoProduct();
        $response = $this->structureOrder($response, $edible);

        $promos = $orders->getPromoProduct();
        $response = $this->structureOrder($response, $promos);

        return $response;
    }

    public function generateTemplateOrder(Order $order)
    {
        $printers = Printer::where('bill', false)->get();

        $template = [];
        foreach ($printers as $printer) {
            $template[] = [
                'printer' => [
                    'name' => $printer->name,
                    'category' => $printer->id_category,
                ],
                'content' => [
                    'table' => $order->table->name,
                    'orders' => [],
                ],
            ];
        }

        return $template;
    }

    public function structureOrder($response, $orders)
    {
        foreach ($orders as $order) {
            $search_field = array_column(array_column($response, 'printer'), 'category');
            $index_category = array_search($order->id_category, $search_field);

            $index_content = array_search($order->name, array_column($response[$index_category]['content']['orders'], 'name'));

            if ($index_content === false) {
                $response[$index_category]['content']['orders'][] = [
                    'name' => $order->name,
                    'quantity' => $order->quantity,
                ];
            } else {
                $response[$index_category]['content']['orders'][$index_content]['quantity'] += $order->quantity;
            }
        }
        return $response;
    }

    public function billResponse(Order $orders,$bill)
    {
        $response = [];

        foreach ($bill['products'] as $product) {
            $response[] = [
                'name' => $product->name,
                'quantity' =>$product->quantity,
                'price' => $product->prices
            ];
        }

        return $response;
    }
}

