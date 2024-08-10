<?php

namespace App\Http\Controllers;

use App\Models\Category;
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
        $response = $this->structureOrdera($response, $promos);

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
                    'id_orders' => $order->id,
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

            $index_content = array_search($order->name, $response[$index_category]['content']['orders']);

            if ($index_content == false) {
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

    public function structureOrdera($response, $orders)
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

}

