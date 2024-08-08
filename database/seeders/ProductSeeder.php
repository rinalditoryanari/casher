<?php

namespace Database\Seeders;

use App\Models\Product;
use App\Models\Promo;
use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;

class ProductSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        $products = [
            ['name' => 'Jeruk Dingin', 'price' => 12000, 'id_catagory' => 1],
            ['name' => 'Jeruk Panas', 'price' => 10000, 'id_catagory' => 1],
            ['name' => 'Teh Manis', 'price' => 8000, 'id_catagory' => 1],
            ['name' => 'Teh Tawar', 'price' => 5000, 'id_catagory' => 1],
            ['name' => 'Kopi Dingin', 'price' => 8000, 'id_catagory' => 1],
            ['name' => 'Kopi Panas', 'price' => 6000, 'id_catagory' => 1],
            ['name' => 'Extra Es Batu', 'price' => 2000, 'id_catagory' => 1],

            ['name' => 'Mie Goreng', 'price' => 15000, 'id_catagory' => 2],
            ['name' => 'Mie Kuah', 'price' => 15000, 'id_catagory' => 2],
            ['name' => 'Nasi Goreng', 'price' => 15000, 'id_catagory' => 2],

        ];

        Product::createMany($products);
    }
}
