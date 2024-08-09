<?php

namespace App\Http\Controllers;

use App\Models\Order;
use App\Models\Printer;

class PrinterController extends Controller
{
    public function index()
    {
        return Printer::all();
    }

    public function print_order(Order $orders)
    {
        dd($orders);
    }
}
