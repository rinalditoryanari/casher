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
            ['name' => 'Jeruk Dingin', 'price' => 12000, 'type' => 'drink'],
            ['name' => 'Jeruk Panas', 'price' => 10000, 'type' => 'drink'],
            ['name' => 'Teh Manis', 'price' => 8000, 'type' => 'drink'],
            ['name' => 'Teh Tawar', 'price' => 5000, 'type' => 'drink'],
            ['name' => 'Kopi Dingin', 'price' => 8000, 'type' => 'drink'],
            ['name' => 'Kopi Panas', 'price' => 6000, 'type' => 'drink'],
            ['name' => 'Extra Es Batu', 'price' => 2000, 'type' => 'drink'],

            ['name' => 'Mie Goreng', 'price' => 15000, 'type' => 'food'],
            ['name' => 'Mie Kuah', 'price' => 15000, 'type' => 'food'],
            ['name' => 'Nasi Goreng', 'price' => 15000, 'type' => 'food'],

        ];

        foreach ($products as $product) {
            Product::create($product);
        }
    }
}
