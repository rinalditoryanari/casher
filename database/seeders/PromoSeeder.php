<?php

namespace Database\Seeders;

use App\Models\Product;
use App\Models\Promo;
use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;

class PromoSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        $promos = [
            [
                'name' => 'Nasi Goreng + Jeruk',
                'price' => 23000,
                'type' => 'promo',
                'product' => [
                    ['name' => 'Nasi Goreng', 'quantity' => 1],
                    ['name' => 'Jeruk Dingin', 'quantity' => 1]
                ]
            ]
        ];

        // dd($promos);

        foreach ($promos as $promo) {

            $listed_promo = new Product();
            $listed_promo->name = $promo['name'];
            $listed_promo->price = $promo['price'];
            $listed_promo->type = $promo['type'];
            $listed_promo->save();

            foreach ($promo['product'] as $product) {
                $listed_product = new Promo();
                $listed_product->id_promo = $listed_promo->id;
                $listed_product->id_product = Product::where('name', $product['name'])->first()->id;
                $listed_product->quantity = $product['quantity'];
                $listed_product->save();
            }
        }
    }
}
