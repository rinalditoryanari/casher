<?php

namespace Database\Seeders;

use App\Models\Printer;
use Illuminate\Database\Seeder;

class PrinterSeeder extends Seeder
{
    public function run(): void
    {
        $printers = [
            ['name' => 'Printer A (Kasir)', 'id_category' => null, 'bill' => true],
            ['name' => 'Printer B (Bar)', 'id_category' => 1, 'bill' => false],
            ['name' => 'Printer C (Dapur)', 'id_category' => 2, 'bill' => false],
        ];

        Printer::crateMany($printers);
    }
}
