<?php

namespace App\Http\Controllers;

use App\Models\Printer;
use Illuminate\Http\Request;

class PrinterController extends Controller
{
    public function index()
    {
        return Printer::all();
    }

    public function store(Request $request)
    {
        $data = $request->validate([
            'name' => ['required'],
            'category_id' => ['required', 'exists:categories'],
            'promo' => ['boolean'],
        ]);

        return Printer::create($data);
    }

    public function show(Printer $printer)
    {
        return $printer;
    }

    public function update(Request $request, Printer $printer)
    {
        $data = $request->validate([
            'name' => ['required'],
            'category_id' => ['required', 'exists:categories'],
            'promo' => ['boolean'],
        ]);

        $printer->update($data);

        return $printer;
    }

    public function destroy(Printer $printer)
    {
        $printer->delete();

        return response()->json();
    }
}
